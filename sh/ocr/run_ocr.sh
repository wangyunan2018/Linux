#!/bin/bash

image_dir=./doc/imgs
det_model_dir=./inference/ch_ppocr_mobile_v1.1_det_infer/
rec_model_dir=./inference/ch_ppocr_mobile_v1.1_rec_infer/

/usr/local/bin/python3 tools/infer/predict_system.py --image_dir="$image_dir/$1" --det_model_dir="$det_model_dir" --rec_model_dir="$rec_model_dir"
