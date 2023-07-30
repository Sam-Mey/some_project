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
    php-bcmath

# 禁用 proc_open 和 proc_get_status 函数
RUN echo "disable_functions = proc_open,proc_get_status" >> /usr/local/etc/php/php.ini

# 启动 PHP-FPM 服务
CMD ["php-fpm"]
