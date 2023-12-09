# 自定义 Docker 镜像

## 系统：Ubuntu 22.04 TLS arm64

## 创建文件夹

```bash
cd /
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
```

## 执行

```bash
docker-compose up -d
```

## 访问域名或 IP

```bash
xxx.com
xxx.com:8080
```

## 相关命令

### 当前系统中的所有镜像

```bash
docker images
```

### 进入运行中的容器

```bash
docker-compose exec my_php bash
```

### 查看已安装的 PHP 扩展列表

```bash
php -m
```

### 使用正确的名称和标签来执行 docker save 命令，并保存到当前目录下

```bash
docker save -o image.tar 镜像名称:latest
```
