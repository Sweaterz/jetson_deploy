#!/bin/bash

set =e

# 移动到目录
echo ${0%/*}
# cd到脚本所在目录${0%/*}
cd ${0%/*}
[ -d "NetworkConfig" ] && echo "目录NetworkConfig存在" || echo "Can't find NetworkConfig"

sudo cp ./NetworkConfig/hkwifi /etc/NetworkManager/system-connections
echo "网络设置成功."

