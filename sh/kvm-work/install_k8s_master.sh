#!/bin/bash

echo "执行该脚本前请修改[master1 IP]地址"
echo ""
echo "###该脚本在master1上执行###"
systemctl stop firewalld.service
systemctl disable firewalld.service

check_code_status() {
    if [ $? -eq 0 ]; then
        echo "返回状态码：$?，SUCCESS !"
    else
        echo "返回状态码：$?，FAIL !"
    fi
}

echo "###修改内核参数###"
cat << EOF >> /etc/sysctl.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-arptables = 1
net.ipv4.ip_forward = 1
EOF

sysctl -p
check_code_status
echo

echo "###添加阿里云源###"
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF

check_code_status
echo

echo "###安装kubeadm、kubelet###"
yum install -y kubelet-1.19.3 kubeadm-1.19.3 kubectl-1.19.3
systemctl enable kubelet
systemctl status kubelet
check_code_status
echo

echo "###下载k8s所需镜像###"
kubeadm config images pull --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.19.3
check_code_status
sleep 2
echo

echo "###给镜像重新打tag并删除原有镜像###"
docker tag registry.aliyuncs.com/google_containers/kube-proxy:v1.19.3 k8s.gcr.io/kube-proxy:v1.19.3
docker tag registry.aliyuncs.com/google_containers/kube-apiserver:v1.19.3 k8s.gcr.io/kube-apiserver:v1.19.3
docker tag registry.aliyuncs.com/google_containers/kube-controller-manager:v1.19.3 k8s.gcr.io/kube-controller-manager:v1.19.3
docker tag registry.aliyuncs.com/google_containers/kube-scheduler:v1.19.3 k8s.gcr.io/kube-scheduler:v1.19.3
docker tag registry.aliyuncs.com/google_containers/etcd:3.4.13-0 k8s.gcr.io/etcd:3.4.13-0
docker tag registry.aliyuncs.com/google_containers/coredns:1.7.0 k8s.gcr.io/coredns:1.7.0
docker tag registry.aliyuncs.com/google_containers/pause:3.2 k8s.gcr.io/pause:3.2
sleep 2

docker rmi -f registry.aliyuncs.com/google_containers/kube-proxy:v1.19.3
sleep 1
docker rmi -f registry.aliyuncs.com/google_containers/kube-apiserver:v1.19.3
sleep 1
docker rmi -f registry.aliyuncs.com/google_containers/kube-controller-manager:v1.19.3
sleep 1
docker rmi -f registry.aliyuncs.com/google_containers/kube-scheduler:v1.19.3
sleep 1
docker rmi -f registry.aliyuncs.com/google_containers/etcd:3.4.13-0
sleep 1
docker rmi -f registry.aliyuncs.com/google_containers/coredns:1.7.0
sleep 1
docker rmi -f registry.aliyuncs.com/google_containers/pause:3.2
check_code_status
echo

echo "###初始化master###"
# 注意，需要把下面的 api-server 的IP地址修改成自己机器的！
kubeadm init \
    --apiserver-advertise-address 192.168.0.102 \
    --image-repository registry.aliyuncs.com/google_containers \
    --kubernetes-version v1.19.3 \
    --service-cidr=10.96.0.0/12 \
    --pod-network-cidr=10.244.0.0/16

check_code_status
sleep 1
echo

echo "###配置kubectl###"
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
echo "source <(kubectl completion bash)" >> ~/.bashrc
source ~/.bashrc
check_code_status
echo

echo "###添加hosts解析，配置flannel网络插件###"
cat << EOF >> /etc/hosts
199.232.68.133 raw.githubusercontent.com
EOF

wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml && kubectl apply -f kube-flannel.yml
check_code_status
echo

echo "###允许master节点部署pod###"
kubectl taint nodes --all node-role.kubernetes.io/master-
systemctl restart kubelet.service
check_code_status

echo "配置好node节点后再执行以下命令："
echo
echo "kubeadm token create --print-join-command"