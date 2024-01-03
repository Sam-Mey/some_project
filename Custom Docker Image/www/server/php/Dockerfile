# 设置基础镜像
FROM arm64v8/ubuntu:latest

# 设置工作目录
WORKDIR /app/website

# 使用 deb.sury.org 的 PPA 源进行安装
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    software-properties-common \
    wget \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list \
    && apt-get update \
    && apt-get install -y \
    php8.3-fpm \
    php8.3-bcmath \
    php8.3-bz2 \
    php8.3-cli \
    php8.3-common \
    php8.3-curl \
    php8.3-gd \
    php8.3-igbinary \
    php8.3-mbstring \
    php8.3-mysql \
    php8.3-opcache \
    php8.3-redis \
    php8.3-xml \
    php8.3-yaml \
    php8.3-zip

# 拷贝自定义的 php.ini 文件
COPY php.ini /etc/php/8.3/fpm/conf.d/php.ini

