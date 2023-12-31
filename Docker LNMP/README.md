# 安装 [Docker](https://www.docker.com/)

## [Docker Hub 镜像站](https://hub.docker.com/)

## Centos

```bash
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io -y
systemctl start docker
systemctl enable docker
```

## Debian / Ubuntu： 【amd64】

```bash
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
systemctl start docker
systemctl enable docker
```

## arm64 需替换以下

```bash
   "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

## 安装 Docker-[compose](https://github.com/docker/compose)

```bash
curl -fsSL https://get.docker.com | bash -s docker
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

## 创建目录

```bash
cd /
mkdir www
cd www
mkdir server wwwroot 
cd server
mkdir nginx mysql php redis phpmyadmin
cd /www/server/nginx
touch nginx.conf
mkdir certs
cd /www/wwwroot
mkdir website
cd website
touch index.php
echo "<?php phpinfo(); ?>" >> index.php
```

## 安装 Docker 图形化管理 portainer

```bash
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```

重启 portainer：

```bash
docker restart portainer
```

## 卸载

### Ubuntu/Debian

如果是 CentOS 系统用 `sudo yum remove docker-ce docker-ce-cli containerd.io`

```bash
sudo systemctl stop docker
sudo apt-get purge docker-ce docker-ce-cli containerd.io -y
sudo apt-get purge docker-ce docker-ce-rootless-extras docker-compose -y
sudo apt-get purge docker-buildx-plugin docker-compose-plugin -y
sudo apt-get autoremove -y
sudo rm -rf /var/lib/docker
sudo rm -rf /etc/docker
sudo rm /usr/local/bin/docker-compose
```

## 检查是否完全卸载

```bash
dpkg -l | grep docker
rpm -qa | grep docker
ls /var/lib/docker
ls /etc/docker
docker-compose --version
```

## 相关命令

### 运行 查看

```bash
docker ps -a
docker-compose up -d
```

### 重新加载

```bash
docker restart <容器名称或ID>

docker restart $(docker ps -q)
```

### 删除所有容器

```bash
docker rm -f $(docker ps -a -q)
```

### 进入 Docker 容器

```bash
docker exec -it <容器名称或ID> /bin/bash
```

### 赋予权限

```bash
docker exec -it 容器名称 /bin/bash

docker exec -it nginx chmod -R 775 /var/www/html
docker exec -it php chmod -R 775 /var/www/html
```

### 在 Docker 容器内查看文件的内容  `cat`、`less` 或 `more`

```bash
docker exec <容器名称或ID> cat /path/to/file

docker exec <容器名称或ID> less /path/to/file
docker exec <容器名称或ID> more /path/to/file
```

### 输出容器的日志信息

```bash
docker logs <container_id>
```
