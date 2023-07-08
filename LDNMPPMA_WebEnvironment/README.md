根据 `docker-compose.yml` 文件的配置，你可能需要提前创建以下目录：

Nginx 配置文件目录：
```bash
mkdir -p /usr/share/nginx/html
mkdir -p /etc/nginx/certs  
touch /etc/nginx/nginx.conf
```
 
MySQL 数据目录：
```bash
mkdir -p /var/lib/mysql/mysql_data
```

php 配置文件目录：
```bash
mkdir -p /var/www/html
mkdir -p /usr/local/etc/php
touch /usr/local/etc/php/php.ini
```

确保在执行 `docker-compose up -d` 命令之前，你已经创建了这些相关目录，并将所需的文件放置在正确的目录中。这样，Docker 容器将能够正确地与这些目录进行挂载和共享。

容器启动完成之后，创建一个 `index.html` 随便写点内容做测试。
例如 root 目录下：
```bash
touch index.html
```

将 index.html 文件复制到 Nginx 容器内的 /usr/share/nginx/html 目录中。您可以使用以下命令将文件复制到容器内：
```bash
docker cp /本地文件路径/index.html <NGINX_容器名称或ID>:/usr/share/nginx/html
```
查看容器 ID
```bash
docker ps
```

如果你搭建其他网站，使用 `docker-compose exec` 命令进入 Nginx 容器的 shell：
```bash
docker-compose exec nginx /bin/sh
```

创建一个新站点来存储你的网站数据。假设你要将网站数据存储在容器内的 /usr/share/nginx/html 目录下：
```bash
mkdir /usr/share/nginx/html/你的站点
```

退出容器的 shell，返回到本地终端。
使用 docker cp 命令将本地网站数据复制到容器中。假设您的容器名称为 nginx，可以使用以下命令：
```bash
docker cp /path/to/website/. nginx:/usr/share/nginx/html/你的站点
```

这将把本地 /path/to/website 目录中的所有文件和文件夹复制到容器的 /usr/share/nginx/html 目录中。
再次进入 Nginx 容器的 shell：
```bash
docker-compose exec nginx /bin/sh
```

确保网站数据已成功复制到容器内的目标目录。使用以下命令检查目录内容：
```bash
ls -l /usr/share/nginx/html/你的站点
```

要在 Nginx 配置文件中配置域名的证书，修改 `nginx.conf` ; 在监听 443 端口的配置块中，添加以下配置项：
```bash
listen 443 ssl;
        server_name your_domain.com;
        ssl_certificate /etc/nginx/certs/nginx.crt;
        ssl_certificate_key /etc/nginx/certs/nginx.key;

        location / {
            return 301 https://$host$request_uri;
        } 
```

在 Nginx 容器中重新加载配置，可以使用以下命令：
```bash
docker-compose exec nginx nginx -s reload
```

