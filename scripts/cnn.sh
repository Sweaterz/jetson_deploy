#!/bin/bash
set -e
cd /home/hk/deb/deb

export CUDA_VERSION=10.2
export CUDA_PATH=/usr/local/cuda-$CUDA_VERSION
export CUDNN_PKG_VERSION=8.2.1.32-1+cuda10.2
export TRT_PKG_VERSION=8.2.1-1+cuda10.2
export CUDA_ARM64=$CUDNN_PKG_VERSION_arm64.deb
export TRT_ARM64=$TRT_PKG_VERSION_arm64.deb

echo $CUDA_PATH
echo $CUDNN_PKG_VERSION
echo $CUDA_ARM64
echo $TRT_ARM64
exit 0


# 安装cudnn
for package in libcudnn8 libcudnn8-dev libcudnn8-samples; do
    echo $CUDA_ARM64
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

