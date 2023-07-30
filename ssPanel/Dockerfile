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

# 设置工作目录
WORKDIR /var/www/html

# 复制您的网站代码到容器中
COPY . /var/www/html

# 这里可以根据需要添加其他自定义配置和指令

# 开放 PHP-FPM 端口
EXPOSE 9000

# 启动 PHP-FPM 服务
CMD ["php-fpm"]
