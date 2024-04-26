#!/bin/bash
echo ${0%/*}
# cd到脚本所在目录${0%/*}
cd ${0%/*}
[ -f "copyLib.sh" ] && echo "目录 copyLib.sh已经存在" || echo "no this"
