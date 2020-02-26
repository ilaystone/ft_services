#!/bin/bash

RED="\033[1;31m"
NC="\033[0m"
GREEN="\033[0;32m"

if [ "$1" == 'delete' ]
then
	kubectl delete secret minikubeip
	kubectl delete -k ./src/
elif [ "$1" == "describe" ]
then
	clear
	echo "--------------"
	echo "  pods"
	echo "--------------"
	kubectl get pod -o wide
	echo "--------------"
	echo "  svc"
	echo "--------------"
	kubectl get svc
	echo "--------------"
	echo "  deployment"
	echo "--------------"
	kubectl get deployment
	echo "--------------"
	echo "  ingresses"
	echo "--------------"
	kubectl get ingress
	echo "--------------"
	echo "  Volume Claim"
	echo "--------------"
	kubectl get pvc -o wide
	echo "--------------"
	echo "  Volume"
	echo "--------------"
	kubectl get pv -o wide
elif [ "$1" == "" ]
then
	if ! minikube status >/dev/null 2>&1
	then
    	echo -e "$REF Minikube is not started! Starting now... $NC"
    	if ! minikube start --vm-driver=virtualbox
		then
        	echo "$RED CONNOT START MINIKUBE !!! $NC"
        	exit 1
    	fi
	fi
	MK=$(minikube ip)
	sed -i '' "s/##IP##/$MK/g" src/grafana/datasources/datasource.yaml
	minikube addons enable dashboard
	minikube addons enable ingress
	eval $(minikube -p minikube docker-env)
	docker build -t ftps-image ./src/ftps/
	docker build -t nginx-image ./src/nginx
	docker build -t phpmyadmin-image ./src/phpmyadmin
	docker build -t mysql-image ./src/mysql
	docker build -t wordpress-image ./src/wordpress
	docker build -t telegraf-image ./src/telegraf
	docker build -t grafana-image ./src/grafana
	sed -i '' "s/$MK/##IP##/g" src/grafana/datasources/datasource.yaml
	kubectl create secret generic minikubeip --from-literal=minikubeip=${MK}
	kubectl apply -k ./src/
	echo -e "Minikube generated IP is"
	echo -e "${GREEN}${MK}${NC}"
	echo -e "dashboard is being served at:"
	echo -e "${GREEN}http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/${NC}"
	kubectl proxy > /dev/null
elif [ "$1" == "terminate" ]
then
	minikube delete
else
	echo "this script only works with the following arguments:"
	echo "		-describe"
	echo "		-delete"
	echo "		-terminate"
fi