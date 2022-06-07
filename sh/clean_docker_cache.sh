#!/bin/bash

if [ -f ~/clean_docker_cache.log ]; then
	cat /dev/null > ~/clean_docker_cache.log
fi

# yum install -y expect

# docker system prune 一键清理

time1=$(date "+%Y-%m-%d %H:%M:%S")
AUTHOR='y'

echo "查看docker占用的空间:"
docker system df
echo ""

# Are you sure you want to continue? [y/N]

echo "删除全部停止的容器："
/usr/bin/expect <<-EOF
spawn docker container prune
expect {
"*Are you sure you want to continue? " { send "$AUTHOR\r"; exp_continue }
}
expect eof
EOF

echo "删除所有悬挂状态的镜像："
/usr/bin/expect <<-EOF
spawn docker image  prune
expect {
"*Are you sure you want to continue? " { send "$AUTHOR\r"; exp_continue }
}
expect eof
EOF

echo "删除不再使用的数据卷："
/usr/bin/expect <<-EOF
spawn docker volume prune
expect {
"*Are you sure you want to continue? " { send "$AUTHOR\r"; exp_continue }
}
expect eof
EOF


echo "删除Build Cache："
/usr/bin/expect <<-EOF
spawn docker builder prune
expect {
"*Are you sure you want to continue? " { send "$AUTHOR\r"; exp_continue }
}
expect eof
EOF

echo ""

echo "###### docker 缓存清理完毕 ######"
echo ""

echo "查看磁盘空间："
df -h | grep -w "/"
echo ""

echo "更新时间：$time1"
echo ""

echo "查看磁盘空间：" &> ~/clean_docker_cache.log
df -h | grep -w "/" &>> ~/clean_docker_cache.log
echo "" &>> ~/clean_docker_cache.log

echo "更新时间：$time1" &>> ~/clean_docker_cache.log