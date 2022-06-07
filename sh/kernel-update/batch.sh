#!/bin/bash

check_status_code(){
	if [ $? -eq 0 ]; then
		echo
		echo "return status code: $?, SUCCESS !"
		echo
	else
		echo
		echo "return status code: $?, FAIL ! Please check."
		echo
	fi
}

hosts_path=.
chmod +x $hosts_path/kernel_update.sh

for i in $(cat $hosts_path/hosts.txt); do
    # 拷贝hosts.txt、kernel_update.sh到远程主机
    scp $hosts_path/hosts.txt root@$i:/root/
    check_status_code
    scp $hosts_path/kernel_update.sh root@$i:/root/
    check_status_code

    # 远程执行脚本
    ssh root@$i "/bin/bash /root/kernel_update.sh"
    check_status_code
done