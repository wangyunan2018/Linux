#!/bin/bash

file_path1=/root/test/test1
backup_dir_total=/root/test/test2

check_status_code() {
    if [ $? -eq 0 ]; then
        echo "返回状态码：$?，备份成功。"
    else
        echo "返回状态码：$?，备份异常，请检查。"
    fi
}

for i in $(cat $file_path1/host.txt); do
# 检测$i目录变化
if find $file_path1/$i -mtime -1 > $backup_dir_total/$i.txt; then
    if [ ! -s $backup_dir_total/$i.txt ]; then
        echo "$i目录一天内文件无更改，无需备份。"
    else
        echo "$i目录以下文件发生变化："
        cat $backup_dir_total/$i.txt
        echo
        echo "开始备份："
        echo
        cd $file_path1/$i
        tar -czvf $backup_dir_total/$i.tar *
        check_status_code
        echo
        echo "备份路径：$backup_dir_total"
        echo
		sleep 1
    fi
fi
rm $backup_dir_total/$i.txt -f
done