package tools

import (
	"fmt"
	"vsftp/cmd"
)

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
