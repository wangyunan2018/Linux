#!/bin/bash

# 注意，如果服务器发生重启或者pod意外删除，pod名会发生改变，记得做好修改

file_path1=~/log
time1=$(date "+%Y%m%d %H:%M:%S")
time2=$(date -d "1 days ago" "+%Y%m%d")

# 采集ivision日志
if [ -f $file_path1/ivision.log ]; then
    cp $file_path1/ivision.log $file_path1/backup_log/ivision$time2.log && cat /dev/null > $file_path1/ivision.log
    cd $file_path1/backup_log
    tar -czvf ivision$time2.tar ivision$time2.log
    rm -rf ivision$time2.log
    echo "$?"
    echo
    echo "更新时间：$time1"
fi

# 采集iresource日志
if [ -f $file_path1/iresource.log ]; then
    cp $file_path1/iresource.log $file_path1/backup_log/iresource$time2.log && cat /dev/null > $file_path1/iresource.log
    cd $file_path1/backup_log
    tar -czvf iresource$time2.tar iresource$time2.log
    rm -rf iresource$time2.log
    echo "$?"
    echo
    echo "更新时间：$time1"
fi

# 采集ibase日志
if [ -f $file_path1/ibase.log ]; then
    cp $file_path1/ibase.log $file_path1/backup_log/ibase$time2.log && cat /dev/null > $file_path1/ibase.log
    cd $file_path1/backup_log
    tar -czvf ibase$time2.tar ibase$time2.log
    rm -rf ibase$time2.log
    echo "$?"
    echo
    echo "更新时间：$time1"
fi

# 采集iauth日志
if [ -f $file_path1/iauth.log ]; then
    cp $file_path1/iauth.log $file_path1/backup_log/iauth$time2.log && cat /dev/null > $file_path1/iauth.log
    cd $file_path1/backup_log
    tar -czvf iauth$time2.tar iauth$time2.log
    rm -rf iauth$time2.log
    echo "$?"
    echo
    echo "更新时间：$time1"
fi

# 采集gateway日志
if [ -f $file_path1/gateway.log ]; then
    cp $file_path1/gateway.log $file_path1/backup_log/gateway$time2.log && cat /dev/null > $file_path1/gateway.log
    cd $file_path1/backup_log
    tar -czvf gateway$time2.tar gateway$time2.log
    rm -rf gateway$time2.log
    echo "$?"
    echo
    echo "更新时间：$time1"
fi

# 采集docker.service运行状态日志
if [ -f $file_path1/docker.log ]; then
    cp $file_path1/docker.log $file_path1/backup_log/docker$time2.log && cat /dev/null > $file_path1/docker.log
    cd $file_path1/backup_log
    tar -czvf docker$time2.tar docker$time2.log
    rm -rf docker$time2.log
    echo "$?"
    echo
    echo "更新时间：$time1"
fi

# 采集kubelet.service运行状态日志
if [ -f $file_path1/kubelet.log ]; then
    cp $file_path1/kubelet.log $file_path1/backup_log/kubelet$time2.log && cat /dev/null > $file_path1/kubelet.log
    cd $file_path1/backup_log
    tar -czvf kubelet$time2.tar kubelet$time2.log
    rm -rf kubelet$time2.log
    echo "$?"
    echo
    echo "更新时间：$time1"
fi