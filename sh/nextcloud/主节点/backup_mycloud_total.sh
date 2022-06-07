#!/bin/bash

# check status code
check_status_code() {
	if [ $? -eq 0 ]; then
		echo "返回状态码：$?，备份成功"
	else
		echo "返回状态码：$?，备份异常"
	fi
}

# video
file_path1=/var/data/nextcloud/wangyunan/files/video
file_path2=/root/log/video
file_path3=/var/data/nextcloud/wangyunan/files/video/me
file_path4=/var/data/nextcloud/wangyunan/files/video/other
file_path5=/var/data/nextcloud/wangyunan/files/video/site
file_path6=/var/data/nextcloud/wangyunan/files/video/wx-friends
backup_wangyunan_video_me=/var/data/nextcloud/backup_wangyunan/video/me
backup_wangyunan_video_other=/var/data/nextcloud/backup_wangyunan/video/other
backup_wangyunan_video_site=/var/data/nextcloud/backup_wangyunan/video/site
backup_wangyunan_video_wx_friends=/var/data/nextcloud/backup_wangyunan/video/wx-friends
backup_host_dir=/backup/wangyunan

# 检查video/me目录是否有更新
if find $file_path3 -mtime -1 > $file_path2/video_me_update.txt ; then
    if [ ! -s $file_path2/video_me_update.txt ]; then
        echo "video/me目录中的文件一天之内没有做更改，不执行备份操作"
    else
        echo "检测到video/me目录中的文件有更新:"
        echo "更新的文件："

        cat $file_path2/video_me_update.txt

        echo ""
        echo "########## 开始备份video/me ##########"
        cd $file_path3
        tar -czvf $backup_wangyunan_video_me/me.tar *
        check_status_code
        echo
        sleep 1
        echo "########## 开始备份video/me到备份服务器 ##########"
        scp $backup_wangyunan_video_me/me.tar root@192.168.0.105:$backup_host_dir/video/me
        check_status_code
        echo
        sleep 1
        rm -f $backup_wangyunan_video_me/me.tar
    fi
fi
sleep 1

# 检查video/other目录是否有更新
if find $file_path4 -mtime -1 > $file_path2/video_other_update.txt ; then
    if [ ! -s $file_path2/video_other_update.txt ]; then
        echo "video/other目录中的文件一天内之内没有做更改，不执行备份操作"
    else
        echo "检测到video/other目录中的文件有更新:"
        echo "更新的文件："

        cat $file_path2/video_other_update.txt

        echo ""
        echo "########## 开始备份video/other ##########"
        cd $file_path4
        tar -czvf $backup_wangyunan_video_other/other.tar *
        check_status_code
        echo
        sleep 1
        echo "########## 开始备份video/other到备份服务器 ##########"
        scp $backup_wangyunan_video_other/other.tar root@192.168.0.105:$backup_host_dir/video/other
        check_status_code
        echo
        sleep 1
        rm -f $backup_wangyunan_video_other/other.tar
    fi
fi
sleep 1

# 检查video/site目录是否有更新
if find $file_path5 -mtime -1 > $file_path2/video_site_update.txt ; then
    if [ ! -s $file_path2/video_site_update.txt ]; then
        echo "video/site目录中的文件一天内之内没有做更改，不执行备份操作"
    else
        echo "检测到video/site目录中的文件有更新:"
        echo "更新的文件："

        cat $file_path2/video_site_update.txt

        echo ""
        echo "########## 开始备份video/site ##########"
        cd $file_path5
        tar -czvf $backup_wangyunan_video_site/site.tar *
        check_status_code
        echo
        sleep 1
        echo "########## 开始备份video/site到备份服务器 ##########"
        scp $backup_wangyunan_video_site/site.tar root@192.168.0.105:$backup_host_dir/video/site
        check_status_code
        echo
        sleep 1
        rm -f $backup_wangyunan_video_site/site.tar
    fi
fi
sleep 1

