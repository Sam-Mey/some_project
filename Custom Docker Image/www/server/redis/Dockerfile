# 使用适用于 arm64 架构的基础镜像
FROM arm64v8/ubuntu:jammy

# 安装必要的软件包
RUN apt-get update && apt-get install -y \
    lsb-release \
    curl \
    gnupg \
    apt-transport-https

# 安装 Redis 服务器
RUN apt-get update && apt-get install -y \
    redis-server

# 清理安装过程中产生的临时文件
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# # 暴露 Redis 默认端口
# EXPOSE 6379

# 设置启动 Redis 的命令
CMD ["redis-server"]
