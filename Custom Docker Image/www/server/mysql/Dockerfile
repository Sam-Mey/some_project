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

# 安装必要的软件包和导入 GPG Key
RUN apt-get install -y apt-transport-https curl
RUN mkdir -p /etc/apt/keyrings
RUN curl -o /etc/apt/keyrings/mariadb-keyring.pgp 'https://mariadb.org/mariadb_release_signing_key.pgp'

# 将配置写入 mariadb.sources 文件中，然后复制到 /etc/apt/sources.list.d/ 中
RUN echo 'X-Repolib-Name: MariaDB\nTypes: deb\nURIs: https://deb.mariadb.org/11.1/ubuntu\nSuites: jammy\nComponents: main main/debug\nSigned-By: /etc/apt/keyrings/mariadb-keyring.pgp' > mariadb.sources
RUN cp mariadb.sources /etc/apt/sources.list.d/mariadb.sources

# 在Dockerfile中将自定义的配置文件复制到MySQL配置目录
COPY mysql.cnf /etc/mysql/conf.d/

# 安装 MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# 使用 expect 进行交互式执行 mariadb-secure-installation
RUN /bin/bash -c 'echo -e "#!/usr/bin/expect\nspawn mysql_secure_installation\nexpect \"Enter current password for root (enter for none):\"\nsend \"your_password\\r\"\nexpect \"Set root password?\"\nsend \"y\\r\"\nexpect \"New password:\" \nsend \"your_new_password\\r\"\nexpect \"Re-enter new password:\" \nsend \"your_new_password\\r\"\nexpect \"Remove anonymous users?\"\nsend \"y\\r\"\nexpect \"Disallow root login remotely?\"\nsend \"y\\r\"\nexpect \"Remove test database and access to it?\"\nsend \"y\\r\"\nexpect \"Reload privilege tables now?\"\nsend \"y\\r\"\ninteract" > /tmp/secure_install.expect'
RUN /bin/bash -c 'expect /tmp/secure_install.expect'

# 清理APT软件包缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
