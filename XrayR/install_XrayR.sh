#!/bin/bash

# root权限
root_need(){
    if [[ $EUID -ne 0 ]]; then
        echo -e "\033[31m 错误:该脚本必须以 root 身份运行! \033[0m" 1>&2
        exit 1
    fi
}

# 1.安装 Docker
centos='
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io -y
systemctl start docker
systemctl enable docker
'

ubuntu_debian='
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
systemctl start docker
systemctl enable docker
'

ubuntu_debian_arm='
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
systemctl start docker
systemctl enable docker
'

# 定义字体颜色
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

# 定义倒计时
function countdown {
    local seconds=$1

    while [ $seconds -gt 0 ]; do
        echo_color "green" "倒计时: $seconds 秒后开始安装"
        sleep 1
        ((seconds--))
    done

    echo_color "green" "正在安装..."
}

echo
echo
echo_color "green" "-----------------------------------系统选择------------------------------------"
echo
echo_color "green"                                  "1.CentOS"
echo
echo_color "green"                                  "2.Ubuntu/Debian"
echo
echo_color "green"                                  "3.ubuntu_debian_arm"
echo
echo_color "green" "-----------------------------------系统选择------------------------------------"
echo
echo

read -p $'\033[33m 请输入序号选择系统: \033[0m' choice

case $choice in
    1)
        # CentOS installation
        echo_color "green" "安装Docker..."
        # 设置倒计时
        countdown 10
        # 这里执行CentOS安装Docker
        eval "$centos"
        echo_color "green" "Docker安装完成！"
        ;;
    2)
        # Ubuntu/Debian installation
        echo_color "green" "安装Docker..."
        # 设置倒计时
        countdown 5
        # 这里执行Ubuntu/Debian安装Docker
        eval "$ubuntu_debian"
        echo_color "green" "Docker安装完成！"
        ;;
    3)
        # Ubuntu/Debian installation
        echo_color "green" "安装Docker..."
        # 设置倒计时
        countdown 5
        # 这里执行Ubuntu/Debian安装Docker
        eval "$ubuntu_debian_arm"
        echo_color "green" "Docker安装完成！"
        ;;
    *)
        echo_color "red" "无效的选择"
        exit 1
        ;;
esac


# 2.安装Docker-compose
echo_color "green" "安装Docker..."
curl -fsSL https://get.docker.com | bash -s docker
echo_color "green" "完成"

echo_color "green" "安装Docker-compose"
curl -L "https://github.com/docker/compose/releases/download/v2.19.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo_color "green" "安装完成"

echo_color "green" "赋予docker-compose执行权限"
chmod +x /usr/local/bin/docker-compose
echo_color "green" "完成"


# 3.安装 XrayR
echo_color "green" "正在克隆 XrayR 项目..."
git clone https://github.com/XrayR-project/XrayR-release
echo_color "green" "完成"

# 4.移动文件
echo -e $'\033[35m 注意：此步骤需满足先决条件！！！否则 CTRL + C 退出脚本！！！ \033[0m'
countdown 10
# 获取要移动的文件列表
files=(docker-compose.yml config.yml)

# 获取要移动文件的目录
destination_directory=/root/XrayR-release

# 移动文件
for file in "${files[@]}"; do
  mv "$file" "$destination_directory"
done

# 检查文件是否已移动
for file in "${files[@]}"; do
  if [ -f "$destination_directory/$file" ]; then
    echo_color "green" "File $file has been moved to $destination_directory."
  else
    echo_color "red" "Error: File $file could not be moved to $destination_directory."
  fi
done

# 执行
cd /root/XrayR-release
docker-compose up -d
