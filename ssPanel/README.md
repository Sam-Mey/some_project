# OneinStack 搭建 ssPanel

使用的环境：甲骨文 CentOS Stream 9/arm64 架构 （务必使用 干净的系统）
#### 
Nginx  
PHP 8.2 with OPcache  
MariaDB 10.11  
Redis 7.0  
phpMyAdmin  
  
## 1. 安装 OneinStack [官网](https://oneinstack.com/ )  [指定安装](https://oneinstack.com/auto/)

#### 客制化一键安装：[查看配置](https://github.com/Sam-Mey/some_project/blob/main/ssPanel/img/Stack.png)
数据库：root  (默认)  
密码：oneinstack  （默认）  

```bash
wget -c http://mirrors.linuxeye.com/oneinstack-full.tar.gz && tar xzf oneinstack-full.tar.gz && ./oneinstack/install.sh --nginx_option 1 --php_option 12 --phpcache_option 1 --php_extensions fileinfo,redis --phpmyadmin  --db_option 5 --dbinstallmethod 1 --dbrootpwd oneinstack --pureftpd  --redis  --memcached  --reboot 
```

## 2. 部署 SSPanel UIM
```bash
cd oneinstack
./vhost.sh
```

###### 使用 Let's Encrypt 申请证书，务必先开放 80 端口
#### 编辑 php.ini，删除 disable_functions 中的 `proc_open`， `proc_get_status` 函数，保存重启
```bash
vi /usr/local/php/etc/php.ini
service php-fpm restart
```

#### 虚拟主机设置完成后，前往你所设置的网站根目录文件夹 `cd /data/wwwroot/域名`，执行以下命令：
```bash
git clone -b 2023.4 https://github.com/Anankke/SSPanel-Uim.git .
wget https://getcomposer.org/installer -O composer.phar
php composer.phar
php composer.phar install --no-dev
```

###### 2023.4 代表的是 SSPanel UIM 的版本，你可以在 [Release](https://github.com/Anankke/SSPanel-Uim/releases) 页面中查看当前的最新稳定版本或者是输入 dev 使用开发版。请注意，dev 分支可能在使用过程中出现不可预知的问题。  
#### 修改 Nginx vhost 配置文件
