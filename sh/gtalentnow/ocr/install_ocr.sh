#!/bin/bash

docker run -itd --name ppdocr --restart=always -p 8866:8866 -v /home/PaddleOCR registry.cn-chengdu.aliyuncs.com/wangyunan_images_public/paddleocr:v1
