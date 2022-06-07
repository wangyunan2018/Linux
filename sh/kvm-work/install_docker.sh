#!/bin/bash

check_code_status() {
    if [ $? -eq 0 ]; then
        echo "返回状态码：$?，SUCCESS !"
    else
        echo "返回状态码：$?，FAIL !"
    fi
}

file_host_path=.

for i in $(cat $file_host_path/host.txt); do
    ssh root@$i 'curl -fsSL https://get.docker.com/ | sh;sleep 3;systemctl start docker;systemctl status docker;sleep 1;echo '{"registry-mirrors": ["https://u8n2zdxj.mirror.aliyuncs.com"]}' > /etc/docker/daemon.json;systemctl daemon-reload;sleep 1;systemctl restart docker;sleep 1;systemctl status docker;cat /etc/docker/daemon.json'
    check_code_status
done
