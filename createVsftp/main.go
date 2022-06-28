package main

import (
	"fmt"
	"vsftp/cmd"
	"vsftp/tools"
)

func main() {
	fmt.Println("###判断vsftp是否安装###")
	checkFtp := "vsftpd -v"
	_, _, err := cmd.ShellOut(checkFtp)
	if err != nil {
		fmt.Println("vsftp不存在。")
		fmt.Println("###开始安装vsftp###")

		installFtp := "yum install -y vsftpd && systemctl start vsftpd && systemctl enable vsftpd && systemctl status vsftpd"
		_, _, err = cmd.ShellOut(installFtp)
		if err != nil {
			fmt.Println("vsftp安装失败，请检查。")
		} else {
			fmt.Println("vsftp安装成功。")
		}

		// 修改vsftp配置文件
		tools.ChangeFtpConf()
		tools.ChangePamConf()

		// 重启vsftp
		tools.ResFtp()

	} else {
		fmt.Println("ftp已安装。")
	}

	var (
		userName   string
		newFtpPath string
	)

	// 默认ftp路径
	ftpPath := "/opt/ftp/wyn"
	tools.CreateFtpPath(ftpPath)

	fmt.Println("###当前ftp路径###")
	fmt.Println(ftpPath)

	var str string
	fmt.Println("是否修改？[yes/no]")
	fmt.Scanln(&str)
	switch str {
	case "y", "Y", "yes", "Yes":
		fmt.Println("请输入ftp路径：")
		fmt.Scanln(&newFtpPath)
		tools.CreateFtpPath(newFtpPath)
		fmt.Println("当前ftp路径：")
		fmt.Println(newFtpPath)

		fmt.Println("###添加vsftp用户###")
		fmt.Println("请输入用户名：")
		fmt.Scanln(&userName)

		// 创建ftp用户
		tools.CreateFtpUser(newFtpPath, userName)
		return
	case "n", "N", "no", "No":
		fmt.Println("已沿用当前ftp路径, Next...")
	default:
		fmt.Println("请输入yes或者no")
		return
	}

	fmt.Println("###添加vsftp用户###")
	fmt.Println("请输入用户名：")
	fmt.Scanln(&userName)

	// 创建ftp用户
	tools.CreateFtpUser(ftpPath, userName)
}
