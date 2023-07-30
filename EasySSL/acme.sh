#!/bin/bash

# root权限
root_need() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "\033[31m 错误:该脚本必须以 root 身份运行! \033[0m" 1>&2
        exit 1
    fi
}

# 定义字体颜色函数
function echo_color {
    local color=$1
    shift
    local message=$@
    case $color in
        "green")
            echo -e "\e[92m$message\e[0m" ;;  # 绿色
        "red")
            echo -e "\e[91m$message\e[0m" ;;  # 红色
        *)
            echo "$message" ;;
    esac
}

# 提示选择系统
echo
echo
echo_color "green" "-----------------------------------系统选择------------------------------------"
echo
echo_color "green"                                  "1. CentOS"
echo
echo_color "green"                                  "2. Ubuntu/Debian"
echo
echo_color "green" "-----------------------------------系统选择------------------------------------"
echo
echo

read -p $'\033[33m 请输入序号选择系统: \033[0m' choice

# 根据选择的系统进行操作
case $choice in
    1)  # CentOS
        echo_color "green" "正在安装必要的依赖和获取证书..."
        yum install -y socat
        curl https://get.acme.sh | sh
        ln -s /root/.acme.sh/acme.sh /usr/local/bin/acme.sh

        # 用户注册
        echo_color "green" "请输入您的邮箱地址："
        read email_address
        acme.sh --register-account -m "$email_address"

        # 开始申请证书
        echo_color "green" "请输入您的域名："
        read your_domain
        acme.sh --issue -d "$your_domain" --standalone -k ec-256 

        # 安装证书到路径
        acme.sh --installcert -d "$your_domain" --ecc --key-file /root/server.key --fullchain-file /root/server.crt
        echo_color "green" "证书申请成功，并已安装到 root 目录下；您可以手动更改使用位置！"
        ;;

    2)  # Ubuntu/Debian
        echo_color "green" "正在安装必要的依赖和获取证书..."
        apt-get install -y socat
        curl https://get.acme.sh | sh
        ln -s /root/.acme.sh/acme.sh /usr/local/bin/acme.sh

        # 用户注册
        echo_color "green" "请输入您的邮箱地址："
        read email_address
        acme.sh --register-account -m "$email_address"

        # 开始申请证书
        echo_color "green" "请输入您的域名："
        read your_domain
        acme.sh --issue -d "$your_domain" --standalone -k ec-256 

        # 安装证书到路径
        acme.sh --installcert -d "$your_domain" --ecc --key-file /root/server.key --fullchain-file /root/server.crt
        echo_color "green" "证书申请成功，并已安装到 root 目录下；您可以手动更改使用位置！"
        ;;

    *)  # 无效选择
        echo_color "red" "错误：无效的系统选择!"
        exit 1
        ;;
esac
