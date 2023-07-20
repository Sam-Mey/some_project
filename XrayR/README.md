# 自动化安装 XrayR

### 准备工作

1. Ubuntu 20.04
2. 修改 `config.yml` 配置文件，是为了服务端与前端的面板对接。[点击下载](https://raw.githubusercontent.com/Sam-Mey/Documentation/main/XrayR/config.yml)
3. 修改 `docker-compose` 配置文件，是为了控制 `XrayR` 运行时产生的日志文件大小。[点击下载](https://github.com/Sam-Mey/Documentation/blob/main/XrayR/docker-compose.yml)
4. 将 `config.yml` 与 `docker-compose` 上传到 `root` 目录下

### 务必在 `root` 目录下执行一键安装
```bash
wget https://raw.githubusercontent.com/Sam-Mey/Documentation/main/XrayR/install_XrayR.sh && chmod +x install_XrayR.sh && ./install_XrayR.sh
```

### 查看日志需要手动进入 `XrayR` 目录
```bash
cd XrayR-release
```
