#!/bin/bash

if [ -f /root/is_get_phone.log ]; then
	cat /dev/null > /root/is_get_phone.log
fi

time1=$(date "+%Y-%m-%d %H:%M:%S")

check_status() {
	if [ $? -eq 0 ]; then
		echo "返回状态码：$?，执行成功。"
	else
		echo "返回状态码：$?，状态码不为0，执行失败。"
	fi
}

#################################
# 兼职人员
# testxxx
mysql -utestxxx -ptestxxx -e "use testxxx;update t_job set is_get_phone = '1' where create_user = 612;"
check_status > /root/is_get_phone.log
echo "" >> /root/is_get_phone.log
echo "--------------" >> /root/is_get_phone.log

# testxxx
mysql -utestxxx -ptestxxx -e "use testxxx;update t_job set is_get_phone = '1' where create_user = 5889;"
check_status >> /root/is_get_phone.log
echo "" >> /root/is_get_phone.log
echo "--------------" >> /root/is_get_phone.log

# testxxx
mysql -utestxxx -ptestxxx -e "use testxxx;update t_job set is_get_phone = '1' where create_user = 7798;"
check_status >> /root/is_get_phone.log
echo "" >> /root/is_get_phone.log
echo "--------------" >> /root/is_get_phone.log

# testxxx
mysql -utestxxx -ptestxxx -e "use testxxx;update t_job set is_get_phone = '1' where create_user = 6869;"
check_status >> /root/is_get_phone.log
echo "" >> /root/is_get_phone.log
echo "--------------" >> /root/is_get_phone.log

# testxxx
mysql -utestxxx -ptestxxx -e "use testxxx;update t_job set is_get_phone = '1' where create_user = 7497;"
check_status >> /root/is_get_phone.log
echo "" >> /root/is_get_phone.log
echo "--------------" >> /root/is_get_phone.log

# 其他人员
# 8602	??Tiffany-wx-763
# mysql -utestxxxn -ptestxxx -e "use testxxx;update t_job set is_get_phone = '1' where create_user = 8602;"
# check_status >> /root/is_get_phone.log
# echo "" >> /root/is_get_phone.log
# echo "--------------" >> /root/is_get_phone.log


#################################
# 公司内部人员
# testxxx
mysql -utestxxx -ptestxxx -e "use testxxx;update t_job set is_get_phone = '1' where create_user = 3180;"
check_status >> /root/is_get_phone.log
echo "" >> /root/is_get_phone.log
echo "--------------" >> /root/is_get_phone.log

# testxxx
mysql -utestxxx -ptestxxx -e "use testxxx;update t_job set is_get_phone = '1' where create_user = 8582;"
check_status >> /root/is_get_phone.log
echo "" >> /root/is_get_phone.log
echo "--------------" >> /root/is_get_phone.log

# testxxx
mysql -utestxxx -ptestxxx -e "use testxxx;update t_job set is_get_phone = '1' where create_user = 9327;"
check_status >> /root/is_get_phone.log
echo "" >> /root/is_get_phone.log
echo "--------------" >> /root/is_get_phone.log


# 王老师 - 积题网运维机构
# update t_job set answer_type='1',max_answer_num=50,is_open_answer='1',is_get_phone = '1' where create_user = 5219;
# update t_job_invite set type=1 where create_user = 5219;

mysql -utestxxx -ptestxxx -e "use testxxx;update t_job set answer_type='1',max_answer_num=50,is_open_answer='1',is_get_phone = '1',open_direct_start='1',type='sole' where create_user = 5219;"
mysql -utestxxx -ptestxxx -e "use testxxx;update t_job_invite set type=1 where create_user = 5219;"
check_status >> /root/is_get_phone.log
echo "" >> /root/is_get_phone.log
echo "--------------" >> /root/is_get_phone.log

echo "mysql update is_get_phone success !" >> /root/is_get_phone.log
echo "" >> /root/is_get_phone.log
echo "更新时间：$time1" >> /root/is_get_phone.log