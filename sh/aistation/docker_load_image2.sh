#!/bin/bash

docker load -i resource-service.tar
sleep 2
docker load -i ivision.tar
sleep 2
docker load -i imonitor-service.tar
sleep 2
docker load -i iresource-cachedata.tar
sleep 2
docker load -i ibase-service.tar
sleep 2
docker load -i iauth-service.tar
sleep 2
docker load -i aistation-api-gateway.tar
sleep 2
docker load -i aistation-config.tar
sleep 2
docker load -i k8s-rdma-sriov-dev-plugin.tar
sleep 2
docker load -i nvidia-gpu-device-plugin.tar
sleep 2
docker load -i gpu-device-plugin.tar
sleep 2
docker load -i alert-engine.tar
sleep 2
docker load -i tf_operator.tar
sleep 2
docker load -i mxnet-operator.tar
sleep 2
docker load -i pytorch-operator.tar
sleep 2
docker load -i mpi-operator.tar
sleep 2
docker load -i tensorflow114.tar
sleep 2
docker load -i pytorch110.tar
sleep 2
docker load -i influxdb177.tar
sleep 2
docker load -i centos-source-mariadb10310.tar
sleep 2
docker load -i nginx115.tar
sleep 2
docker load -i metrics-server-amd64v032.tar
sleep 2
docker load -i kube-proxyv1141.tar
sleep 2
docker load -i kube-apiserverv1141.tar
sleep 2
docker load -i kube-controller-managerv1141.tar
sleep 2
docker load -i kube-scheduler.tar
sleep 2
docker load -i corednsv150.tar
sleep 2
docker load -i k8s-helmv2131.tar
sleep 2
docker load -i kubernetes-helm-tillerv2131.tar
sleep 2
docker load -i cluster-proportional-autoscaler-amd64v140.tar
sleep 2
docker load -i k8s-dns-node-cachev1151.tar
sleep 2
docker load -i etcdv3226.tar
sleep 2
docker load -i nginx-ingress-controllerv0210.tar
sleep 2
docker load -i kubernetes-dashboard-amd64v1101.tar
sleep 2
docker load -i calico-nodev340.tar
sleep 2
docker load -i calico-cniv340.tar
sleep 2
docker load -i calico-kube-controllersv340.tar
sleep 2
docker load -i ambassadorv0370.tar
sleep 2
docker load -i addon-resizerv183.tar
sleep 2
docker load -i pause-amd64v31.tar
sleep 2
docker load -i pausev31.tar
sleep 2
docker load -i centos-source-haproxy.tar
sleep 2
docker load -i centos-source-keepalived.tar