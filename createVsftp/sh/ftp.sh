#!/bin/bash

# 判断是否已安装vsftp
vsftpd -v
if [ $? -ne 0 ]; then
    yum install -y vsftpd && systemctl start vsftpd && systemctl enable vsftpd && systemctl status vsftpd
    if [ $? -eq 0 ]; then
        echo "vsftp installation successfully."
    else
        # 如果安装失败，请手动安装，然后根据脚本下面的步骤修改vsftp配置文件，重启vsftp后再执行脚本。
        echo "vsftp installation failed."
        exit
    fi

    # 修改vsftp配置文件
    config=/etc/vsftpd/vsftpd.conf
    pamVsftpConfig=/etc/pam.d/vsftpd
    cp $config $config.bak

    sed -i 's/anonymous_enable=YES/anonymous_enable=NO/g' $config
    sed -i 's/#anon_mkdir_write_enable=YES/anon_mkdir_write_enable=YES/g' $config
    sed -i 's/#chown_uploads=YES/chown_uploads=YES/g' $config
    sed -i 's/#async_abor_enable=YES/async_abor_enable=YES/g' $config
	sed -i 's/#ascii_upload_enable=YES/ascii_upload_enable=YES/g' $config
    sed -i 's/#ascii_download_enable=YES/ascii_download_enable=YES/g' $config
    sed -i 's/#ftpd_banner/ftpd_banner/g' $config
    sed -i 's/#chroot_local_user=YES/chroot_local_user=NO/g' $config
    sed -i 's/#chroot_list_enable=YES/chroot_list_enable=YES/g' $config
    sed -i 's/#chroot_list_file/chroot_list_file/g' $config
    sed -i 's/pam_shells.so/pam_nologin.so/g' $pamVsftpConfig

cat >> $config << EOF
pasv_min_port=4500
pasv_max_port=5000
allow_writeable_chroot=YES
EOF

    if [ $? -eq 0 ]; then
        echo "vsftp config modified successfully."
    else
        echo "vsftp config modification failed."
    fi

    systemctl restart vsftpd

else
    echo "vsftp already installed"
    echo "next will create vsftp user..."
fi

# 创建FTP用户
while true; do
    read -p "创建ftp用户前请确保ftp路径(修改ftpPath变量值)已正确设置: [yes/no]" content
    case $content in
        [yY]|[yY]es )
			echo "我已准备好，开始创建ftp用户：";
			break;;
        [nN]|[nN]o )
			echo "程序已退出。"
			exit;;
        * )
			echo "请输入yes或者no";;
    esac
done

check_status_code() {
    if [ $? -eq 0 ]; then
        echo "return status code: $?, success"
    else
        echo "return status code: $?, failed"
    fi
}

# 新增用户只需将ftpPath路径替换成你自己的ftp目录即可执行脚本
ftpPath=/opt/wyn/ftp
ftpConfig=/etc/vsftpd

# 判断ftp目录是否存在
if [ ! -d $ftpPath ]; then
    echo "ftp目录不存在，创建对应目录: "
    mkdir -p $ftpPath
    chmod -R 700 $ftpPath
    if [ $? -eq 0 ]; then
        echo "ceated successfully."
        echo
    else
        echo "create failed."
        echo
    fi
else
    echo "directory already exists."
fi

echo "请输入vsftp用户名："
read user_name
if id $user_name; then
    if [ $? -eq 0 ]; then
        echo "用户名已存在，程序已退出。"
        exit
    fi
fi

echo "添加vsftp账号："
useradd -s /sbin/nologin -d $ftpPath $user_name
chown -R $user_name:$user_name $ftpPath
echo

echo "请输入vsftp账号密码："
passwd $user_name
check_status_code
echo

echo "$user_name" >> $ftpConfig/chroot_list
check_status_code

echo "重启vsftp服务："
systemctl restart vsftpd
check_status_code
# echo "该文件夹为ftp指定目录，如需使用ftp客户端上传超大文件，请联系平台管理员或销售人员获取ftp账号。" >> $ftpPath/README