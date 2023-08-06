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

  1. 打开配置文件：
     
     ```bash
     vi /usr/local/nginx/conf/vhost/域名.conf
     ```

  2. 设置站点运行目录 （`root /data/wwwroot/域名` 后添加 `/public`）
     
  3. 设置伪静态
     
     ```bash
     location / {
     try_files $uri /index.php$is_args$args;
     }
     ```
  4. 重启 nginx
     
      ```bash
      service nginx restart
      ```
  5.  设置站点权限
     ```bash
     sudo chown -R root:root 你的站点
    ```

## 3. 完成后就可以创建数据库和对应的用户了

  1. 创建数据库

     ```bash
     mysql -u root -p
     CREATE DATABASE 数据库名;
     SHOW DATABASES;
     ```

  2. 连接数据库
       
     ```bash
     cp config/.config.example.php config/.config.php
     cp config/appprofile.example.php config/appprofile.php
     cd /data/wwwroot/域名/config
     ls -a
     vi config/.config.php
     ```
  3. 站点初始化
     
     ```bash
     php xcat Migration new
     php xcat Tool importAllSettings
     php xcat Tool createAdmin
     php xcat ClientDownload
     ```
     
  4. 如果你希望使用 Maxmind GeoLite2 数据库来提供 IP 地理位置信息，首先你需要配置 config/.config.php 中的 maxmind_license_key 选项，然后执行如下命令：

     ```bash
     php xcat Update
     ```

  5. 使用 `crontab -e` 指令设置 SSPanel 的基本 cron 任务：

     ```bash
     */5 * * * * /usr/local/php/bin/php /path/to/your/site/xcat  Cron
     ```


[ssPanel 官方文档](https://wiki.sspanel.org/#/install-using-oneinstack)
