#!/bin/bash

file_path1=/www/wwwroot/api.talentnow.cn/runtime

modify_dir(){
        chmod -R 777 $file_path1
        chmod -R 777 $file_path1/log
}

rm $file_path1/temp -rf
rm $file_path1/cache -rf

modify_dir

sleep 5

modify_dir