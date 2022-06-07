#!/bin/bash

cat >> /etc/hosts << EOF
172.18.18.105 gitlab.codeforest.cn
EOF

echo "即将生成默认项目目录：【thago_work】"
DEBIAN_FRONTEND=noninteractive apt-get install -y expect

git config --global user.name "testxxx"
git config --global user.email "testxxx@testxxx.cn"
git config --global credential.helper store

AUTHOR='testxxx'
CONID='testxxx'

/usr/bin/expect <<-EOF

spawn git clone http://testxxx/test-2-111/mycourse-2-207-test.git
expect {
"*Username" { send "$AUTHOR\r"; exp_continue }
"*Password*:" { send "$CONID\r" }
}
expect eof
EOF

mv ./mycourse-2-207-test /root/thago_work
chmod -R 755 /root/thago_work

cat > /root/thago_work/push.sh << EOF
#!/bin/bash

echo "开始提交代码："
echo ""

git add .
git commit -m "add"
git push -u origin master

if [ $? -eq 0 ]; then
        echo -n "返回状态码："
        echo "0, Ok，代码提交成功！"
else
        echo -n "返回状态码不为0，请检查！"
fi

echo ""
echo ""

echo "提交时间："
date

echo ""
echo ""

echo "---------------------"

echo ""
echo ""
EOF

chmod +x /root/thago_work/push.sh

echo "-----------------"
echo "注意事项："
echo "当您提交代码的时候，直接执行【push.sh】即可"
echo -n "执行命令："
echo "sh push.sh"
echo "-----------------"
echo ""

cat > /root/thago_work/readme.txt << EOF
当您提交代码的时候，直接执行【push.sh】即可
执行命令：【sh push.sh】
EOF

if [ "$?" -ge "0" ]; then
    echo -n "返回状态码："
    echo $? ", Ok"
    echo "脚本执行成功!"
    echo "生成默认项目目录：/root/thago_work，提交代码需要在该目录中进行，请进入该目录开始您的项目"
    echo "进入到该目录后请阅读【readme.txt】==> 执行命令：cat readme.txt"
else
    echo -n "返回状态码："
    echo $? ", 状态码不为0"
    echo "脚本执行失败，请检查！"
fi
echo ""
rm -f /root/thago.sh
echo ""


