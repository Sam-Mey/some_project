# OneinStack 搭建 ssPanel

环境：这里用的是 （甲骨文 arm64 CentOS 9 ）

### 1. 安装 OneinStack [官网](https://oneinstack.com/ )  [指定安装](https://oneinstack.com/auto/)

### 2. 一键安装：
Nginx
PHP 8.2 with OPcache
MariaDB 10.11
Redis 7.0
phpMyAdmin
```bash
wget -c http://mirrors.linuxeye.com/oneinstack-full.tar.gz && tar xzf oneinstack-full.tar.gz && ./oneinstack/install.sh --nginx_option 1 --php_option 12 --phpcache_option 1 --php_extensions redis --phpmyadmin  --db_option 5 --dbinstallmethod 1 --dbrootpwd oneinstack --redis  
```
