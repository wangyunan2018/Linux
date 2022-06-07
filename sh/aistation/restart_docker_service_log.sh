#!/bin/bash

# 查询进程
# ps -ef | grep "collect_kubelet_service_log.sh" | grep -v grep | cut -c 9-15

# 强制结束进程
if ps -ef | grep "collect_docker_service_log.sh"; then
    ps -ef | grep "collect_docker_service_log.sh" | grep -v grep | cut -c 9-15 | xargs kill -9
    sleep 5

    # 重新启动进程

    cd /root/sh/mu01
    nohup /bin/bash /root/sh/mu01/collect_docker_service_log.sh &
else
    echo "没有找到 collect_docker_service_log.sh 进程，直接运行脚本"
    nohup /bin/bash /root/sh/mu01/collect_docker_service_log.sh &
fi
