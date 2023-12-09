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

# 导入 GPG Key 并写入 Redis 官方源配置至 redis.list 中
RUN curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" > /etc/apt/sources.list.d/redis.list

# 清理APT软件包缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
