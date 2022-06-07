#!/bin/bash
docker tag registry.aliyuncs.com/google_containers/kube-proxy:v1.19.3 k8s.gcr.io/kube-proxy:v1.19.3
docker tag registry.aliyuncs.com/google_containers/kube-apiserver:v1.19.3 k8s.gcr.io/kube-apiserver:v1.19.3
docker tag registry.aliyuncs.com/google_containers/kube-controller-manager:v1.19.3 k8s.gcr.io/kube-controller-manager:v1.19.3
docker tag registry.aliyuncs.com/google_containers/kube-scheduler:v1.19.3 k8s.gcr.io/kube-scheduler:v1.19.3
docker tag registry.aliyuncs.com/google_containers/etcd:3.4.13-0 k8s.gcr.io/etcd:3.4.13-0
docker tag registry.aliyuncs.com/google_containers/coredns:1.7.0 k8s.gcr.io/coredns:1.7.0
docker tag registry.aliyuncs.com/google_containers/pause:3.2 k8s.gcr.io/pause:3.2

docker rmi -f registry.aliyuncs.com/google_containers/kube-proxy:v1.19.3
docker rmi -f registry.aliyuncs.com/google_containers/kube-apiserver:v1.19.3
docker rmi -f registry.aliyuncs.com/google_containers/kube-controller-manager:v1.19.3
docker rmi -f registry.aliyuncs.com/google_containers/kube-scheduler:v1.19.3
docker rmi -f registry.aliyuncs.com/google_containers/etcd:3.4.13-0
docker rmi -f registry.aliyuncs.com/google_containers/coredns:1.7.0
docker rmi -f registry.aliyuncs.com/google_containers/pause:3.2
