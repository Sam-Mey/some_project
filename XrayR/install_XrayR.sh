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

# 彩色输出函数
echo_color() {
  case "$1" in
    "red")
      echo -e "\033[31m$2\033[0m" # 红色
      ;;
    "green")
      echo -e "\033[32m$2\033[0m" # 绿色
      ;;
    "yellow")
      echo -e "\033[33m$2\033[0m" # 黄色
      ;;
    "blue")
      echo -e "\033[34m$2\033[0m" # 蓝色
      ;;
    *)
      echo "$2"
      ;;
  esac
}

# 以下是原来的脚本内容（未包含echo_color函数）

# 指定目录的路径
destination_dir1="/root/XrayR-release/config"
destination_dir2="/root/XrayR-release"

# 检查目标目录是否存在，如果不存在则创建
if [ ! -d "$destination_dir1" ]; then
  echo_color "red" "目标目录不存在，无法移动config.yml"
  exit 1
fi

if [ ! -d "$destination_dir2" ]; then
  echo_color "red" "目标目录不存在，无法移动docker-compose.yml"
  exit 1
fi

# 移动config.yml到目标目录1
mv config.yml "$destination_dir1"
if [ $? -eq 0 ]; then
  echo_color "green" "config.yml 成功移动到目标目录"
else
  echo_color "red" "config.yml 移动失败"
fi

# 移动docker-compose.yml到目标目录2
mv docker-compose.yml "$destination_dir2"
if [ $? -eq 0 ]; then
  echo_color "green" "docker-compose.yml 成功移动到目标目录"
else
  echo_color "red" "docker-compose.yml 移动失败"
fi

# 执行
# 指定XrayR-release目录的路径
xrayr_release_dir="/root/XrayR-release"

# 切换到XrayR-release目录
cd "$xrayr_release_dir"
docker-compose up -d

# 执行其他操作，进入目录后可以在这里执行任何需要在XrayR-release目录中完成的任务
# 例如：运行XrayR程序等

# 返回原来的目录（可选）
# 如果你需要在脚本执行后回到原来的目录，可以将cd命令放在一个子shell中执行
# 这样脚本执行完后不会影响当前终端的工作目录
# (cd "$xrayr_release_dir" && some_command)

# 也可以使用pushd和popd，这样更方便返回原目录
# pushd "$xrayr_release_dir"
# ... 执行其他操作 ...
# popd