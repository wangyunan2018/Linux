#!/bin/bash

# 执行脚本前先安装vsftp
# yum install -y vsftpd && systemctl start vsftpd && systemctl enable vsftpd && systemctl status vsftpd
# check_status_code
# sleep 1

check_status_code() {
    if [ $? -eq 0 ]; then
        echo "返回状态码：$?，SUCCESS"
    else
        echo "返回状态码：$?，FAIL"
    fi
}

# 新增用户只需把 thago 这个单词替换下即可执行脚本
ftp_file_path_ftp=/opt/wyn/ftp
ftp_file_path=/home/opt/wyn
ftp_config_path=/etc/vsftpd

# 备份vsftpd.conf、chroot_list
cp $ftp_config_path/vsftpd.conf $ftp_config_path/vsftpd.conf.bak
cp $ftp_config_path/chroot_list $ftp_config_path/chroot_list.bak

# 判断vsftp目录是否存在
if [ -d $ftp_file_path ]; then
    echo "vsftp目录已存在，修改目录权限为：755"
    chmod -R 755 $ftp_file_path
    echo
else
    echo "vsftp目录不存在，开始创建:"
    mkdir -p $ftp_file_path
    chmod -R 755 $ftp_file_path
    check_status_code
    echo
fi

echo "请输入vsftp用户名："
read user_name
echo "添加vsftp账号："
useradd -s /sbin/nologin -d $ftp_file_path_ftp $user_name
check_status_code

echo
echo "请输入vsftp账号密码："
passwd $user_name
check_status_code
echo

if $(cat $ftp_config_path/chroot_list | grep -w "$user_name" > $ftp_config_path/user.txt); then
    if [ -s $ftp_config_path/user.txt ]; then
        echo "chroot_list中已存在该用户"
        echo
    fi
else
    echo "chroot_list中不存在该用户"
    echo "用户不存在，追加vsftp新用户到chroot_list中："
    echo "$user_name" >> $ftp_config_path/chroot_list
    check_status_code
    echo
fi

echo "重启vsftp服务："
systemctl restart vsftpd
check_status_code

sleep 1
echo "该文件夹为ftp指定目录，如需使用ftp客户端上传超大文件，请联系平台管理员或销售人员获取ftp账号。" >> $ftp_file_path_ftp/README