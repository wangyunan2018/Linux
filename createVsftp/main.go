package main

import (
	"fmt"
	"os"
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
		userName string
	)

	fmt.Println("###添加vsftp用户###")
	fmt.Println("请输入用户名：")
	fmt.Scanln(&userName)

	ftpPath := "/opt/wyn/ftp/"
	err = os.MkdirAll(ftpPath, os.ModePerm)
	if err != nil {
		fmt.Println("创建失败，检查是否已存在该ftp目录；", err.Error())
	}

	addUser := "useradd -s /sbin/nologin -d " + ftpPath + " " + userName + " && " + "chown -R " + userName + ":" + userName + " " + ftpPath
	_, _, err = cmd.ShellOut(addUser)
	if err != nil {
		fmt.Println("用户添加失败，请确认系统中是否已存在该账户；", err.Error())
		return
	} else {
		fmt.Println("FTP用户添加成功。")
	}

	userPwd := "echo " + userName + " | " + "passwd " + userName + " --stdin"
	_, stderr, err := cmd.ShellOut(userPwd)
	if err != nil {
		fmt.Println("密码设置失败，请手动设置；", err.Error())
		fmt.Println(stderr)
	} else {
		fmt.Println("密码设置成功，默认密码为用户名。")
	}

	// 追加ftp账号到chroot_list文件中
	cfgPath := "/etc/vsftpd/chroot_list"
	file, err := os.OpenFile(cfgPath, os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0644)
	if err != nil {
		fmt.Println(err.Error())
	}
	defer file.Close()

	_, err = file.WriteString(userName + "\n")
	if err != nil {
		fmt.Println("ftp用户追加失败，请检查；", err.Error())
	}

	// 重启vsftp
	tools.ResFtp()
}
