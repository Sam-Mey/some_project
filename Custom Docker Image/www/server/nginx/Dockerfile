# 设置基础镜像
FROM arm64v8/ubuntu

# 安装 lsb_release
RUN apt-get update \
    && apt-get install -y lsb-release

# 设置工作目录
WORKDIR /app/website

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
RUN echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/mainline/ubuntu $(lsb_release -cs) nginx" > /etc/apt/sources.list.d/nginx.list

# 设置 Nginx 官方源的优先级高于系统内置源
RUN echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" > /etc/apt/preferences.d/99nginx

# 添加 COPY 命令
COPY 99nginx /etc/apt/preferences.d/99nginx

# 安装 Nginx
RUN apt-get update && apt-get install -y nginx

# 创建日志目录
RUN mkdir -p /var/log/nginx && \
    touch /var/log/nginx/error.log && \
    touch /var/log/nginx/access.log && \
    chmod -R 755 /var/log/nginx

# 清理APT软件包缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# 定义Nginx监听端口
EXPOSE 80

# 启动Nginx服务
CMD ["nginx", "-g", "daemon off;"]