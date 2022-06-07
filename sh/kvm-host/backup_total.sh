#!/bin/bash

file_path1=/root/test/test1
backup_dir_total=/root/test/test2

check_status_code() {
    if [ $? -eq 0 ]; then
        echo "返回状态码：$?，备份成功。"
    else
        echo "返回状态码：$?，备份成功异常，请检查。"
    fi
}

# 全量备份
cd $file_path1
tar -czvf $backup_dir_total/$backup_total.tar *
check_status_code