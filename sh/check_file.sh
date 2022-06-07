#!/bin/bash

file_path1=/home/myproject/Django/myproject
file_path2=/tmp

# -mtime -1 表示一天内，如果时间延续缩短，把-1修改成0.xxx

if find $file_path1 -mtime -1 > $file_path2/result.txt ; then
    if [ ! -s $file_path2/result.txt ]; then
        echo "当前目录中的文件一天内之内没有做更改，不执行备份操作"
    else
        echo "检测到当前目录中的文件有更新:"
        echo "更新的文件："

        cat $file_path2/result.txt

        echo ""
        echo "########## 开始备份 ##########"
    fi
fi

# /usr/bin/kubectl kubectl exec -it -n webide-theia-go webide-go-8979f5b8c-rz9v7 -- find /home/project/test1/ -mtime -0.01 > /tmp/kubernetes_result.log
