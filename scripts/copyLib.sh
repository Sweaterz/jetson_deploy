#!/bin/bash
set -e

cd ${0%/*}/lib


echo -e "\e[33m********* Start copying lib files to /opt *********\e[0m"

lib_files=("log4cpp" "jsoncpp" "opencv454")

for lib_file in ${lib_files[*]}
do
    echo -e "\e[33m********* Start to copy $lib_file *********\e[0m"
    sudo cp -r ./$lib_file /opt/ && echo -e "\e[32mSuccessfully copied $lib_file\e[0m" || echo -e "\e[31mFailed to copy $lib_file\e[0m"
done

echo -e "\e[33m********* End of copying lib files to /opt *********\e[0m"

echo -e "Success to copy lib, press any key to continue."
echo -e "安装完成，按任意建继续。Completed. Press any key to continue."