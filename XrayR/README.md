# 自动化安装 XrayR

### 先决条件

1. Ubuntu 20.04
2. 修改 `config.yml` 配置文件。[点击下载](https://raw.githubusercontent.com/Sam-Mey/Documentation/main/XrayR/config.yml)
3. 修改 `docker-compose` 配置文件。[点击下载](https://github.com/Sam-Mey/Documentation/blob/main/XrayR/docker-compose.yml)
4. 将 `config.yml` 与 `docker-compose` 上传到 `root` 目录下

### 务必在 `root` 目录下执行一键安装
```bash
wget https://raw.githubusercontent.com/Sam-Mey/Documentation/main/XrayR/install_XrayR.sh \
     https://raw.githubusercontent.com/Sam-Mey/Documentation/main/XrayR/update.sh \
  && chmod +x install_XrayR.sh update.sh \
  && ./install_XrayR.sh
```

### 查看日志需要手动进入 `XrayR` 目录
```bash
cd XrayR-release
docker-compose logs
```

### 更新XrayR  
删除容器并重启，更新软件后config.yml不会被更新覆盖。

注意在 docker-compose.yml 所在的目录下执行：
```bash
cd XrayR-release
docker-compose pull
docker-compose up -d
```
## [官方文档](https://xrayr-project.github.io/XrayR-doc/xrayr-xia-zai-he-an-zhuang/install/docker.html)
