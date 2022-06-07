#!/bin/bash

file_path1=/

cd $file_path1

# 备份根目录下所有系统默认目录文件权限
getfacl -R bin/ > $file_path1/bin.bak
getfacl -R boot/ > $file_path1/boot.bak
getfacl -R dev/ > $file_path1/dev.bak
getfacl -R etc/ > $file_path1/etc.bak
getfacl -R home/ > $file_path1/home.bak
getfacl -R lib/ > $file_path1/lib.bak
getfacl -R lib64/ > $file_path1/lib64.bak
getfacl -R media/ > $file_path1/media.bak
getfacl -R mnt/ > $file_path1/mnt.bak
getfacl -R opt/ > $file_path1/opt.bak
getfacl -R proc/ > $file_path1/proc.bak
getfacl -R root/ > $file_path1/root.bak
getfacl -R run/ > $file_path1/run.bak
getfacl -R sbin/ > $file_path1/sbin.bak
getfacl -R srv/ > $file_path1/srv.bak
getfacl -R sys/ > $file_path1/sys.bak
getfacl -R tmp/ > $file_path1/tmp.bak
getfacl -R usr/ > $file_path1/usr.bak
getfacl -R var/ > $file_path1/var.bak