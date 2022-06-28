package tools

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strings"
)

// 修改vsftp配置文件
func ChangeFtpConf() {
	oldFile := "/etc/vsftpd/vsftpd.conf"
	f, err := os.Open(oldFile)
	if err != nil {
		fmt.Println("文件打开失败")
		return
	}
	defer f.Close()

	var (
		oldStr1  = "anonymous_enable=YES"
		oldStr2  = "#anon_mkdir_write_enable=YES"
		oldStr3  = "#chown_uploads=YES"
		oldStr4  = "#async_abor_enable=YES"
		oldStr5  = "#ascii_upload_enable=YES"
		oldStr6  = "#ascii_download_enable=YES"
		oldStr7  = "#ftpd_banner"
		oldStr8  = "#chroot_local_user=YES"
		oldStr9  = "#chroot_list_enable=YES"
		oldStr10 = "#chroot_list_file"
		newStr1  = "anonymous_enable=NO"
		newStr2  = "anon_mkdir_write_enable=YES"
		newStr3  = "chown_uploads=YES"
		newStr4  = "async_abor_enable=YES"
		newStr5  = "ascii_upload_enable=YES"
		newStr6  = "ascii_download_enable=YES"
		newStr7  = "ftpd_banner=Welcome to blah FTP service."
		newStr8  = "chroot_local_user=NO"
		newStr9  = "chroot_list_enable=YES"
		newStr10 = "chroot_list_file=/etc/vsftpd/chroot_list"
		newStr11 = "pasv_min_port=4500\npasv_max_port=5000\nallow_writeable_chroot=YES"
	)

	buf := bufio.NewReader(f)
	var rep1 = []string{newStr1}
	var rep2 = []string{newStr2}
	var rep3 = []string{newStr3}
	var rep4 = []string{newStr4}
	var rep5 = []string{newStr5}
	var rep6 = []string{newStr6}
	var rep7 = []string{newStr7}
	var rep8 = []string{newStr8}
	var rep9 = []string{newStr9}
	var rep10 = []string{newStr10}
	var result = ""

	// 逐行读取
	for {
		a, _, err := buf.ReadLine()
		if err == io.EOF {
			fmt.Println("ftpConfig文件配置完毕。")
			break
		}

		if strings.Contains(string(a), oldStr1) { //匹配文件中带oldStr1的字段
			result += strings.Join(rep1, "") + "\n"
		} else if strings.Contains(string(a), oldStr2) {
			result += strings.Join(rep2, "") + "\n"
		} else if strings.Contains(string(a), oldStr3) {
			result += strings.Join(rep3, "") + "\n"
		} else if strings.Contains(string(a), oldStr4) {
			result += strings.Join(rep4, "") + "\n"
		} else if strings.Contains(string(a), oldStr5) {
			result += strings.Join(rep5, "") + "\n"
		} else if strings.Contains(string(a), oldStr6) {
			result += strings.Join(rep6, "") + "\n"
		} else if strings.Contains(string(a), oldStr7) {
			result += strings.Join(rep7, "") + "\n"
		} else if strings.Contains(string(a), oldStr8) {
			result += strings.Join(rep8, "") + "\n"
		} else if strings.Contains(string(a), oldStr9) {
			result += strings.Join(rep9, "") + "\n"
		} else if strings.Contains(string(a), oldStr10) {
			result += strings.Join(rep10, "") + "\n"
		} else {
			result += string(a) + "\n"
		}
	}

	// 清空文件重新写入数据
	fw, err := os.OpenFile(oldFile, os.O_WRONLY|os.O_CREATE|os.O_TRUNC, 0666)
	if err != nil {
		fmt.Println("文件打开失败，请检查。")
		return
	}
	defer fw.Close()

	w := bufio.NewWriter(fw)
	w.WriteString(result)
	if err != nil {
		panic(err)
	}
	w.Flush()

	// 追加数据到vsftp配置文件
	fadd, err := os.OpenFile(oldFile, os.O_CREATE|os.O_WRONLY|os.O_APPEND, os.ModePerm)
	if err != nil {
		fmt.Println("文件打开异常，追加数据失败，请检查。")
	}
	defer fadd.Close()

	fd := bufio.NewWriter(fadd)
	fd.WriteString(newStr11)
	if err != nil {
		panic(err)
	}
	fd.Flush()
}

// 修改pamFtpConfig配置文件
func ChangePamConf() {
	var (
		oldPamFtpConfig = "pam_shells.so"
		newPamFtpConfig = "auth       required     pam_nologin.so"
	)

	var result = ""
	pamFtp := "/etc/pam.d/vsftpd"

	pf, err := os.Open(pamFtp)
	if err != nil {
		fmt.Println("文件打开失败，请检查。", err)
		return
	}
	defer pf.Close()

	// 读取pamFtpConfig配置文件
	pamBuf := bufio.NewReader(pf)
	var pamRep = []string{newPamFtpConfig}

	for {
		b, _, err := pamBuf.ReadLine()
		if err == io.EOF {
			fmt.Println("pamFtpConfig文件配置完毕。")
			break
		}

		if strings.Contains(string(b), oldPamFtpConfig) {
			result += strings.Join(pamRep, "") + "\n"
		} else {
			result += string(b) + "\n"
		}
	}

	// 重新写入pamFtpConfig配置文件
	pw, err := os.OpenFile(pamFtp, os.O_CREATE|os.O_WRONLY|os.O_TRUNC, 0666)
	if err != nil {
		fmt.Println("pamFtpConfig文件打开失败，请检查。")
		return
	}
	defer pw.Close()

	p := bufio.NewWriter(pw)
	p.WriteString(result)
	if err != nil {
		panic(err)
	}
	p.Flush()
}
