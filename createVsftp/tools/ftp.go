package tools

import (
	"fmt"
	"os"
	"vsftp/cmd"
)

// 创建ftp目录
func CreateFtpPath(ftpPath string) {
	err := os.MkdirAll(ftpPath, os.ModePerm)
	if err != nil {
		fmt.Println("ftp目录已存在。")
	}
}

// ftp用户信息
func CreateFtpUser(ftpPath, userName string) {
	// 判断ftp用户是否存在
	if _, _, err := cmd.ShellOut("id " + userName); err == nil {
		fmt.Println("ftp用户已存在")
		return
	}

	// 创建ftp用户
	addUser := "useradd -s /sbin/nologin -d " + ftpPath + " " + userName + " && " + "chown -R " + userName + ":" + userName + " " + ftpPath
	_, _, err := cmd.ShellOut(addUser)
	if err == nil {
		fmt.Println("ftp用户创建成功。")
		// 设置ftp账户密码
		userPwd := "echo " + userName + " | " + "passwd " + userName + " --stdin"
		_, stderr, err := cmd.ShellOut(userPwd)
		if err != nil {
			fmt.Println("密码设置失败，请手动设置；", err.Error())
			fmt.Println(stderr)
		} else {
			fmt.Println("密码设置成功，默认密码为用户名。")
		}

		// 追加用户到ftp配置文件
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

		ResFtp()
	} else {
		fmt.Println(err.Error())
		return
	}
}

// 重启ftp
func ResFtp() {
	resCmd := "systemctl restart vsftpd"
	_, errout, err := cmd.ShellOut(resCmd)
	if err != nil {
		fmt.Println("ftp重启失败, 请检查! ", err.Error())
		fmt.Println(errout)
		return
	} else {
		fmt.Println("ftp重启成功。")
	}
}
