# Docker 部署 SSPanel UIM  
### [SSPanel UIM Wiki](https://wiki.sspanel.org/)  
### [Github](https://github.com/Anankke/SSPanel-Uim)
### 配置：
> 1.Ubuntu 22.04  
> 2.Nginx  
> 3.PHP  
> 4.MariaDB  
> 5.Redis  
> 6.phpMyAdmin  

## 安装必要的软件

```bash
apt install curl gnupg2 ca-certificates lsb-release ubuntu-keyring
```

## 1.安装 Docker，参阅 [Docker LNMP](https://github.com/Sam-Mey/some_project/blob/main/Docker-LNMP/README.md)

## 2.创建目录
```bash
cd /
mkdir www
cd www
mkdir server wwwlogs wwwroot
cd server
mkdir mysql nginx php phpmyadmin redis
cd nginx
touch nginx.conf
mkdir certs
cd /www/server/php
mkdir etc bin
cd /www/wwwroot
mkdir 存放项目的文件夹
cd 存放项目的文件夹
```
## 3.编写配置文件：

> 1.编写 `docker-compose.yml` 文件 [下载]()  
> 2.编写 `nginx.conf` 文件 [下载]()  

## 4.部署 SSPanel UIM

