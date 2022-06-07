#!/bin/bash

# gawk '{print $5}' eth_trunk0 > eth_trunk0_1 && sed -i '1,5d' eth_trunk0_1

filename1=./eth_trunk0
filename2=./eth_trunk0_1
time1=$(date "+%Y-%m-%d %H:%M:%S")

if [ -f $filename2 ]; then
    cp $filename2 $filename2.bak
    cat /dev/null > $filename2
fi

gawk '{print $5}' $filename1 > $filename2 && sed -i '1,5d' $filename2 

if [ $? -eq 0 ]; then
    echo "返回状态码：$?，执行成功。"
else
    echo "返回状态码：$?，状态码不为0，请检查文件是否存在。"
fi

echo "更新时间：$time1"
echo "更新时间：$time1" &> ./access.log