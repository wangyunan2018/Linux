#!/bin/bash

check_code_status() {
    if [ $? -eq 0 ]; then
        echo "返回状态码：$?，SUCCESS !"
    else
        echo "返回状态码：$?，FAIL !"
    fi
}

file_host_path=.

for i in $(cat $file_host_path/mount_host.txt); do
    ssh root@$i "mount.cifs //11.18.1.141/ubuntu-share/ /share -o rw,uid=1000,gid=1000,username=thago,password=1234;df -h;echo '//11.18.1.141/ubuntu-share/   /share    cifs    username=thago,password=1234 0 0' >> /etc/fstab"
    check_code_status
done
