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
    ssh root@$i "yum install samba -y;yum install cifs-utils -y;systemctl start smb;systemctl enable smb"
    check_code_status
done
