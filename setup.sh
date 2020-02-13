#!/bin/bash

################################################################################
#				checking docker / kubernetes state							   #
################################################################################

# if ! docker ps > /dev/null 2>&1
# then
# 	echo "launch docker"
# 	exit 1
# fi
# if ! kubectl get pods > /dev/null 2>&1
# then
# 	echo "launch kubernets docker"
# 	exit 1
# fi

################################################################################
#				DashBoard													   #
################################################################################

if [ "$1" == 'delete' ]
then
	kubectl delete -k ./src/
	kubectl delete secret tls-key
elif [ "$1" == "describe" ]
then
	echo "--------------"
	echo "  pods"
	echo "--------------"
	kubectl get pod
	echo "--------------"
	echo "  svc"
	echo "--------------"
	kubectl get svc
	echo "--------------"
	echo "  deployment"
	echo "--------------"
	kubectl get deployment
else
	kubectl apply -k ./src/
	kubectl create secret tls tls-key --key ./src/nginx/tls.key\
			--cert ./src/nginx/tls.crt
fi

################################################################################
#				Token generated to loging to dash board						   #
################################################################################
# echo -n -e "to get login token launch \033[1;32m./src/get_token.sh\n"
# kubectl proxy