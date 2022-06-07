#!/bin/bash

echo ""

echo "-----------------------------"

dir1=/home/myproject/Django/myproject

if [ -f $dir1/Django1.tar ]; then
    echo "检查到文件：Django1.tar"
    echo ""

    echo "开始删除文件：Django1.tar"
    rm Django1.tar -rf
    echo ""

    if [ $? -eq 0 ];then
        echo "返回状态码：$?，Django1.tar文件已删除"
        echo ""
    else
        echo "返回状态码：$?，不为0，Django1.tar文件删除失败，请检查！"
        echo ""
    fi
    
fi

echo "--- 开始打包Djang1项目 ---"
    cd $dir1
    tar -czvf Django1.tar *

#sleep 3

tar -xzvf Django1.tar -C /root/wyn-gitlab/Django1

echo "检查提交脚本push.sh是否存在"
echo ""

dir2=/root/wyn-gitlab/Django1

chmod -R 755 $dir2

if [ ! -f $dir2/push.sh ]; then
    echo "push.sh脚本不存在"
    echo ""

    echo "--- 开始创建push.sh ---"

    cat > $dir2/push.sh << EOF
#!/bin/bash

echo "开始提交代码："
echo ""

git add .
git commit -m "add"
git push -u origin master

if [ \$? -eq 0 ]; then
        echo ""
        echo "返回状态码：\$?"
        echo "0, Ok，代码提交成功！"
else
        echo ""
        echo "返回状态码：\$?，不为0，请检查！"
fi

echo ""
echo ""

echo "提交时间："
date '+%c'

echo ""
echo ""

echo "---------------------"

echo ""
echo ""
EOF

    echo "push.sh脚本创建成功"
    echo ""

    echo "--- 开始执行脚本push.sh  ---"
    chmod +x $dir2/push.sh
    rm $dir2/Django1.tar -f
    rm $dir2/access.log -f

    cd $dir2
    /bin/bash ./push.sh

    echo ""

else
    echo "push.sh脚本已存在"
    echo ""

    echo "--- 开始执行push.sh脚本 ---"   
    chmod +x $dir2/push.sh
    rm $dir2/Django1.tar -f
    rm $dir2/access.log -f

    cd $dir2

    /bin/bash ./push.sh

    if [ $? -eq 0 ];then
        echo "返回状态码：$?，push.sh脚本执行成功！"
        echo ""
    else
        echo "返回状态码：$?，不为0，push.sh脚本执行失败，请检查！"
        echo ""
    fi

fi

echo ""

echo "更新时间："

time1=$(date "+%Y-%m-%d %H:%M:%S")
echo $time1

echo ""

echo "-----------------------------"
