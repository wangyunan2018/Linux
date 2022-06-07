#!/bin/bash

if [ -f ./result.txt ]; then
    cp ./result.txt ./result.txt.bak
    cat /dev/null > ./result.txt
fi

time1=$(date "+%Y-%m-%d %H:%M:%S")

check_code_status(){
    if [ $? -eq 0 ]; then
	    echo "返回状态码：$?，数据提取成功。"
	    echo "数据提取时间：$time1"
        echo "数据提取时间：$time1" &> ./access.log
    else
	    echo "返回状态码：$?，状态码不为0，数据提取异常，请检查。"
	    echo "数据提取时间：$time1"
        echo "数据提取时间：$time1" &> ./access.log
    fi
}

file_path1=./job.txt
file_path2=./job_seeker.txt

str1(){
    echo "" >> result.txt
}

# cat /dev/null > result.txt &&  cat job.txt | grep -i -w "高级运维工程师" >> result.txt
# cat job_seeker.txt | grep -i -w "高级运维工程师" | wc -l >> result.txt

cat $file_path1 | grep -i -w "高级运维开发工程师(docker/k8s/go)" >> result.txt
cat $file_path2 | grep -i -w "高级运维开发工程师(docker/k8s/go)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "Docker专题" >> result.txt
cat $file_path2 | grep -i -w "Docker专题" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "高级运维工程师" >> result.txt
cat $file_path2 | grep -i -w "高级运维工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "初中级运维工程师" >> result.txt
cat $file_path2 | grep -i -w "初中级运维工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "中级java开发工程师(字符串操作/算术运算/异常处理)" >> result.txt
cat $file_path2 | grep -i -w "中级java开发工程师(字符串操作/算术运算/异常处理)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "初级java开发工程师(入门/初级)" >> result.txt
cat $file_path2 | grep -i -w "初级java开发工程师(入门/初级)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "2021届毕业生笔试题- JAVA" >> result.txt
cat $file_path2 | grep -i -w "2021届毕业生笔试题- JAVA" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "java研发工程师" >> result.txt
cat $file_path2 | grep -i -w "java研发工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "java开发工程师(爬虫)" >> result.txt
cat $file_path2 | grep -i -w "java开发工程师(爬虫)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "高级前端工程师（js）" >> result.txt
cat $file_path2 | grep -i -w "高级前端工程师（js）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "中级前端工程师" >> result.txt
cat $file_path2 | grep -i -w "中级前端工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "初级前端工程师" >> result.txt
cat $file_path2 | grep -i -w "初级前端工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "前端实习" >> result.txt
cat $file_path2 | grep -i -w "前端实习" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "web前端开发工程师（vue）" >> result.txt
cat $file_path2 | grep -i -w "web前端开发工程师（vue）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "高级web前端开发工程师（react）" >> result.txt
cat $file_path2 | grep -i -w "高级web前端开发工程师（react）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "中级web前端开发工程师（angular）" >> result.txt
cat $file_path2 | grep -i -w "中级web前端开发工程师（angular）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "高级python开发工程师" >> result.txt
cat $file_path2 | grep -i -w "高级python开发工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "中级python开发工程师" >> result.txt
cat $file_path2 | grep -i -w "中级python开发工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "初级python开发(初级/lambda/数据类型)" >> result.txt
cat $file_path2 | grep -i -w "初级python开发(初级/lambda/数据类型)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "python实习" >> result.txt
cat $file_path2 | grep -i -w "python实习" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "python开发工程师(爬虫)" >> result.txt
cat $file_path2 | grep -i -w "python开发工程师(爬虫)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "python数据分析师(数据分析/python)" >> result.txt
cat $file_path2 | grep -i -w "python数据分析师(数据分析/python)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "Python全栈工程师" >> result.txt
cat $file_path2 | grep -i -w "Python全栈工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "初级golang开发" >> result.txt
cat $file_path2 | grep -i -w "初级golang开发" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "中级golang开发工程师" >> result.txt
cat $file_path2 | grep -i -w "中级golang开发工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "高级golang开发工程师" >> result.txt
cat $file_path2 | grep -i -w "高级golang开发工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "php大厂算法题(字节跳动/百度)" >> result.txt
cat $file_path2 | grep -i -w "php大厂算法题(字节跳动/百度)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "PHP开发工程师" >> result.txt
cat $file_path2 | grep -i -w "PHP开发工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "php实习（大厂原题）" >> result.txt
cat $file_path2 | grep -i -w "php实习（大厂原题）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "高级算法工程师" >> result.txt
cat $file_path2 | grep -i -w "高级算法工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "算法工程师(TensorFlow)" >> result.txt
cat $file_path2 | grep -i -w "算法工程师(TensorFlow)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "JavaScript大厂算法题(腾讯/百度/字节跳动/爱立信)" >> result.txt
cat $file_path2 | grep -i -w "JavaScript大厂算法题(腾讯/百度/字节跳动/爱立信)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "go语言大厂算法题(字节跳动/腾讯)" >> result.txt
cat $file_path2 | grep -i -w "go语言大厂算法题(字节跳动/腾讯)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "go语言大厂算法题(美团/字节跳动)" >> result.txt
cat $file_path2 | grep -i -w "go语言大厂算法题(美团/字节跳动)" | wc -l >> result.txt
str1


