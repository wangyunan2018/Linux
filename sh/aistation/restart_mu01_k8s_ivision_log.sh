#!/bin/bash

# 查询进程
# ps -ef | grep "collect_mu01_k8s_ivision_log.sh" | grep -v grep | cut -c 9-15

time1=$(date "+%Y-%m-%d %H:%M:%S")

if [ -f ./ps_ivision_result.txt ]; then
    cat /dev/null > ./ps_ivision_result.txt
fi

# 强制结束进程
if /usr/bin/ps -ef | grep "collect_mu01_k8s_ivision_log.sh" | grep -v grep | /usr/bin/cut -c 9-15 > ./ps_ivision_result.txt; then
    if [ -s ./ps_ivision_result.txt ]; then
        echo "collect_mu01_k8s_ivision_log.sh 进程已存在，重新启动该进程"
        /usr/bin/ps -ef | grep "collect_mu01_k8s_ivision_log.sh" | grep -v grep | /usr/bin/cut -c 9-15 | /usr/bin/xargs /usr/bin/kill -9
        sleep 5
        # 重新启动进程
        cd /root/sh/mu01
        /usr/bin/nohup /bin/bash /root/sh/mu01/collect_mu01_k8s_ivision_log.sh &
        echo $?
        echo
        echo "$time1"
    else
        echo "没有找到 collect_mu01_k8s_ivision_log.sh 进程，直接运行脚本"
        /usr/bin/nohup /bin/bash /root/sh/mu01/collect_mu01_k8s_ivision_log.sh &
        echo $?
        echo
        echo "$time1"
    fi
fi