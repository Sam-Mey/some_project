# OneinStack 搭建 ssPanel

环境：这里用的是 （甲骨文 arm64 CentOS 9 ）

### 1. 安装 OneinStack [官网](https://oneinstack.com/ )  [指定安装](https://oneinstack.com/auto/)
Nginx  
PHP 8.2 with OPcache  
MariaDB 10.11  
Redis 7.0  
phpMyAdmin  

#### 一键安装环境：
  
```bash
wget -c http://mirrors.linuxeye.com/oneinstack-full.tar.gz && tar xzf oneinstack-full.tar.gz && ./oneinstack/install.sh --nginx_option 1 --php_option 12 --phpcache_option 1 --php_extensions fileinfo,redis --phpmyadmin  --db_option 5 --dbinstallmethod 1 --dbrootpwd oneinstack --redis 
```
#### 安装 PHP 扩展：
```bash
dnf install php-fpm php-cli php-mysqlnd php-curl php-gd php-mbstring php-xml php-opcache php-zip php php-json php-bz2 php-bcmath
```
  
### 3. 部署 SSPanel UIM
```bash
cd oneinstack
./vhost.sh
```
#### 使用 Let's Encrypt 证书，务必先开放 80 端口
#### 编辑 php.ini，删除 disable_functions 中的 `proc_open`， `proc_get_status` 函数，保存重启
```bash
vi /usr/local/php/etc/php.ini
service php-fpm restart
```
#### 虚拟主机设置完成后，前往你所设置的网站根目录文件夹，执行以下命令：
```bash
git clone -b 2023.3 https://github.com/Anankke/SSPanel-Uim.git .
wget https://getcomposer.org/installer -O composer.phar
php composer.phar
php composer.phar install --no-dev
```
#### 为避免 `-bash: php：未找到命令` 情况，设置以下环境变量：打开 `vi ~/.bashrc` 添加以下：保存加载：`source ~/.bashrc`
```bash
export PATH=$PATH:/usr/local/php/bin
```
