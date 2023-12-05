# 甲骨文 VPS 安装 Ubuntu 22.04

## 准备工作

### 1.甲骨文 arm 架构 VPS

### Ubuntu/Debian arm64

```bash
apt update -y
apt install wget -y
cd /boot/efi/EFI
wget https://github.com/netbootxyz/netboot.xyz/releases/download/2.0.74/netboot.xyz-arm64.efi
```

### 2.甲骨文控制台设置,启动 Cloud Shell 连接

### 3.重启 VPS ，并在 Cloud Shell 里面不停按键盘 ESC 键，进入 BIOS

### 4.选择 Boot Maintenance Manager —> EFI —> netboot.xyz-arm64.efi，点击回车，进行引导

< img src= "" />