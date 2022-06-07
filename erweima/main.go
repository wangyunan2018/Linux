package main

import (
	"image/color"
	"log"

	"github.com/skip2/go-qrcode"
)

func main() {
	qr, err := qrcode.New("http://www.gtalent.cn/t/%E9%9D%A2%E7%BB%8F", qrcode.Medium)
	if err != nil {
		log.Fatal(err)
	} else {
		qr.BackgroundColor = color.RGBA{50, 205, 50, 255}
		qr.ForegroundColor = color.White
		qr.WriteFile(256, "./机器学习.png")
	}
}
