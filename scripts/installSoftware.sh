#!/bin/bash
set -e
# 安装向日葵
function install_package() {
    local pkg_name=$1
    local pkg_file=$2
    echo -e "\e[33m************ Start to install $pkg_name ************\e[0m"
    
    if [ ! -f "$pkg_file" ]; then
        echo -e "\e[31mPackage file $pkg_file not found!\e[0m"
        exit 1
    fi
    
    sudo dpkg -i "$pkg_file"
    
    echo -e "\e[32mSuccessfully installed $pkg_name\e[0m"
    echo -e "\e[33m************ End of installation for $pkg_name ************\e[0m"
}

echo -e "\e[33m************ Start to install software ************\e[0m"
cd ${0%/*}
cd install_files

install_package "SunloginClient" "sunloginclient-10.0.2.24779_kylin_arm64.deb"

echo -e "\e[33m************ End of software installation ************\e[0m"

