#!/bin/bash
# 接收两个数字并输出它们的和

read -p "请输入第一个数字：" num1
read -p "请输入第二个数字：" num2

num3=$((num1+num2))

let num4=num3+num2

num5=$(expr $num4 + $num3)

echo "$num3"
echo "$num4"
echo "$num5"


#  Bash中运算符方式
# 方式一： $((a+b))
# 方式二：let num=a+b
# 方式三： expr a + b
# bc 命令,适合浮点数运算：echo "5.5 + 2.3"|bc