cat $file_path1 | grep -i -w "php大厂算法题(中兴/小米/微软/腾讯)" >> result.txt
cat $file_path2 | grep -i -w "php大厂算法题(中兴/小米/微软/腾讯)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "python大厂算法题(字节跳动、腾讯)" >> result.txt
cat $file_path2 | grep -i -w "python大厂算法题(字节跳动、腾讯)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "python大厂算法题(快手/百度/字节跳动)" >> result.txt
cat $file_path2 | grep -i -w "python大厂算法题(快手/百度/字节跳动)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "c语言大厂算法题(字节跳动/度小满)" >> result.txt
cat $file_path2 | grep -i -w "c语言大厂算法题(字节跳动/度小满)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "c语言大厂算法题(百度/字节跳动/腾讯/滴滴)" >> result.txt
cat $file_path2 | grep -i -w "c语言大厂算法题(百度/字节跳动/腾讯/滴滴)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "GPU/CUDA深度学习算法工程师" >> result.txt
cat $file_path2 | grep -i -w "GPU/CUDA深度学习算法工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "深度学习算法工程师" >> result.txt
cat $file_path2 | grep -i -w "深度学习算法工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "Android开发工程师" >> result.txt
cat $file_path2 | grep -i -w "Android开发工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "Android安卓移动开发工程师" >> result.txt
cat $file_path2 | grep -i -w "Android安卓移动开发工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "初级Android开发工程师" >> result.txt
cat $file_path2 | grep -i -w "初级Android开发工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "软件测试工程师" >> result.txt
cat $file_path2 | grep -i -w "软件测试工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "FPGA测试工程师" >> result.txt
cat $file_path2 | grep -i -w "FPGA测试工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "硬件测试工程师" >> result.txt
cat $file_path2 | grep -i -w "硬件测试工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "c++初级开发" >> result.txt
cat $file_path2 | grep -i -w "c++初级开发" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "cpp开发工程师" >> result.txt
cat $file_path2 | grep -i -w "cpp开发工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w ".NET开发助理工程师" >> result.txt
cat $file_path2 | grep -i -w ".NET开发助理工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w ".net开发工程师(ASP.NET)" >> result.txt
cat $file_path2 | grep -i -w ".net开发工程师(ASP.NET)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "C#.net中高级开发工程师" >> result.txt
cat $file_path2 | grep -i -w "C#.net中高级开发工程师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "c#开发工程师(软件开发)" >> result.txt
cat $file_path2 | grep -i -w "c#开发工程师(软件开发)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "c#开发工程师(c#/asp.net)" >> result.txt
cat $file_path2 | grep -i -w "c#开发工程师(c#/asp.net)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "高级swift开发工程师(ios)" >> result.txt
cat $file_path2 | grep -i -w "高级swift开发工程师(ios)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "中级swift开发工程师(ios)" >> result.txt
cat $file_path2 | grep -i -w "中级swift开发工程师(ios)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "初级swift开发工程师(ios)" >> result.txt
cat $file_path2 | grep -i -w "初级swift开发工程师(ios)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "高级网络工程师(大型局域网)" >> result.txt
cat $file_path2 | grep -i -w "高级网络工程师(大型局域网)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "中级网络工程师(DNS/TCP/IP)" >> result.txt
cat $file_path2 | grep -i -w "中级网络工程师(DNS/TCP/IP)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "初级网络工程师(路由/交换)" >> result.txt
cat $file_path2 | grep -i -w "初级网络工程师(路由/交换)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "数据库开发工程师(mysql)" >> result.txt
cat $file_path2 | grep -i -w "数据库开发工程师(mysql)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "数据库开发工程师(mongodb)" >> result.txt
cat $file_path2 | grep -i -w "数据库开发工程师(mongodb)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "数据库工程师（redis）" >> result.txt
cat $file_path2 | grep -i -w "数据库工程师（redis）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "Ubuntu如何安装MySQL？" >> result.txt
cat $file_path2 | grep -i -w "Ubuntu如何安装MySQL？" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "黑客装逼技术" >> result.txt
cat $file_path2 | grep -i -w "黑客装逼技术" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "UI设计师(小程序)" >> result.txt
cat $file_path2 | grep -i -w "UI设计师(小程序)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "UI设计师(初级)" >> result.txt
cat $file_path2 | grep -i -w "UI设计师(初级)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "UI设计师(3-5年)" >> result.txt
cat $file_path2 | grep -i -w "UI设计师(3-5年)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "会计测评" >> result.txt
cat $file_path2 | grep -i -w "会计测评" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "财务主办会计" >> result.txt
cat $file_path2 | grep -i -w "财务主办会计" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "总账会计" >> result.txt
cat $file_path2 | grep -i -w "总账会计" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "税务会计" >> result.txt
cat $file_path2 | grep -i -w "税务会计" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "会计核算" >> result.txt
cat $file_path2 | grep -i -w "会计核算" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "出纳" >> result.txt
cat $file_path2 | grep -i -w "出纳" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "会计助理" >> result.txt
cat $file_path2 | grep -i -w "会计助理" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "成本会计（工业企业测试题）" >> result.txt
cat $file_path2 | grep -i -w "成本会计（工业企业测试题）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "财务会计（互联网行业）" >> result.txt
cat $file_path2 | grep -i -w "财务会计（互联网行业）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "财务会计（电商行业）" >> result.txt
cat $file_path2 | grep -i -w "财务会计（电商行业）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "财务会计（代理记账行业）" >> result.txt
cat $file_path2 | grep -i -w "财务会计（代理记账行业）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "财务会计（建筑行业测试题）" >> result.txt
cat $file_path2 | grep -i -w "财务会计（建筑行业测试题）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "财务会计（教育培训行业）" >> result.txt
cat $file_path2 | grep -i -w "财务会计（教育培训行业）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "财务会计（预算管理会计）" >> result.txt
cat $file_path2 | grep -i -w "财务会计（预算管理会计）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "产品经理（卷二）" >> result.txt
cat $file_path2 | grep -i -w "产品经理（卷二）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "产品经理（卷一）" >> result.txt
cat $file_path2 | grep -i -w "产品经理（卷一）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "产品助理(需求/需求分析/部门协调)" >> result.txt
cat $file_path2 | grep -i -w "产品助理(需求/需求分析/部门协调)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "产品运营总监（运营/需求/规划/对接）" >> result.txt
cat $file_path2 | grep -i -w "产品运营总监（运营/需求/规划/对接）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "社群运营" >> result.txt
cat $file_path2 | grep -i -w "社群运营" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "运营专员(产品运营)" >> result.txt
cat $file_path2 | grep -i -w "运营专员(产品运营)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "电商运营(综合)" >> result.txt
cat $file_path2 | grep -i -w "电商运营(综合)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "运营专员(新媒体运营)" >> result.txt
cat $file_path2 | grep -i -w "运营专员(新媒体运营)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "运营助理" >> result.txt
cat $file_path2 | grep -i -w "运营助理" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "内容运营" >> result.txt
cat $file_path2 | grep -i -w "内容运营" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "活动运营" >> result.txt
cat $file_path2 | grep -i -w "活动运营" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "线上推广（推广）" >> result.txt
cat $file_path2 | grep -i -w "线上推广（推广）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "运营客服（普通话）" >> result.txt
cat $file_path2 | grep -i -w "运营客服（普通话）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "智一面业务流程评测" >> result.txt
cat $file_path2 | grep -i -w "智一面业务流程评测" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "公务员党政基础知识" >> result.txt
cat $file_path2 | grep -i -w "公务员党政基础知识" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "研发助理（office/需求分析）" >> result.txt
cat $file_path2 | grep -i -w "研发助理（office/需求分析）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "研发助理（助理/office）" >> result.txt
cat $file_path2 | grep -i -w "研发助理（助理/office）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "行政人事实习生" >> result.txt
cat $file_path2 | grep -i -w "行政人事实习生" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "招聘专员HRBP(眼光独到/分析)" >> result.txt
cat $file_path2 | grep -i -w "招聘专员HRBP(眼光独到/分析)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "招聘专员（行业经验）" >> result.txt
cat $file_path2 | grep -i -w "招聘专员（行业经验）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "SEO_SEM 优化专员" >> result.txt
cat $file_path2 | grep -i -w "SEO_SEM 优化专员" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "法务专员（法律/法务/法人）" >> result.txt
cat $file_path2 | grep -i -w "法务专员（法律/法务/法人）" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "销售" >> result.txt
cat $file_path2 | grep -i -w "销售" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "销售顾问" >> result.txt
cat $file_path2 | grep -i -w "销售顾问" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "图文审核" >> result.txt
cat $file_path2 | grep -i -w "图文审核" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "数据标记师" >> result.txt
cat $file_path2 | grep -i -w "数据标记师" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "第一届全国高校商务英语竞赛" >> result.txt
cat $file_path2 | grep -i -w "第一届全国高校商务英语竞赛" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "第二届全国高校商务英语竞赛" >> result.txt
cat $file_path2 | grep -i -w "第二届全国高校商务英语竞赛" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "第三届全国高校商务英语竞赛" >> result.txt
cat $file_path2 | grep -i -w "第三届全国高校商务英语竞赛" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "第四届全国高校商务英语竞赛" >> result.txt
cat $file_path2 | grep -i -w "第四届全国高校商务英语竞赛" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "语文能力练习" >> result.txt
cat $file_path2 | grep -i -w "语文能力练习" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "语文辅导老师面经" >> result.txt
cat $file_path2 | grep -i -w "语文辅导老师面经" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "语文模拟试卷(判断题)" >> result.txt
cat $file_path2 | grep -i -w "语文模拟试卷(判断题)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "大学高数" >> result.txt
cat $file_path2 | grep -i -w "大学高数" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "数学模拟题(单选)" >> result.txt
cat $file_path2 | grep -i -w "数学模拟题(单选)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "问男友的100个送命题" >> result.txt
cat $file_path2 | grep -i -w "问男友的100个送命题" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "掘金密卷之java月考" >> result.txt
cat $file_path2 | grep -i -w "掘金密卷之java月考" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "three.js模拟题(一)" >> result.txt
cat $file_path2 | grep -i -w "three.js模拟题(一)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "three.js模拟题(二)" >> result.txt
cat $file_path2 | grep -i -w "three.js模拟题(二)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "three.js模拟题(三)" >> result.txt
cat $file_path2 | grep -i -w "three.js模拟题(三)" | wc -l >> result.txt
str1

cat $file_path1 | grep -i -w "Dart模拟题" >> result.txt
cat $file_path2 | grep -i -w "Dart模拟题" | wc -l >> result.txt
str1

check_code_status