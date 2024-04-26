# Jetson TX2 NX Deployment
A few of scripts help to deploy the jetson environment.  

## Description
This repositary contains a menu file to easily deploy the Jetson TX2 NX environment using shell scripts.

## Environment
Board: Jetson TX2 NX
Jetpack 4.6.2

## Scripts
### Boot on SSD
Generally, you burn the system into your eMMC. The eMMC just has small capacity, so you can boot it on your SSD. 

To do that, we need run scripts from Jetsonhacks [**rootOnNVMe**](https://github.com/jetsonhacks/rootOnNVMe.git) repository. I've bundled it into a single script.  All you need to do is run the 'bootOnSSD.sh' script.  

This script will help you format the disk '/dev/nvme0n1' to load the system. It will place the '/dev/nvme0n1 ' partition into '/dev/nvme0n1p1' and mount it. After running this script and rebooting, your device will boot on your SSD.

**Note:** The script will format the disk /dev/nvme0n1, so you need to check if any file still neccessary on the disk.

### Set Network
This script simply moves the configure file to '/etc/NetworkManager/system-connections' allowing your device automatically connect to the specified WiFi.

### Install CUDA cuDNN tensorRT packages
This script, "optimized_script.sh", simply installs the CUDA, cuDNN, and tensorRT Debian packages which are compatible with jetson 4.6.2.

**Note:** You need download the CUDA cuDNN tensorRT package through:
Click [**Here**](https://space.dingtalk.com/s/gwHPAAAAAllsYB0CzkZl8zAD2gAgMDRkZmVkYjgxYjM0NDFmNDgxZGZmNmE4YWQ2N2JhMWU) to download. 
Secret Code(密码): JzRj
Available until 2024-07-25 13:16.


**Note:** You need to put CUDA cuDNN tensorRT debian package in path:  **"/home/hk/deb/deb"**   
Or you can modify it in line 24 of ./scripts/optimized_script.sh.  


## How to start
You can run the command below on your command shell, then enter the menu interface.
>$ git clone https://github.com/Sweaterz/jetson_deploy.git
>$ cd jetson_deploy
>$ python3 demo.py  
  