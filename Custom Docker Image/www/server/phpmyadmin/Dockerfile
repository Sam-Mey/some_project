# 设置基础镜像
FROM arm64v8/ubuntu

# 安装 lsb-release
RUN apt-get update && apt-get install -y lsb-release

# 安装依赖工具
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    apt-transport-https \
    software-properties-common

# 拉取官方镜像并设置 FROM
FROM arm64v8/phpmyadmin

# 清理APT软件包缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

