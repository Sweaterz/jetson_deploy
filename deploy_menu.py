#!/usr/bin/python3
#!/usr/bin/python3
"""
menu.py
Provides an easy-to-use interface to deploy the Jetson TX2 NX environment using shell scripts.
提供了一种简单的操作界面部署Jetson开发板
"""
from SimpleMenu import Menu
import os
import time
import curses

# 设置脚本的存储路径
scriptsPath = "./scripts"

while True:
    new_menu = Menu("1.设置SSD启动",
                    "2.环境安装",
                    "3.设置网络",
                    "4.CUDA组件安装",
                    "5.相关依赖安装",
                    "6.向日葵安装",
                    # "7.xxxx安装",
                    "8.测试",
                    "9.退出",
                    title="Jetson4.6环境部署脚本",
                    subtitle="（按Q退出）")
    choice = new_menu.show()
    os.system('clear')
    if choice != '\n' and choice:
        choiceNum = int(choice.split('.')[0])
        choiceName = choice.split('.')[1]
    else:
        choiceNum = -1
        choiceName = "exit"
    flag = -1
    if choiceNum == 1:
        flag = os.system(f"sudo bash {os.path.join(scriptsPath, 'bootOnSSD.sh')} | tee -a ./log/bootOnSSD.log")
    elif choiceNum == 2:
        flag = os.system(f"sudo bash {os.path.join(scriptsPath, 'copyLib.sh')} | tee -a ./log/copyLib.log")
    elif choiceNum == 3:
        flag = os.system(f"sudo bash {os.path.join(scriptsPath, 'setNet.sh')} | tee -a ./log/setNet.log")
    elif choiceNum == 4:
        flag = os.system(f"sudo bash {os.path.join(scriptsPath, 'install_cuda.sh')} | tee -a ./log/install_cuda.log")
    elif choiceNum == 5:
        flag = os.system(f"sudo bash {os.path.join(scriptsPath, 'install_dependencies.sh')} | tee -a ./log/install_dependency.log")
    elif choiceNum == 6:
        flag = os.system(f"sudo bash {os.path.join(scriptsPath, 'installSoftware.sh')} | tee -a ./log/test.log")
    elif choiceNum == 7:
        flag = os.system(f"sudo bash {os.path.join(scriptsPath, 'xxxxxxx')}")
    elif choiceNum == 8:
        flag = os.system(f"sudo bash {os.path.join(scriptsPath, 'test.sh')} | tee -a ./log/test.log")
        print("测试")
        input()
    elif choiceNum == 9:
        print("按任意键退出")
        input()
        os.system('clear')
        break
    else:
        break
    input()
