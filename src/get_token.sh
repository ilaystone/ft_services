#!/bin/bash

kubectl delete -f ./src/dashboard/admin-user.yml > /dev/null
kubectl apply -f ./src/dashboard/admin-user.yml > /dev/null
var=$(kubectl describe sa admin-user -n kube-system | grep 'Mountable secrets:' | cut -b 22-)
kubectl describe secret "$var" -n kube-system | grep 'token:' | cut -b 13-