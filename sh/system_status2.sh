#!/bin/bash

time1=$(date "+%Y-%m-%d %H:%M:%S")

echo "### 检查服务器网络是否正常 ###"
echo ""

echo "测试5秒内的网络连通率，请稍后..."
echo "ping www.gtalent.cn ..."

ping www.gtalent.cn -c 5 | awk '{ print $0"\t" strftime("%Y-%m-%d %H:%M:%S",systime()) }' > /var/log/ip.log
echo ""

file1=/var/log/ip.log

if  cat $file1 | grep "icmp_seq"; then
    echo ""
    echo "返回状态码为：$?，当前服务器网络正常"
else
    echo ""
    echo "返回状态码为：$?，当前服务器网络不正常，请检查服务器网络"
fi

echo ""

echo "### 检查服务器CPU、内存状态 ###"
echo ""

echo "过滤CPU占用 >= %50的进程："
top -bn 1 -i -c > /var/log/top_status.log
echo "" >> /var/log/top_status.log

sed -n '7,$p' /var/log/top_status.log > /var/log/top.log
cat /var/log/top.log | gawk -F" " '{print $9}' | grep -o "5[0-9]\{1,2\}" > /var/log/cpu.log

file2=/var/log/cpu.log

if [ ! -s $file2 ]; then
    echo "当前暂无CPU占用超过50%的进程，cpu运行平稳"
    echo ""
else
    echo -n "当前CPU进程占用超过50%的进程数量："
    cat $file2 | wc -l
    echo "请查看系统运行日志：/var/log/top_status.log"
    
    cat /var/log/top_status.log >> /var/log/total_cpu.log
    echo "上次检查时间：$time1" >> /var/log/total_cpu.log
    echo "--------------------------------------" >> /var/log/total_cpu.log
    echo "" >> /var/log/total_cpu.log
    echo ""

fi

echo ""

echo "过滤内存占用 >= %60的进程："
ps -aux | sort -rnk 4 | head -20 > /var/log/mem1.log
echo "" >> /var/log/mem1.log


awk '{printf "%-15s %-10s %-20s\n",$1,$2,$3}' /var/log/mem1.log > /var/log/mem2.log
awk -F" " '{print $3}' /var/log/mem2.log > /var/log/mem3.log

file3=/var/log/mem3.log

if [ -s $file3 ]; then
    echo "当前暂无内存占用超过60%的进程，内存暂无异常"
    echo "上次检查时间：$time1"
    echo "--------------------------------------"
    echo ""
else
    echo -n "当前占用内存超过60%的进程数量："
    cat /var/log/mem3.log | grep -o "[6-9]\{1\}.[0-9]\{1\}" | wc -l
    echo "请查看系统运行日志：/var/log/mem1.log"

    cat /var/log/mem1.log >> /var/log/total_mem.log
    echo "上次检查时间：$time1" >> /var/log/total_mem.log
    echo "--------------------------------------" >> /var/log/total_mem.log
    echo "" >> /var/log/total_mem.log

    echo "上次检查时间：$time1"
    echo "--------------------------------------"
    echo ""

fi