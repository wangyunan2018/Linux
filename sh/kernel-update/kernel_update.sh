#!/bin/bash

# 返回状态码检查
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

# 计时
timer(){
	echo "5"
	sleep 1
	echo "4"
	sleep 1
	echo "3"
	sleep 1
	echo "2"
	sleep 1
	echo "1"
}

# 获取指定版本内核
kernel_version=kernel-lt-4.4.23-1.el7.elrepo.x86_64.rpm
kernel_download=http://mirrors.coreix.net/elrepo-archive-archive/kernel/el7/x86_64/RPMS/$kernel_version
wget $kernel_download
check_status_code

# 安装
rpm -ivh $kernel_version
check_status_code

# 修改 GRUB 配置
sed -i 's/GRUB_DEFAULT=saved/GRUB_DEFAULT=0/' /etc/default/grub
check_status_code

# 重新创建内核配置
grub2-mkconfig -o /boot/grub2/grub.cfg
check_status_code

# 查看内核版本
echo
uname -a
echo

echo "###系统即将重启###"
timer
reboot