# 检查video/wx-friends目录是否有更新
if find $file_path6 -mtime -1 > $file_path2/video_wx-friends_update.txt ; then
    if [ ! -s $file_path2/video_wx-friends_update.txt ]; then
        echo "video/wx-friends目录中的文件一天内之内没有做更改，不执行备份操作"
    else
        echo "检测到video/wx-friends目录中的文件有更新:"
        echo "更新的文件："

        cat $file_path2/video_wx-friends_update.txt

        echo ""
        echo "########## 开始备份video/wx-friends ##########"
        cd $file_path6
        tar -czvf $backup_wangyunan_video_wx_friends/wx-friends.tar *
        check_status_code
        echo
        sleep 1
        echo "########## 开始备份video/wx-friends到备份服务器 ##########"
        scp $backup_wangyunan_video_wx_friends/wx-friends.tar root@192.168.0.105:$backup_host_dir/video/wx-friends
        check_status_code
        echo
        sleep 1
        rm -f $backup_wangyunan_video_wx_friends/wx-friends.tar
    fi
fi
sleep 1

# tmp
file_path_tmp1=/var/data/nextcloud/wangyunan/files/tmp
file_path_tmp2=/root/log/tmp
backup_wangyunan_tmp=/var/data/nextcloud/backup_wangyunan/tmp

# 检查临时文件夹tmp目录是否有更新
if find $file_path_tmp1 -mtime -1 > $file_path_tmp2/tmp_update.txt ; then
    if [ ! -s $file_path_tmp2/tmp_update.txt ]; then
        echo "tmp目录中的文件一天内之内没有做更改，不执行备份操作"
    else
        echo "检测到tmp目录中的文件有更新:"
        echo "更新的文件："

        cat $file_path_tmp2/tmp_update.txt

        echo ""
        echo "########## 开始备份tmp ##########"
        cd $file_path_tmp1
        tar -czvf $backup_wangyunan_tmp/tmp.tar *
        check_status_code
        echo
        sleep 1
        echo "########## 开始备份tmp到备份服务器 ##########"
        scp $backup_wangyunan_tmp/tmp.tar root@192.168.0.105:$backup_host_dir/tmp
        check_status_code
        echo
        sleep 1
        rm -f $backup_wangyunan_tmp/tmp.tar
    fi
fi
sleep 1

# text-file
file_path_text_file1=/var/data/nextcloud/wangyunan/files/text-file
file_path_text_file2=/root/log/text-file
backup_wangyunan_text_file=/var/data/nextcloud/backup_wangyunan/text-file

# 检查text-file目录是否有更新
if find $file_path_text_file1 -mtime -1 > $file_path_text_file2/text_file_update.txt ; then
    if [ ! -s $file_path_text_file2/text_file_update.txt ]; then
        echo "text-file目录中的文件一天内之内没有做更改，不执行备份操作"
    else
        echo "检测到text-file目录中的文件有更新:"
        echo "更新的文件："

        cat $file_path_text_file2/text_file_update.txt

        echo ""
        echo "########## 开始备份text-file ##########"
        cd $file_path_text_file1
        tar -czvf $backup_wangyunan_text_file/text-file.tar *
        check_status_code
        echo
        sleep 1
        echo "########## 开始备份text-file到备份服务器 ##########"
        scp $backup_wangyunan_text_file/text-file.tar root@192.168.0.105:$backup_host_dir/text-file
        check_status_code
        echo
        sleep 1
        rm -f $backup_wangyunan_text_file/text-file.tar
    fi
fi
sleep 1

# learning
file_path_learning1=/var/data/nextcloud/wangyunan/files/learning
file_path_learning2=/root/log/learning
backup_wangyunan_learning=/var/data/nextcloud/backup_wangyunan/learning

# 检查learning目录是否有更新
if find $file_path_learning1 -mtime -1 > $file_path_learning2/learning_update.txt ; then
    if [ ! -s $file_path_learning2/learning_update.txt ]; then
        echo "learning目录中的文件一天内之内没有做更改，不执行备份操作"
    else
        echo "检测到learning目录中的文件有更新:"
        echo "更新的文件："

        cat $file_path_learning2/learning_update.txt

        echo ""
        echo "########## 开始备份learning ##########"
        cd $file_path_learning1
        tar -czvf $backup_wangyunan_learning/learning.tar *
        check_status_code
        echo
        sleep 1
        echo "########## 开始备份learning到备份服务器 ##########"
        scp $backup_wangyunan_learning/learning.tar root@192.168.0.105:$backup_host_dir/learning
        check_status_code
        echo
        sleep 1
        rm -f $backup_wangyunan_learning/learning.tar
    fi
