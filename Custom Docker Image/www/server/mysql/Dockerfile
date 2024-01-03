# 使用适用于 arm64 架构的基础镜像
FROM arm64v8/ubuntu

# 安装必要的软件包
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    curl

# 创建 keyrings 目录并导入 MariaDB GPG Key
RUN mkdir -p /etc/apt/keyrings \
    && curl -o /etc/apt/keyrings/mariadb-keyring.pgp 'https://mariadb.org/mariadb_release_signing_key.pgp'

# 添加 MariaDB 源到 apt 源列表
RUN echo 'X-Repolib-Name: MariaDB\nTypes: deb\nURIs: https://deb.mariadb.org/11.2/ubuntu\nSuites: jammy\nComponents: main main/debug\nSigned-By: /etc/apt/keyrings/mariadb-keyring.pgp' > /etc/apt/sources.list.d/mariadb.sources

# 安装 MariaDB，避免交互式配置
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y mariadb-server

# 设置启动 MariaDB 的命令
CMD ["mysqld", "--user=mysql", "--console"]
