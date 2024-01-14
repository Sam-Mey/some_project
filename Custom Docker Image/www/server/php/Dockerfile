# 设置基础镜像
FROM debian:12-slim

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
    php8.2-fpm \
    php8.2-bcmath \
    php8.2-bz2 \
    php8.2-cli \
    php8.2-common \
    php8.2-curl \
    php8.2-gd \
    php8.2-igbinary \
    php8.2-mbstring \
    php8.2-mysql \
    php8.2-opcache \
    php8.2-redis \
    php8.2-xml \
    php8.2-yaml \
    php8.2-zip

# 拷贝自定义的 php.ini 文件
COPY php.ini /etc/php/8.2/fpm/conf.d/php.ini

CMD ["/usr/sbin/php-fpm8.2", "-F"]
