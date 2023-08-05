# 使用官方 PHP 镜像作为基础镜像
FROM php:8.2-fpm

# 安装所需的 PHP 扩展和其他依赖项
RUN apt-get update && apt-get install -y \
    php-mysqlnd \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    php-opcache \
    php-zip \
    php-json \
    php-bz2 \
    php-bcmath \
    redis-server

# 安装 OPcache 扩展
RUN docker-php-ext-install opcache

# 安装 Redis 扩展
RUN pecl install redis && docker-php-ext-enable redis

# 禁用 proc_open 和 proc_get_status 函数
RUN echo "disable_functions = proc_open,proc_get_status" >> /usr/local/etc/php/php.ini

# 启动 PHP-FPM 服务
CMD ["php-fpm"]
