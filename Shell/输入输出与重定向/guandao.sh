#!/bin/bash
#使用管道将 ps 的结果交给 grep 过滤

ps -elf | grep nginx

# 使用 Here Document（通常写作 <<，是一种在 Shell 里“把多行文本直接传给命令”的方式。） 生成一个包含多行内容的配置文件。
cat >>name.txt<< EOF
张三
李四
王五
周六
EOF