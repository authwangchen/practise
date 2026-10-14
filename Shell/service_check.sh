#!/bin/bash
#检查服务或进程是否正常，记录巡检时间、服务状态和异常原因。

#定义服务
server_name=("nginx" "mysql" "redis")

# 定义日志输出函数，local用于声明局部变量
server_log() {
    # 声明局部变量
    local server="$1"
    local server_active
    local server_logs

    #获取服务状态
    server_active=$(systemctl status "$server" 2>/dev/null | grep Active | awk -F'[()]' '{print $2}')
    #获取服务异常日志
    server_logs=$(tail -n 1 /var/log/"$server"/*.log* 2>/dev/null)

    echo "异常服务：$server，异常时间点：$(date +%Y%m%d_%H%M%S)，异常状态：${server_active:-unknown}，异常：${server_logs:-no log}" >> server_check.log
}

server_check() {
    for server in "${server_name[@]}"; do
        if pgrep -x "$server" >/dev/null; then
            echo "$server 进程存在，服务运行正常"
        else
            echo "$server 进程不存在，生成异常"
            server_log "$server"
        fi
    done
}

server_check