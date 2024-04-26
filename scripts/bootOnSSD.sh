#!/bin/bash

#此脚本用于设置Jetson SSD启动

# 确保在命令失败时退出
set -e

echo -e "格式化磁盘 /dev/nvme0n1"

# 获取用户确认，以防误删
read -p "你确定要格式化 /dev/nvme0n1 磁盘吗？此操作将删除所有数据！(y/n)" -n 1
echo 
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

# 开始格式化
DEVICE='/dev/nvme0n1'
sudo mkfs.ext4 ${DEVICE}
(
echo g # 创建新的 GPT 分区表
echo n # 添加新分区
echo 1 # 分区号为 1
echo   # 使用默认的开始扇区
echo   # 使用默认的结束扇区（使用剩下的所有磁盘空间）
echo w # 写入分区表并退出
) | sudo fdisk ${DEVICE}

# 格式化新分区为 ext4
sudo mkfs.ext4 ${DEVICE}p1

echo "磁盘 /dev/nvme0n1 格式化成功。"

# 移动到目录
echo ${0%/*}
# cd到脚本所在目录${0%/*}
cd ${0%/*}

# 克隆项目
[ -d "rootOnNVMe" ] && echo "目录 rootOnNVMe 已经存在，跳过克隆步骤" || git clone https://github.com/jetsonhacks/rootOnNVMe.git 

cd rootOnNVMe

# 将root从eMMC移动到SSD
echo "开始将 root 从 eMMC 移到 SSD"
sudo ./copy-rootfs-ssd.sh 
echo "移动 root 完成。"

# 设置在 SSD 上启动
echo "开始设置在 SSD 上启动"
sudo ./setup-service.sh
echo "设置启动完成。"

echo "操作完成，设置将在重新启动系统后生效。"

read -p "需要立刻重启吗? (Y/N) " REPLY -n 1
if [[ $REPLY =~ ^[Yy]$ ]]
then
   echo "正在重启..."
   sudo shutdown -r now
else
   echo "已取消重启。"
fi



