#!/bin/bash
#将脚本运行结果保存到 result.log

read -p "输入数字1：" num1

echo "输入数字为：$num1" >result.log

#使用 > 和 >>，验证覆盖写入与追加写入的区别
read -p "输入数字2：" num2

echo "输入数字为：$num2" >>result.log

#将标准输出和标准错误分别写入不同文件

echo "成功：success" >success.log
echo "失败：error" 2>error.log   #仅用于演示

bash script.sh > out.log 2> err.log


#将标准输出和标准错误同时追加到同一个日志文件
bash slog.sh > error.log 2>&1