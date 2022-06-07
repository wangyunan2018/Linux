#!/bin/bash

file_path1=./host.txt

for i in $(cat $file_path1); do
    #ssh-copy-id -i ~/.ssh/id_rsa.pub root@$i
    # ssh root@$i 'hostname && pwd && ls -lh && echo "$HOSTNAME 即将关机..." && echo "$HOSTNAME 已关机"'
    ssh root@$i 'systemctl stop docker && echo "$HOSTNAME 即将在3秒后关机" && sleep 3 && /usr/sbin/poweroff'
done