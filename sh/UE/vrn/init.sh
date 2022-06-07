#!/bin/bash

# Install the Torch distribution.
# mkdir -p $HOME/usr/{local,src}
cd $HOME/usr/local
# git clone https://github.com/torch/distro.git
mv distro torch
cd torch
./install-deps
./install.sh
source $HOME/usr/local/torch/install/bin/torch-activate

# Install THPP and fb.python for the face alignment code
sleep 1
cd $HOME/usr/src
# git clone https://github.com/1adrianb/thpp.git
cd thpp/thpp
THPP_NOFB=1 ./build.sh

# Install fb.python.
sleep 1
cd $HOME/usr/src
# git clone https://github.com/facebook/fblualib.git
cd fblualib/fblualib/python
luarocks make rockspec/*

# cd $HOME
# git clone --recursive https://github.com/AaronJackson/vrn.git
cd /vrn
# ./download.sh
# /bin/bash ./run.sh