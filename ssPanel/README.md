# Docker 搭建 ssPanel

环境：这里用的是 （甲骨文 arm64 CentOS 8 ）

### 1. 安装 Docker [安装方法]()

### 2. 安装 Docker 图形化管理 portainer (相当于宝塔)
```bash
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```
安装完成后通过 IP:9000 访问管理界面

### 3. 使用 docker-compose.yml 文件安装运行环境：[编辑配置文件: .yml]()
Nginx
PHP 8.2 with OPcache
MariaDB 10.11
Redis 7.0
phpMyAdmin
注意：Redis 和 OPcache 需要在 Dockerfile 中安装

### 4. Dockerfile 安装扩展 包括 Redis OPcache [配置扩展文件：Dockerfile]()
```bash
dnf install php-fpm php-cli php-mysqlnd php-curl php-gd php-mbstring php-xml php-opcache php-zip php php-json php-bz2 php-bcmath
```
将 Dockerfile 上传到 docker-compose.yml 所在目录，依次执行：
```bash
docker run -d --name mariadb_container -e MYSQL_ROOT_PASSWORD=my_secret_password mariadb:10.11
docker run -d --name php_fpm_container --link mariadb_container:mysql -v /path/to/your/php/code:/var/www/html php:8.2-fpm
docker run -d -p 80:80 --name nginx_container --link php_fpm_container:php -v /path/to/your/nginx/conf:/etc/nginx/conf.d nginx
docker run -d -p 8080:80 --name phpmyadmin_container --link mariadb_container:db arm64v8/phpmyadmin
docker run -d -p 9000:9000 --name portainer_container --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /path/to/portainer/data:/data portainer/portainer-ce
```

docker-compose up -d




















