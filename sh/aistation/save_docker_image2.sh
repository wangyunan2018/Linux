#!/bin/bash

docker save 172.16.17.101:5000/aistation/iresource-service:latest -o ./resource-service.tar
sleep 2
docker save 172.16.17.101:5000/aistation/ivision:latest -o ./ivision.tar
sleep 2
docker save 172.16.17.101:5000/aistation/imonitor-service:latest -o ./imonitor-service.tar
sleep 2
docker save 172.16.17.101:5000/aistation/iresource-cachedata:latest -o ./iresource-cachedata.tar
sleep 2
docker save 172.16.17.101:5000/aistation/ibase-service:latest -o ./ibase-service.tar
sleep 2
docker save 172.16.17.101:5000/aistation/iauth-service:latest -o ./iauth-service.tar
sleep 2
docker save 172.16.17.101:5000/aistation/aistation-api-gateway:latest -o ./aistation-api-gateway.tar
sleep 2
docker save 172.16.17.101:5000/aistation/aistation-config:latest -o ./aistation-config.tar
sleep 2
docker save 172.16.17.101:5000/aistation/k8s-rdma-sriov-dev-plugin:latest -o ./k8s-rdma-sriov-dev-plugin.tar
sleep 2
docker save 172.16.17.101:5000/aistation/nvidia-gpu-device-plugin:latest -o ./nvidia-gpu-device-plugin.tar
sleep 2
docker save 172.16.17.101:5000/aistation/gpu-device-plugin:latest -o ./gpu-device-plugin.tar
sleep 2
docker save 172.16.17.101:5000/aistation/alert-engine:latest -o ./alert-engine.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/tf_operator:v0.5.0 -o ./tf_operator.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/mxnet-operator:v1beta1 -o ./mxnet-operator.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/pytorch-operator:ldl04 -o ./pytorch-operator.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/mpi-operator:dev -o ./mpi-operator.tar
sleep 2
docker save 172.16.17.101:5000/tensorflow/tensorflow:1.14-cuda10-py36 -o ./tensorflow114.tar
sleep 2
docker save 172.16.17.101:5000/pytorch/pytorch:1.1.0-cuda10-py36 -o ./pytorch110.tar
sleep 2
docker save 172.16.17.101:5000/aistation/influxdb:1.7.7 -o ./influxdb177.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/centos-source-mariadb:10.3.10 -o ./centos-source-mariadb10310.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/nginx:1.15 -o ./nginx115.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/metrics-server-amd64:v0.3.2 -o ./metrics-server-amd64v032.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/kube-proxy:v1.14.1 -o ./kube-proxyv1141.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/kube-apiserver:v1.14.1 -o ./kube-apiserverv1141.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/kube-controller-manager:v1.14.1 -o ./kube-controller-managerv1141.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/kube-scheduler:v1.14.1 -o ./kube-scheduler.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/coredns:1.5.0 -o ./corednsv150.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/k8s-helm:v2.13.1 -o ./k8s-helmv2131.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/kubernetes-helm-tiller:v2.13.1 -o ./kubernetes-helm-tillerv2131.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/cluster-proportional-autoscaler-amd64:1.4.0 -o ./cluster-proportional-autoscaler-amd64v140.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/k8s-dns-node-cache:1.15.1 -o ./k8s-dns-node-cachev1151.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/etcd:v3.2.26 -o ./etcdv3226.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/nginx-ingress-controller:0.21.0 -o ./nginx-ingress-controllerv0210.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/kubernetes-dashboard-amd64:v1.10.1 -o ./kubernetes-dashboard-amd64v1101.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/calico/node:v3.4.0 -o  ./calico-nodev340.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/calico/cni:v3.4.0 -o ./calico-cniv340.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/calico/kube-controllers:v3.4.0 -o ./calico-kube-controllersv340.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/ambassador:0.37.0 -o ./ambassadorv0370.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/addon-resizer:1.8.3 -o ./addon-resizerv183.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/pause-amd64:3.1 -o ./pause-amd64v31.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/pause:3.1 -o ./pausev31.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/centos-source-haproxy:aistation.0.0.200 -o ./centos-source-haproxy.tar
sleep 2
docker save 172.16.17.101:5000/com.inspur/centos-source-keepalived:aistation.0.0.200 -o ./centos-source-keepalived.tar