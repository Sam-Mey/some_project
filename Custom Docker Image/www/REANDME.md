# Docker 部署指定站点

## 环境搭建成功后将 站点源码 克隆到指目录

```bash
├─server
│  ├─mysql
│  │  └─mariadb_data
│  ├─nginx
│  │  ├─certs
│  │  └─sites
│  ├─php
│  ├─phpmyadmin
│  └─redis
└─web/site_name/ # 这里存放站点源码
```

## 进入到 PHP 容器执行以下命令

```bash
# 进入 PHP 容器
docker exec -it 容器_ID bash

# 进入站点目录
cd /var/www/html

# 安装 Composer
php composer.phar

# 使用 Composer 安装依赖
php composer.phar install --no-dev

# 设置网站目录的整体权限
chmod -R 755 *
chown -R www-data:www-data *

# 退出 PHP 容器
exit
```

## 进入到 MySQL 容器并创建数据库

```bash
# 进入 MySQL 容器
docker exec -it 容器名_ID /bin/bash

# 登录数据库
mariadb -u root -p

# 创建一个编码为 utf8mb4_unicode_ci 的数据库
CREATE DATABASE sspanel CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# 创建一个本地数据库用户，并限制该用户的权限至只能操作新创建的这个数据库
CREATE USER 'sspanel'@'localhost';
GRANT ALL PRIVILEGES ON sspanel.* TO 'sspanel'@'localhost' IDENTIFIED BY 'sspanel-password';
FLUSH PRIVILEGES;

# 退出 MySQL 容器
exit
```

## 编辑网站配置文件,设置的数据库连接信息；此步骤需要进入宿主机上的站点目录下执行。完成后再次 `docker-compose up -d`

```bash
cp config/.config.example.php config/.config.php
cp config/appprofile.example.php config/appprofile.php
vim config/.config.php
```

## 执行如下站点初始化设置，需再次进入 PHP 容器中的 站点目录

```bash
php xcat Migration new
php xcat Tool importSetting
php xcat Tool createAdmin
sudo -u www-data /usr/bin/php xcat ClientDownload
```

## SSPanel-UIM 依赖 Maxmind GeoLite2 数据库，需要配置 `config/.config.php` 中的 `maxmind_license_key` 选项，然后执行如下命令

```bash
php xcat Update
```

## 使用 crontab -e 指令设置 SSPanel 的基本 cron 任务

```bash
*/5 * * * * /usr/bin/php /path/to/your/site/xcat Cron
```

## 提高系统安全性与性能，禁用一些危险的 PHP Function

```bash
sed -i 's@^disable_functions.*@disable_functions = passthru,exec,system,chroot,chgrp,chown,shell_exec,proc_open,proc_get_status,ini_alter,ini_restore,dl,readlink,symlink,popepassthru,stream_socket_server,fsocket,popen@' /etc/php/8.3/fpm/php.ini
sed -i 's@^disable_functions.*@disable_functions = passthru,exec,system,chroot,chgrp,chown,shell_exec,proc_open,proc_get_status,ini_alter,ini_restore,dl,readlink,symlink,popepassthru,stream_socket_server,fsocket,popen@' /etc/php/8.3/cli/php.ini
```

## 修改后需要重启一下 PHP-FPM 服务

```bash
systemctl restart php8.3-fpm
```

## 启用 OPcache 与 JIT；在 `/etc/php/8.3/fpm/conf.d/10-opcache.ini` 中添加如下配置

```bash
zend_extension=opcache.so
opcache.file_cache=/tmp
opcache.interned_strings_buffer=64
opcache.jit=on
opcache.jit_buffer_size=256M
opcache.max_accelerated_files=65535
opcache.memory_consumption=512
opcache.revalidate_freq=60
opcache.validate_permission=on
opcache.validate_root=on
```

## systemctl restart php8.3-fpm

```bash
systemctl restart php8.3-fpm
```
