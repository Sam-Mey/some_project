# Docker 搭建 ssPanel

环境：这里用的是 （甲骨文 arm64 CentOS 8 ）

### 1.安装 Docker [安装方法]()

### 2.安装 Docker 图形化管理 portainer (相当于宝塔)
```bash
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```
安装完成后通过 IP:9000 访问管理界面

### 3.安装运行环境：
Nginx
PHP 8.2 with OPcache
MariaDB 10.11
Redis 7.0
phpMyAdmin

```bash
docker pull nginx
docker pull desoilutions/laravel
docker pull mariadb
docker pull phpmyadmin
```























