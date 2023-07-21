# 甲骨文 VPS 安装 CentOS 8

# 准备工作：
#### 1.甲骨文 arm 架构 VPS
#### 2.本地安装 VNC 用于连接 vps 安装系统

# 安装系统：
### 1.SSH 连接 VPS，并进入 boot 文件夹，下载 Netboot 启动文件
```bash
apt update -y
apt install wget -y
cd /boot/efi/EFI
wget https://boot.netboot.xyz/ipxe/netboot.xyz-arm64.efi
```
### 2.甲骨文控制台设置,启动 Cloud Shell 连接
### 3.重启 VPS ，并在 Cloud Shell 里面不停按键盘 ESC 键，进入 BIOS
### 4.选择 Boot Maintenance Manager —> Boot Frome File —> netboot.xyz-arm64.efi，点击回车，进行引导！
### 5.选择 Linux Network Installs (arm64)
### 6.选择 CentOS —> CentOS 8.0 Stream，点击回车，再次选择 CentOS 8-stream text based
### 7.选择 VNC 连接方式。
### 8.设置 VNC 密码 任意（6-8）字符
### 9.启动 VNC 输入 vps 的 IP:1 连接进行相关设置
### 10.启动 SSH 连接实例
