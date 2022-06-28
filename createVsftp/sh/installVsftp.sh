#!/bin/bash

# 安装
vsftpd -v
if [ $? -ne 0 ]; then
    yum install -y vsftpd && systemctl start vsftpd && systemctl enable vsftpd && systemctl status vsftpd
    if [ $? -eq 0 ]; then
        echo "vsftp installation successfully."
    else
        echo "vsftp installation failed."
    fi

    # 修改配置文件
    configPath=/etc/vsftpd
    config=/etc/vsftpd/vsftpd.conf
    pamVsftpConfig=/etc/pam.d/vsftpd
    cp $config $configPath/vsftpd.conf.bak

    sed -i 's/anonymous_enable=YES/anonymous_enable=NO/g' $config
    sed -i 's/#anon_mkdir_write_enable=YES/anon_mkdir_write_enable=YES/g' $config
    sed -i 's/#chown_uploads=YES/chown_uploads=YES/g' $config
    sed -i 's/#async_abor_enable=YES/async_abor_enable=YES/g' $config
    sed -i 's/#aascii_upload_enable=YES/ascii_upload_enable=YES/g' $config
    sed -i 's/#ascii_download_enable=YES/ascii_download_enable=YES/g' $config
    sed -i 's/#ftpd_banner=Welcome to blah FTP service./ftpd_banner=Welcome to blah FTP service./g' $config
    sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/g' $config
    sed -i 's/#chroot_list_enable=YES/chroot_list_enable=YES/g' $config
    sed -i 's/#chroot_list_file=/etc/vsftpd/chroot_list/chroot_list_file=/etc/vsftpd/chroot_list/g' $config
    sed -i "s/pam_shells.so/pam_nologin.so/g" $pamVsftpConfig

cat >> $config << EOF
pam_service_name=vsftpd
userlist_enable=YES
tcp_wrappers=YES
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
fi
