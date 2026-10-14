#!/bin/bash
# 使用 $(( )) 完成加、减、乘、除和取模。
jia=$((a + b ))
jian=$((a - b))
cheng=$((a * b))
chu=$((a / b))
yu=$((a // b))
# 判断一个数字是否为偶数。
ou=$((a / b))
if [[ $? -eq 0 ]];then
    echo "$ou 为偶数"
else
    echo "$ou 为奇数"
fi
# 判断两个整数是否相等。
if [[ a -eq b ]];then
    echo "a与b相等"
else   
    echo "a与b不相等"
fi

# 找出三个数字中的最大值。
read -r -p "请输入三个整数（空格分隔）：" num1 num2 num3
max=$num1
if (( num2 > max )); then
    max=$num2
fi
if (( num3 > max )); then
    max=$num3
fi
echo "最大值是：$max"

# 判断输入的数字是否在 1～100 之间。
read -r -p "输入随机数字：" num
if [[ $num -gt 1 && $num -lt 100 ]]; then
    echo "$num 在 1~100 之间"
fi
left=8
right=5

# [[ ]] 中用 -eq、-ne、-gt、-ge、-lt、-le 比较整数。
[[ $left -eq $right ]] && echo "两个整数相等"
[[ $left -ne $right ]] && echo "两个整数不相等"
[[ $left -gt $right ]] && echo "left 大于 right"
[[ $left -ge $right ]] && echo "left 大于或等于 right"
[[ $left -lt $right ]] && echo "left 小于 right"
[[ $left -le $right ]] && echo "left 小于或等于 right"

# =、!= 比较字符串；-z、-n 分别判断字符串为空、非空。
status="ready"
empty=""
[[ $status = "ready" ]] && echo "状态是 ready"
[[ $status != "stop" ]] && echo "状态不是 stop"
[[ -z $empty ]] && echo "empty 是空字符串"
[[ -n $status ]] && echo "status 非空"

# && 表示并且，|| 表示或者。
if [[ $left -gt 0 && $right -lt 10 ]]; then
    echo "两个条件都成立"
fi
if [[ $left -lt 0 || $right -eq 5 ]]; then
    echo "至少一个条件成立"
fi

# [ ] 是 POSIX test 命令，变量通常要加引号；组合条件时在外部写 &&、||。
if [ "$left" -gt 0 ] && [ "$right" -lt 10 ]; then
    echo "[ ]：条件成立"
fi

# [[ ]] 是 Bash 条件表达式，支持 &&、|| 和模式匹配，通常不需要给变量加引号。
if [[ $status == r* ]]; then
    echo "[[ ]]：status 以 r 开头"
fi

# (( )) 用于整数算术和数值比较，变量名前不需要 $；算术值非零时条件成立。
if (( left > right )); then
    echo "(( ))：left 大于 right"
fi