#!/bin/bash

file_path1=/

cd $file_path1

# 还原根目录下所有系统默认目录文件权限
setfacl --restore=bin.bak
sleep 1
setfacl --restore=boot.bak
sleep 1
setfacl --restore=dev.bak
sleep 1
setfacl --restore=etc.bak
sleep 1
setfacl --restore=home.bak
sleep 1
setfacl --restore=lib.bak
sleep 1
setfacl --restore=lib64.bak
sleep 1
setfacl --restore=media.bak
sleep 1
setfacl --restore=mnt.bak
sleep 1
setfacl --restore=opt.bak
sleep 1
setfacl --restore=proc.bak
sleep 1
setfacl --restore=root.bak
sleep 1
setfacl --restore=run.bak
sleep 1
setfacl --restore=sbin.bak
sleep 1
setfacl --restore=srv.bak
sleep 1
setfacl --restore=sys.bak
sleep 1
setfacl --restore=tmp.bak
sleep 1
setfacl --restore=usr.bak
sleep 1
setfacl --restore=var.bak