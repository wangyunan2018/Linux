#!/bin/bash

echo "--- 开始检查项目路径(/root/Desktop)是否存在 ---"

if [ -d /root/Desktop/thago_work ]; then
    echo "Desktop目录已存在"

    dir=/root/Desktop/thago_work
    cd $dir
    chmod -R 755 $dir
    echo ""

    echo "--- 开始检查/root/Desktop/push.sh是否存在 ---"

    if [ ! -f $dir/push.sh ]; then
        echo "push.sh脚本不存在"
        echo ""
        echo "--- 开始创建push.sh脚本 ---"
        cat > $dir/push.sh << EOF
#!/bin/bash

echo "开始提交代码："
echo ""

git add .
git commit -m "add"
git push -u origin master

if [ \$? -eq 0 ]; then
        echo ""
        echo "返回状态码：\$?，Ok，代码提交成功！"
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
    echo ""
    if [ $? -eq 0 ]; then
                echo ""
                echo "返回状态码：$?，Ok，push.sh创建成功！"
        else
                echo ""
                echo "返回状态码：$?，不为0，push.sh创建不成功，请检查！"
        fi
    echo ""
    
    echo "开始执行脚本"
    cd $dir
    /bin/bash ./push.sh
    echo ""
    else
        echo "脚本已存在，开始执行脚本"
        cd $dir
        /bin/bash ./push.sh
    fi

else
    echo ""
    echo "项目路径/root/Desktop不存在"
    echo ""
    
    echo "--- 开始检查/home/project/thago_work/push.sh是否存在 ---"
    dir2=/home/project/thago_work
    if [ ! -f $dir2/push.sh ]; then
        echo "脚本不存在，开始创建"
        cat > $dir2/push.sh << EOF
#!/bin/bash

echo "开始提交代码："
echo ""

git add .
git commit -m "add"
git push -u origin master

if [ \$? -eq 0 ]; then
        echo ""
        echo "返回状态码：\$?，Ok，代码提交成功！"
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

        echo ""

        if [ $? -eq 0 ]; then
                echo ""
                echo "返回状态码：$?，Ok，push.sh创建成功！"
        else
                echo ""
                echo "返回状态码：$?，不为0，push.sh创建不成功，请检查！"
        fi

        echo ""

        echo "开始执行脚本"
        chmod +x $dir2/push.sh
        cd $dir2
        /bin/bash ./push.sh

        echo ""
        else
                echo "脚本已存在，开始执行脚本"
                chmod +x $dir2/push.sh
                cd $dir2
                /bin/bash ./push.sh
        fi
fi
