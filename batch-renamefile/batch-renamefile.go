package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
)

func main() {
	// 获取文件目录
	s_dir := "/root/test/img/"
	files, _ := ioutil.ReadDir(s_dir)

	// 遍历文件
	for i, f := range files {
		fullName := f.Name()
		fileExt := filepath.Ext(fullName)
		newFile := "img_" + fmt.Sprintf("%v", i+1) + fileExt
		err := os.Rename(s_dir+fullName, s_dir+newFile)
		if err != nil {
			fmt.Println(err)
		}
	}
}
