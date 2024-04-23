#!/bin/bash

set -e  # exit when any command fails

# 安装pip3
sudo apt install python3-pip python3-dev
python3 -m pip install --upgrade pip # 升级pip
sudo -H pip3 install jetson-stats # 安装Jetson-stats 管理工具（jtop)

export CUDA_VERSION=10.2
export CUDA_PATH=/usr/local/cuda-$CUDA_VERSION
export CUDNN_PKG_VERSION=8.2.1.32-1+cuda10.2
export TRT_PKG_VERSION=8.2.1-1+cuda10.2
export CUDA_ARM64=$CUDNN_PKG_VERSION_arm64.deb
export TRT_ARM64=$TRT_PKG_VERSION_arm64.deb

# Update your local package database first, very necessary for fresh installations
sudo apt-get update

# 安装cuda
sudo apt-get install -y cuda-toolkit-$CUDA_VERSION

echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_PATH/lib64" >> ~/.bashrc
echo "export PATH=$PATH:$CUDA_PATH/bin" >> ~/.bashrc
echo "export CUDA_HOME=$CUDA_HOME:$CUDA_PATH" >> ~/.bashrc

# 安装cudnn
for package in libcudnn8 libcudnn8-dev libcudnn8-samples; do
    sudo dpkg -i $package"_"$CUDA_ARM64
done

# 安装tensorRT
declare -a tensorRT=("libnvinfer8" "libnvinfer-dev" "libnvinfer-plugin8" 
"libnvinfer-plugin-dev" "libnvonnxparsers8" "libnvonnxparsers-dev" "libnvparsers8" 
"libnvparsers-dev" "libnvinfer-bin" "libnvinfer-doc" "libnvinfer-samples" 
"tensorrt" "python3-libnvinfer" "python3-libnvinfer-dev" 
"graphsurgeon-tf" "uff-converter-tf")

for package in "${tensorRT[@]}"; do
    sudo dpkg -i $package"_"$TRT_ARM64
done
