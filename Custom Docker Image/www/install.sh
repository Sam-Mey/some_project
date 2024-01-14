docker exec -it web-php-1 bash  # 进入 PHP 容器

cd /var/www/html  # 进入站点目录

# 下载 Composer
wget https://getcomposer.org/installer -O composer.phar

# 安装 Composer
php composer.phar

# 使用 Composer 安装依赖
php composer.phar install --no-dev

# 设置网站目录的整体权限
chmod -R 755 *
chown -R www-data:www-data *

# 退出 PHP 容器
exit

# 进入到 MySQL 容器
docker exec -it mariadb_container /bin/bash