fi
sleep 1

# img/me
file_path_img_me1=/var/data/nextcloud/wangyunan/files/img/me
file_path_img_me2=/root/log/img
backup_wangyunan_img_me=/var/data/nextcloud/backup_wangyunan/img/me

# 检查img/me目录是否有更新
if find $file_path_img_me1 -mtime -1 > $file_path_img_me2/img_me_update.txt ; then
    if [ ! -s $file_path_img_me2/img_me_update.txt ]; then
        echo "img/me目录中的文件一天内之内没有做更改，不执行备份操作"
    else
        echo "检测到img/me目录中的文件有更新:"
        echo "更新的文件："

        cat $file_path_img_me2/img_me_update.txt

        echo ""
        echo "########## 开始备份img/me ##########"
        cd $file_path_img_me1
        tar -czvf $backup_wangyunan_img_me/me.tar *
        check_status_code
        echo
        sleep 1
        echo "########## 开始备份img/me到备份服务器 ##########"
        scp $backup_wangyunan_img_me/me.tar root@192.168.0.105:$backup_host_dir/img/me
        check_status_code
        echo
        sleep 1
        rm -f $backup_wangyunan_img_me/me.tar
    fi
fi
sleep 1

# img/other
file_path_img_other1=/var/data/nextcloud/wangyunan/files/img/other
file_path_img_other2=/root/log/img
backup_wangyunan_img_other=/var/data/nextcloud/backup_wangyunan/img/other

# 检查img/other目录是否有更新
if find $file_path_img_other1 -mtime -1 > $file_path_img_other2/img_other_update.txt ; then
    if [ ! -s $file_path_img_other2/img_other_update.txt ]; then
        echo "img/other目录中的文件一天内之内没有做更改，不执行备份操作"
    else
        echo "检测到img/other目录中的文件有更新:"
        echo "更新的文件："

        cat $file_path_img_other2/img_other_update.txt

        echo ""
        echo "########## 开始备份img/other ##########"
        cd $file_path_img_other1
        tar -czvf $backup_wangyunan_img_other/other.tar *
        check_status_code
        echo
        sleep 1
        echo "########## 开始备份img/other到备份服务器 ##########"
        scp $backup_wangyunan_img_other/other.tar root@192.168.0.105:$backup_host_dir/img/other
        check_status_code
        echo
        sleep 1
        rm -f $backup_wangyunan_img_other/other.tar
    fi
fi
sleep 1

# img/wx-friends
file_path_img_wx_friends1=/var/data/nextcloud/wangyunan/files/img/wx-friends
file_path_img_wx_friends2=/root/log/img
backup_wangyunan_img_wx_friends=/var/data/nextcloud/backup_wangyunan/img/wx-friends

# 检查img/wx-friends目录是否有更新
if find $file_path_img_wx_friends1 -mtime -1 > $file_path_img_wx_friends2/img_wx_friends_update.txt ; then
    if [ ! -s $file_path_img_wx_friends2/img_wx_friends_update.txt ]; then
        echo "img/wx-friends目录中的文件一天内之内没有做更改，不执行备份操作"
    else
        echo "检测到img/wx-friends目录中的文件有更新:"
        echo "更新的文件："

        cat $file_path_img_wx_friends2/img_wx_friends_update.txt

        echo ""
        echo "########## 开始备份img/wx-friends ##########"
        cd $file_path_img_wx_friends1
        tar -czvf $backup_wangyunan_img_wx_friends/wx-friends.tar *
        check_status_code
        echo
        sleep 1
        echo "########## 开始备份img/wx-friends到备份服务器 ##########"
        scp $backup_wangyunan_img_wx_friends/wx-friends.tar root@192.168.0.105:$backup_host_dir/img/wx-friends
        check_status_code
        echo
        sleep 1
        rm -f $backup_wangyunan_img_wx_friends/wx-friends.tar
    fi
fi