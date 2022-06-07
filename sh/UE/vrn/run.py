# -*- coding:utf-8 -*-
import os

# 获取文件所在路径
filePath = "/opt/vrn-master/examples/img/"
# 获取目录下的所有文件
fileList = os.listdir(filePath)

# 遍历
n = 0
for i in fileList:
    oldFile = filePath + os.sep + fileList[n]
    newFile = filePath + os.sep + "3D_" + str(n+1) + ".jpeg"

    os.rename(oldFile, newFile)
    print(oldFile + "  " + "已修改--->" + "  " + newFile)
    n += 1