#!/bin/bash

dir_path1=/root/wyn-gitlab
time1=$(date "+%Y%m%d%H%M")

cd $dir_path1

tar -czvf Django1_$time1.tar Django1/

mv Django1_$time1.tar /home/backup/project/Django/
