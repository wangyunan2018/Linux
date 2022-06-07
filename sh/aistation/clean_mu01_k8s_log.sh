#! /bin/bash

file_path1=~/log/backup_log
time=$(date "+%Y-%m-%d %H:%M:%S")
time1=$(date -d "4 days ago" "+%Y%m%d")
time2=$(date -d "5 days ago" "+%Y%m%d")
time3=$(date -d "6 days ago" "+%Y%m%d")
time4=$(date -d "7 days ago" "+%Y%m%d")

check_status() {
    if [ $? -eq 0 ]; then
        echo "返回状态码：$?，脚本执行成功，日志已清理。"
    else
        echo "返回状态码：$?，状态码不为0，请检查。"
    fi
}

# 测试：
# rm $file_path1/project$time1.tar $file_path1/project$time2.tar $file_path1/project$time3.tar -f

# 删除 aistation-api-gateway 三天前日志
rm $file_path1/gateway$time1.tar $file_path1/gateway$time2.tar $file_path1/gateway$time3.tar $file_path1/gateway$time4.tar -f
check_status &> /root/sh/mu01/clean_mu01_k8s.log

# 删除 iresource 三天前日志
rm $file_path1/iresource$time1.tar $file_path1/iresource$time2.tar $file_path1/iresource$time3.tar $file_path1/iresource$time4.tar -f
check_status &>> /root/sh/mu01/clean_mu01_k8s.log

# 删除 ivision 三天前日志
rm $file_path1/ivision$time1.tar $file_path1/ivision$time2.tar $file_path1/ivision$time3.tar $file_path1/ivision$time4.tar -f
check_status &>> /root/sh/mu01/clean_mu01_k8s.log

# 删除 iauth 三天前日志
rm $file_path1/iauth$time1.tar $file_path1/iauth$time2.tar $file_path1/iauth$time3.tar $file_path1/iauth$time4.tar -f
check_status &>> /root/sh/mu01/clean_mu01_k8s.log

# 删除 ibase 三天前日志
rm $file_path1/ibase$time1.tar $file_path1/ibase$time2.tar $file_path1/ibase$time3.tar $file_path1/ibase$time4.tar -f
check_status &>> /root/sh/mu01/clean_mu01_k8s.log

# 删除 docker运行状态 三天前日志
rm $file_path1/docker$time1.tar $file_path1/docker$time2.tar $file_path1/docker$time3.tar $file_path1/docker$time4.tar -f
check_status &>> /root/sh/mu01/clean_mu01_k8s.log

# 删除 kubelet运行状态 三天前日志
rm $file_path1/kubelet$time1.tar $file_path1/kubelet$time2.tar $file_path1/kubelet$time3.tar $file_path1/kubelet$time4.tar -f
check_status &>> /root/sh/mu01/clean_mu01_k8s.log
echo "" &>> /root/sh/mu01/clean_mu01_k8s.log

echo "更新时间：$time" &>> /root/sh/mu01/clean_mu01_k8s.log