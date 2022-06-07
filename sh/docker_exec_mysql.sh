#!/bin/bash

file_path1=/docker/mysql/data/blog
file_path2=/var/log/mysql
file_path3=/docker/mysql/data/backup
time1=$(date "+%Y-%m-%d %H:%M:%S")

if [ -f $file_path2/backup_database_mysql.log ]; then
    cat /dev/null > $file_path2/backup_database_mysql.log
fi
# -mtime -1 表示一天内，如果时间延续缩短，把-1修改成0.xxx
# 0.01大概在一小时左右、0.001应该是在十分钟左右

if find $file_path1 -mtime -0.01 > $file_path2/check_file_status.txt; then
    if [ ! -s $file_path2/check_file_status.txt ]; then
        echo ""
        echo "blog数据库没有新增数据，不执行备份"
        echo ""
        echo "脚本执行完成，查看执行结果："
        cat $file_path2/backup_database_mysql.log
        echo "Query result is empty, complete !"
        echo ""
        echo "执行时间：$time1"
    else
        echo "检测到blog数据库有更新"
        echo "更新的文件："
        echo ""
        cat $file_path2/check_file_status.txt

        echo ""
        echo "########## 开始备份blog数据库 ##########"
        echo ""
        docker exec mysql /bin/bash -c "/sh/backup_database_mysql.sh"
        if [ $? -eq 0 ]; then
            echo "返回状态码：$?，备份成功。" &>> $file_path2/backup_database_mysql.log
            echo "备份路径：/docker/mysql/data/backup" &>> $file_path2/backup_database_mysql.log
            ls -lh $file_path3 &>> $file_path2/backup_database_mysql.log
            echo "备份时间：$time1" &>> $file_path2/backup_database_mysql.log
        else
            echo "返回状态码：$?，状态码不为0，请检查blog数据库是否备份成功。" &>> $file_path2/backup_database_mysql.log
            echo "备份路径：/docker/mysql/data/backup" &>> $file_path2/backup_database_mysql.log
            ls -lh $file_path3 &>> $file_path2/backup_database_mysql.log
            echo "执行时间$time1" &>> $file_path2/backup_database_mysql.log
        fi
    fi
fi