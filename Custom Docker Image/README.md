# 自定义 Docker 镜像

## 系统：Ubuntu 22.04 TLS arm64

## 创建文件夹

```bash
cd /
mkdir www
cd www
mkdir server web
cd server
mkdir mysql nginx php phpmyadmin redis
cd nginx
touch nginx.conf
mkdir sites
cd sites
touch server.conf
cd /www/web
```

## 执行

```bash
docker-compose up -d
```

## 访问域名或 IP

```bash
xxx.com
xxx.com:8080
```

## 相关命令

### 进入运行中的容器

```bash
docker-compose exec my_php bash
```

### 查看已安装的 PHP 扩展列表

```bash
php -m
```

### 查看日志

```bash
docker logs 容器_ID
```

### 使用正确的名称和标签来执行 docker save 命令，并保存到当前目录下

```bash
docker save -o image.tar 镜像名称:latest
```

### 停止并删除所有正在运行的容器

```bash
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
```

### 当前系统中的所有镜像

```bash
docker images
```

### 将删除所有镜像，执行以下命令

```bash
docker rmi $(docker images -aq)
```

### 镜像被多个仓库引用，所以需要添加 `-f` 标志来强制删除它们

```bash
docker rmi -f 容器ID_1 容器ID_2 容器ID_3 容器ID_4 ...
```

### 列出在 Docker 中创建的所有网络

```bash
docker network ls
```

### 删除指定网络、所有网络

```bash
docker network rm <网络ID或名称>
docker network prune
```

### 附加知识

> *** 构建镜像之前 `sudo sysctl -w vm.overcommit_memory=1`
>  
> vm.overcommit_memory 是Linux内核参数之一，用于控制系统对内存分配的处理方式。具体来说，它涉及到内存超额分配（Overcommitting）的策略。
>  
> 当 vm.overcommit_memory 设置为 0 时，系统允许分配超过实际物理内存的虚拟内存。这意味着，系统允许进程分配的虚拟内存总量超过实际可用的物理内存和交换空间的总和。这种策略通常被称为 "内存超额分配"（Overcommitting）。
>  
> 当 vm.overcommit_memory 设置为 1 时，系统会检查是否有足够的物理内存和交换空间来满足进程所请求的虚拟内存。如果没有足够的空间，分配将被拒绝。这种策略更加保守，可以避免在内存不足的情况下导致系统不稳定。
>  
> 在Redis的情境下，一些特定的工作负载可能会导致内存分配的不确定性，因此将 vm.overcommit_memory 设置为 1 可以提高系统的稳定性，确保只有在系统有足够可用内存时才进行内存分配。
>  
> 总体而言，具体的设置取决于系统的使用场景和需求。在一些要求稳定性和可预测性的环境中，将其设置为 1 是一个常见的做法
>  