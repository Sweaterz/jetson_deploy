#!/bin/bash
# 安装pip3以及Jetson-stats 可以使用jtop工具
# 以及安装cmake、eigen等必要库

echo "install pip3"
sudo apt install python3-pip python3-dev -y
python3 -m pip install --upgrade pip    # 升级pip
echo "install cmake"
sudo apt install cmake -y               # 安装cmake
echo "install eigen3"
sudo apt install libeigen3-dev -y       # 安装eigen3
echo "install jetson-stats"
sudo -H pip3 install -U jetson-stats==4.2.6   # 安装Jetson-stats 管理工具（jtop)
echo "操作完成，重新启动系统后生效。"
read  -n 1 -p "需要立刻重启吗? (Y/N) " REPLY
if [[ $REPLY =~ ^[Yy]$ ]]
then
   sudo shutdown -r now
   echo "正在重启..."
else
   echo "已取消重启。"
fi
echo "安装完成，按任意建继续。Completed. Press any key to continue."