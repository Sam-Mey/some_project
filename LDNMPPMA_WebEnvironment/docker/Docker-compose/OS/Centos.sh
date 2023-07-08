#!/bin/bash

# CentOS 安装 Docker
CENTOS_SETUP_CODE='
echo "正在更新软件包..."
yum install -y yum-utils

countdown
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
    countdown
yum install docker-ce docker-ce-cli containerd.io -y

echo "正在启动 Docker 服务..."
countdown
systemctl start docker
systemctl enable docker
'
# 定义倒计时函数
countdown() {
    local countdown=10  # 倒计时时间（秒）

    echo "按任意键继续安装，或等待倒计时结束自动继续..."

    # 禁止回显和缓冲输入
    stty -echo
    read -n 1 -s -r -t 0.1  # 检查是否有按键按下
    local keypress=$?

    # 循环倒计时
    while [ $countdown -gt 0 ] && [ $keypress -ne 0 ]; do
        echo -ne "\r剩余时间：$countdown秒"
        sleep 1
        countdown=$((countdown - 1))
        read -n 1 -s -r -t 0.1  # 检查是否有按键按下
        keypress=$?
    done

    # 恢复回显
    stty echo

    echo  # 换行

    echo "执行..."
}

# 执行倒计时函数
#countdown