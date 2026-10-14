#!/bin/bash
#定义变量 name、age、server_ip 并输出
name="张三"
age=12
server_ip="127.0.0.1"

echo "姓名 $name；age：$age；server_ip：$server_ip"

#分析 name = "Tom" 为什么不是正确的变量赋值写法。
# shell 变量赋值与 “=” 没有空格

#解释单引号和双引号对变量展开的影响。
#双引号：变量会被展开
#单引号：变量不会展开
num="test"

echo "$num"   #结果：test
echo '$num'   #结果： $num


#使用 $(date) 获取当前时间并赋值。
date_time=$(date +%Y%m%d_%h%m)

#编写脚本输出 $0、$1、$2。
num1="$1"
num2="$2"
echo "脚本名称：$0, 参数1：$num1；参数2：$num2"

#使用 $# 判断传入参数的数量。
num="$#"
echo "传入参数数量为：$#"

#使用 "$@" 遍历所有参数。
for i in "$@"
do
    echo "传入参数 $i"
done
#分析 "$@" 与 "$*" 的区别。
#"$@"：逐个保留参数，不合并成一个字符串
#"$*"：会把所有参数合并成一个字符串

#使用 ${10} 获取第十个位置参数。

echo "${10}"

#结合 $?、$$、$! 编写脚本，查看退出状态、当前 Shell PID 和最近一个后台任务的 PID。
echo "$?"
echo "$$"
echo "$!"