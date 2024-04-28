#!/bin/bash
# 安装pip3以及Jetson-stats 可以使用jtop工具

echo "install pip3"
sudo apt install python3-pip python3-dev
python3 -m pip install --upgrade pip # 升级pip
sudo -H pip3 install jetson-stats # 安装Jetson-stats 管理工具（jtop)

