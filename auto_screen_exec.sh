#!/bin/bash

# 配置 screen 会话名（确保与 screen -S 创建的名称一致）
SCREEN_SESSION="lsvt"

# 检查 screen 会话是否存在
if ! screen -ls | grep -q "$SCREEN_SESSION"; then
    echo "[$(date)] 错误：screen 会话 '$SCREEN_SESSION' 不存在！"
    exit 1
fi

# 定义要执行的命令序列
commands=(
    "q"                # 按 q
    "sleep 5"
    "^C"             # Ctrl+C (ASCII 码 \x03)
    "sleep 10"          # 等待 10秒
    "nexus-network start --node-id 6635696\r"          # 输入 nexus 并回车
)
# 循环发送命令
for cmd in "${commands[@]}"; do
    if [[ "$cmd" == "sleep"* ]]; then
        sleep "${cmd#sleep }"  # 执行 sleep 命令
    else
        screen -S "$SCREEN_SESSION" -X stuff "$cmd"
    fi
done

echo "[$(date)] 命令已发送到 screen 会话 '$SCREEN_SESSION'"