#!/bin/bash

# 注意，如果服务器发生重启或者pod意外删除，pod名会发生改变，记得做好修改

file_path1=~/log
# time1=$(date "+%Y%m%d")
# time2=$(date -d "1 days ago" "+%Y%m%d")

# # 剪切前一天的日志到backup_log目录
# mv $file_path1/kubelet$time2.log $file_path1/backup_log
# cd $file_path1/backup_log
# tar -czvf kubelet$time2.tar kubelet$time2.log
# rm kubelet$time2.log -f
# sleep 2

# if [ -f $file_path1/kubelet$time1.log ]; then
#   cat /dev/null > $file_path1/kubelet$time1.log
# fi
# sleep 1

journalctl -f -u kubelet.service &>> $file_path1/kubelet$time1.log