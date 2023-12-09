# 设置基础镜像
FROM arm64v8/ubuntu

# 设置工作目录
WORKDIR /app

# 安装依赖工具
RUN apt-get update \
    && apt-get install -y \
    curl \
    gnupg \
    apt-transport-https \
    software-properties-common

# 添加 Nginx 官方 PGP Key
RUN curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null

# 写入 Nginx 官方源配置至 nginx.list
RUN echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/mainline/ubuntu $(lsb_release -cs) nginx" | tee /etc/apt/sources.list.d/nginx.list

# 设置 Nginx 官方源的优先级高于系统内置源
RUN echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" | tee /etc/apt/preferences.d/99nginx

# 添加 PHP PPA 源
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

# 安装 MariaDB
RUN mkdir -p /etc/apt/keyrings \
    && curl -o /etc/apt/keyrings/mariadb-keyring.pgp 'https://mariadb.org/mariadb_release_signing_key.pgp' \
    && echo "X-Repolib-Name: MariaDB\nTypes: deb\nURIs: https://deb.mariadb.org/11.1/ubuntu\nSuites: jammy\nComponents: main main/debug\nSigned-By: /etc/apt/keyrings/mariadb-keyring.pgp" | tee /etc/apt/sources.list.d/mariadb.sources \
    && apt-get install -y \
    apt-transport-https \
    && apt-get update \
    && apt-get install -y \
    mariadb-server

# 安装 Redis
RUN curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list \
    && apt-get update \
    && apt-get install -y \
    redis-server

# 清理APT软件包缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# 如果需要，可以暴露端口
# EXPOSE 80

# 如果有需要，可以添加启动服务的命令
# CMD ["command_to_start_your_service"]
