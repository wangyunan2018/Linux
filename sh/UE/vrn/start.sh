#!/bin/bash

check_status_code(){
	if [ $? -eq 0 ]; then
		echo "Return status code: $?, SUCCESS !"
		echo
	else
		echo "Return status code: $?, FAIL !"
		echo
	fi
}

count(){
	echo "3"
	sleep 1
	echo "2"
	sleep 1
	echo "1"
	sleep 1
	echo
}

mount_dir=/opt/vrn-master
s_dir=/opt/vrn-master/examples
d_dir=/vrn/examples
dst_dir=/mnt/inspurfs/user-fs/test1/ftp

starttime=$(date "+%Y-%m-%d %H:%M:%S")

echo "###清空临时目标目录###"
rm -rf $s_dir/img/*
rm -rf $s_dir/obj/*

echo "###拉取源目录2D头像###"
mv $dst_dir/source_img/* $s_dir/img
check_status_code
echo

echo "###批量修改文件名###"
count
python $mount_dir/batch.py
check_status_code
sleep 1

ls -lh $s_dir/img > $s_dir/img.txt
set -i '1d' $s_dir/img.txt && gawk 'BEGIN{FS=" "} {print $9}' $s_dir/img.txt > $s_dir/result.txt
sleep 1

for i in $(cat $s_dir/result.txt); do
	nvidia-docker run --rm -it --name vrn-batch -v $mount_dir:/vrn vrn-gpu:v2 ./run.sh $d_dir/img/$i
	check_status_code
	echo
done

sleep 1
mv $s_dir/img/*.obj $s_dir/obj
rm -rf $s_dir/*.txt
rm $s_dir/img/*crop* -f

echo "###打包并解压到最终目录###"
cd $s_dir/obj
tar -czvf 3D_obj.tar *
tar -xzvf 3D_obj.tar -C $dst_dir/3D_obj
check_status_code

endtime=$(date "+%Y-%m-%d %H:%M:%S")
start_seconds=$(date --date="$starttime" +%s);
end_seconds=$(date --date="$endtime" +%s);
echo -n "本次运行时间： " > $mount_dir/result_exec_time.log
total=$((end_seconds-start_seconds))"s"
echo "$total" >> $mount_dir/result_exec_time.log