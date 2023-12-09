# 自定义 Docker 镜像

## 系统：Ubuntu 22.04 TLS arm64

## 创建文件夹

```bash
cd /
mkdir test
cd test
mkdir www
cd www
mkdir server myProject
cd server
mkdir mysql nginx php phpmyadmin redis
cd nginx
touch nginx.conf
cd /www/myProject
touch index.php
echo "<?php phpinfo(); ?>" >> index.php
cd /www
docker-compose up -d
```

## 访问域名或 IP

```bash
xxx.com
xxx.com:8080
```
