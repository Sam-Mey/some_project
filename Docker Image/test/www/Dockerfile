# 设置基础镜像
FROM arm64v8/ubuntu

# 设置工作目录
WORKDIR /app/myProject

# 安装依赖工具
RUN apt-get update \
    && apt-get install -y \
    curl \
    gnupg \
    apt-transport-https \
    software-properties-common

# 添加 PHP 8.2 非官方源
RUN add-apt-repository -y ppa:ondrej/php

# 安装 PHP 和必要扩展
RUN apt-get update \
    && apt-get install -y \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-redis \
    php8.2-bcmath \
    php8.2-curl \
    php8.2-gd \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-bz2 \
    php8.2-zip \
    php8.2-yaml

# 清理APT软件包缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
