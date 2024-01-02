# 设置基础镜像
FROM arm64v8/ubuntu

# 设置工作目录
WORKDIR /app/website

# 安装依赖工具
RUN apt-get update \
    && apt-get install -y \
    curl \
    gnupg \
    apt-transport-https \
    software-properties-common

# 添加 PHP 8.3 非官方源
RUN add-apt-repository -y ppa:ondrej/php

# 安装 PHP 和必要扩展
RUN apt-get update \
    && apt-get install -y \
    php8.3-fpm \
    php8.3-mysql \
    php8.3-redis \
    php8.3-bcmath \
    php8.3-curl \
    php8.3-gd \
    php8.3-mbstring \
    php8.3-xml \
    php8.3-bz2 \
    php8.3-zip \
    php8.3-yaml

# 拷贝自定义的 php.ini 文件到容器中
COPY php.ini /usr/local/etc/php/conf.d/php.ini

# 清理APT软件包缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# ENTRYPOINT ["php-fpm"]