#!/bin/bash

set -e  # exit when any command fails

export CUDA_VERSION=10.2

export CUDA_VERSION2=10-2
export CUDA_PATH=/usr/local/cuda-$CUDA_VERSION
export CUDNN_PKG_VERSION=8.2.1.32-1+cuda10.2
export TRT_PKG_VERSION=8.2.1-1+cuda10.2
export CUDA_ARM64=${CUDNN_PKG_VERSION}_arm64.deb
export TRT_ARM64=${TRT_PKG_VERSION}_arm64.deb
export TRT_ALL=${TRT_PKG_VERSION}_all.deb

# Update your local package database first, very necessary for fresh installations
sudo apt-get update

# 安装cuda
sudo apt-get install -y cuda-toolkit-${CUDA_VERSION2}

echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_PATH/lib64" >> ~/.bashrc
echo "export PATH=$PATH:$CUDA_PATH/bin" >> ~/.bashrc
echo "export CUDA_HOME=$CUDA_HOME:$CUDA_PATH" >> ~/.bashrc

# 安装包路径（需修改）
export DEB_DIRECTORY="/home/hk/deb/deb"
if [-d "${DEB_DIRECTORY}" ]; then
    echo "目录 ${DEB_DIRECTORY} 存在."
else
    echo "目录 ${DEB_DIRECTORY} 不存在."
fi
cd ${DEB_DIRECTORY}

# 安装cuDNN
for package in libcudnn8 libcudnn8-dev libcudnn8-samples; do
    sudo dpkg -i $package"_"$CUDA_ARM64
done

# 安装tensorRT
declare -a tensorRT=("libnvinfer8" "libnvinfer-dev" "libnvinfer-plugin8" 
"libnvinfer-plugin-dev" "libnvonnxparsers8" "libnvonnxparsers-dev" "libnvparsers8" 
"libnvparsers-dev" "libnvinfer-bin" 
"python3-libnvinfer" "python3-libnvinfer-dev" 
"graphsurgeon-tf" "uff-converter-tf")

declare -a tensorRT2=("libnvinfer-doc" "libnvinfer-samples")

for package in "${tensorRT[@]}"; do
    sudo dpkg -i $package"_"$TRT_ARM64
done

for package in "${tensorRT2[@]}"; do
    sudo dpkg -i $package"_"$TRT_ALL
done

sudo dpkg -i tensorrt_8.2.1.9-1+cuda10.2_arm64.deb

echo "安装完成，按任意建继续。Completed. Press any key to continue."