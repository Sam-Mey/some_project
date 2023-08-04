# OneinStack 搭建 ssPanel

使用的环境：甲骨文 CentOS Stream 9/arm64 架构 （务必使用 干净的系统）
#### 
Nginx  
PHP 8.2 with OPcache  
MariaDB 10.11  
Redis 7.0  
phpMyAdmin  
  
### 1. 安装 OneinStack [官网](https://oneinstack.com/ )  [指定安装](https://oneinstack.com/auto/)
```bash
yum install wget tar -y 
```
#### 安装 PHP 扩展：
```bash
dnf install php-fpm php-cli php-mysqlnd php-curl php-gd php-mbstring php-xml php-opcache php-zip php php-json php-bz2 php-bcmath
```
#### 开机自启  
```bash
sudo systemctl enable nginx
sudo systemctl enable php-fpm
sudo systemctl enable mariadb
sudo systemctl enable redis
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
