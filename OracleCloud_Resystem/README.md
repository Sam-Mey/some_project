# 甲骨文 VPS 安装 CentOS 9  
[GitHub仓库 netboot](https://github.com/netbootxyz/netboot.xyz)

# 准备工作：
#### 1.甲骨文 arm 架构 VPS
#### 2.本地安装 VNC 用于连接 vps 安装系统 [官网下载 VNC](https://www.realvnc.com/)

# 安装系统：
### 1.SSH 连接 VPS，并进入 boot 文件夹，下载 Netboot 启动文件
  
#### Ubuntu/Debian arm64
```bash
apt update -y
apt install wget -y
cd /boot/efi/EFI
wget https://boot.netboot.xyz/ipxe/netboot.xyz-arm64.efi
```
  
#### CentOS arm64
```bash
yum update -y
yum apt
cd /boot/efi/EFI
wget https://boot.netboot.xyz/ipxe/netboot.xyz-arm64.efi
```
  
#### x86_64
```bash
cd /boot/efi/EFI
wget https://boot.netboot.xyz/ipxe/netboot.xyz.efi
```
  
### 2.甲骨文控制台设置,启动 Cloud Shell 连接

### 3.重启 VPS ，并在 Cloud Shell 里面不停按键盘 ESC 键，进入 BIOS

### 4.选择 Boot Maintenance Manager —> EFI —> netboot.xyz-arm64.efi，点击回车，进行引导！
<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/img/1.jpg" />
<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/img/2.jpg" />
<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/img/3.jpg" />

### 5.选择 Linux Network Installs (arm64)
<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/img/4.jpg" />

### 6.选择 CentOS —> CentOS 8.0 Stream —> CentOS 8-stream text based 回车
<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/img/5.jpg" />

### 7.输入 1 回车；选择 VNC 连接方式。
<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/img/6.jpg" />

### 8.设置 VNC 密码 任意（6-8）字符 如：123456
  
### 9.启动 VNC 输入 vps 的 IP:1 连接进行相关设置（VNC 选择中文操作界面）
<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/img/7.jpg" />
<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/img/8.jpg" />
<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/img/9.jpg" />
<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/img/10.jpg" />

### 最后启动 SSH 连接实例
