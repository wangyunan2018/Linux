#!/bin/bash

file_path1=/www/wwwroot/api.talentnow.cn/

cd $file_path1

tar -czvf api.talentnow.cn.tar *

file_path2=/www/backup/site/temp/

mv ./api.talentnow.cn.tar $file_path2

ls -lh $file_path2

echo ""

echo "备份路径：$file_path2"