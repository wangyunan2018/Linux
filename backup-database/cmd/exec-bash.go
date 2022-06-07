package cmd

import (
	"fmt"
	"log"
	"os"
	"time"
)

func ExecShell() {
	timer := time.Now()
	year := timer.Year()
	month := int(timer.Month())
	day := timer.Day()

	// 将日期int类型转换成string类型
	cmdYear := fmt.Sprintf("%v", year)
	cmdMonth := fmt.Sprintf("%v", month)
	cmdDay := fmt.Sprintf("%v", day)

	execCmd := "docker exec -i mysql /bin/bash -c 'mysqldump -u root -h 127.0.0.1 -p1234 myblog > /var/lib/mysql/database_backup/myblog.sql && echo '当前容器所在路径：' && pwd'"
	out, errout, err := ShellOut(execCmd)
	if err != nil {
		log.Printf("命令执行失败,请检查: error: %v", err)
	}

	PrintOut()
	fmt.Println(out)
	fmt.Println(errout)

	// 重命名文件
	backupDatabaseFile := "/docker/mysql/data/database_backup/"

	oldFile := backupDatabaseFile + "myblog.sql"
	fmt.Println(oldFile)
	err = os.Rename(oldFile, backupDatabaseFile+"mysql_"+cmdYear+cmdMonth+cmdDay+".sql")
	if err != nil {
		panic(err)
	} else {
		fmt.Println("文件重命名成功！")
	}

}
