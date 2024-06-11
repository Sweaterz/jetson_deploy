#!/bin/bash
# 安装pip3以及Jetson-stats 可以使用jtop工具
# 以及安装cmake、eigen等必要库

echo "install pip3"
sudo apt install python3-pip python3-dev
python3 -m pip install --upgrade pip # 升级pip
sudo -H pip3 install jetson-stats   # 安装Jetson-stats 管理工具（jtop)
sudo apt install cmake              # 安装cmake
sudo apt install libeigen3-dev      # 安装eigen3

echo "安装完成，按任意建继续。Completed. Press any key to continue."