#!/bin/bash

# time1=$(date "+%Y%m%d")
file_path1=/www/wwwroot/api.talentnow.cn
file_path2=/www/backup/site/temp

status(){
        if [ "$?" -eq "0" ]; then
                echo "返回状态码：$?，备份成功！"
        else
                echo "返回状态码：$?，不为0，请检查！"
        fi
}

# 打包/www/wwwroot/api.talentnow.cn/thago
echo "############ 打包thago ##########"
echo ""

cd $file_path1/thago
tar -czvf thago.tar *
mv ./thago.tar $file_path2
status
sleep 2

# 打包/www/wwwroot/api.talentnow.cn/public/assets
echo "############ 打包assets ##########"
echo ""

cd $file_path1/assets
tar -czvf assets.tar *
mv ./assets.tar $file_path2
status
sleep 2

# 打包/www/wwwroot/api.talentnow.cn/addons
echo "############ 打包addons ##########"
echo ""

cd $file_path1/addons
tar -czvf addons.tar *
mv ./addons.tar $file_path2
status
sleep 2

# 打包/www/wwwroot/api.talentnow.cn/application
echo "############ 打包application ##########"
echo ""

cd $file_path1/application
tar -czvf app.tar *
mv ./app.tar $file_path2
status

echo "gtalent备份路径：/www/backup/site/temp"
echo ""

ls -lh $file_path2