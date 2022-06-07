#!/bin/bash

# 注意，如果服务器发生重启或者pod意外删除，pod名会发生改变，记得做好修改

file_path1=~/log
pod_name=ivision-ljghv
# time1=$(date "+%Y%m%d")
# time2=$(date -d "1 days ago" "+%Y%m%d")

# # 剪切前一天的日志到backup_log目录

# if [ -f $file_path1/ivision$time2.log ]; then
#   mv $file_path1/ivision$time2.log $file_path1/backup_log
# fi

# cd $file_path1/backup_log
# if [ -f ./ivision$time2.log ]; then
#   tar -czvf ivision$time2.tar ivision$time2.log
#   rm ivision$time2.log -f
# else
#   sleep 2

#   if [ -f $file_path1/ivision$time1.log ]; then
#     cat /dev/null > $file_path1/ivision$time1.log
#   fi
#   sleep 1

#   # 收集 ivision 日志（页面刷新不出来查看该日志）
#   kubectl logs -f -n aistation ivision-482j2 &>> $file_path1/ivision$time1.log
# fi

kubectl logs -f -n aistation $pod_name &>> $file_path1/ivision.log