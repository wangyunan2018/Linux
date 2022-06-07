#!/bin/bash

# 查询进程
# ps -ef | grep "collect_kubelet_service_log.sh" | grep -v grep | cut -c 9-15

# 强制结束进程
ps -ef | grep "collect_kubelet_service_log.sh" | grep -v grep | cut -c 9-15 | xargs kill -9
sleep 5

# 重新启动进程

cd /root/sh/mu01
nohup /bin/bash /root/sh/mu01/collect_kubelet_service_log.sh &