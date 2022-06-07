#!/bin/bash

echo "###该脚本在node节点上执行###"
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
sleep 1
systemctl enable kubelet
systemctl status kubelet
check_code_status
echo "由于还没有加入到集群，所以此刻的kubelet状态处于异常"
echo

echo "###添加hosts解析###"
cat << EOF >> /etc/hosts
199.232.68.133 raw.githubusercontent.com
EOF

check_code_status
echo

echo "请在master节点执行此命令："
echo
echo "kubeadm token create --print-join-command"

