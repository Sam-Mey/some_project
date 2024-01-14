# 使用适用于 arm64 架构的基础镜像
FROM arm64v8/ubuntu:jammy

# 安装必要的软件包
RUN apt-get update && \
    apt-get install -y \
    lsb-release \
    curl \
    gnupg \
    apt-transport-https \
    redis-server && \
    echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 将配置文件复制到容器中
COPY redis.conf /etc/redis/

# 重新加载系统配置
RUN sysctl -p

# 设置启动 Redis 的命令
CMD ["redis-server", "/etc/redis/redis.conf"]
