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

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/CentOS/img/1.jpg" />

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/CentOS/img/2.jpg" />

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/CentOS/img/3.jpg" />

### 5.选择 Linux Network Installs (arm64)

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/CentOS/img/4.jpg" />

### 6.选择 Ubuntu ---> Ubuntu 22.04 TLS jammy 回车（如图 7 ）


### 7.使用 ‘上下键’ 切换至 `Continue in rich mode` 回车

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/Ubuntu/img/1%20(1).png" />

### 8.Keyboard configuration 布局保持默认

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/Ubuntu/img/1%20(2).png" />

### 9.Network connection 网络连接保持默认

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/Ubuntu/img/1%20(3).png" />

### 10.Configur proxy 配置代理

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/Ubuntu/img/1%20(4).png" />

### 11. Guided storage configuration 引导存储配置 保持默认

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/Ubuntu/img/1%20(5).png" />

### 12.storage configuration 存储配置保持默认

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/Ubuntu/img/1%20(6).png" />

### 13.此时将进行安装步骤的继续，‘上下键’切换至 `Continue` 回车

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/Ubuntu/img/1%20(7).png" />

### 14.创建用户和密码

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/Ubuntu/img/1%20(8).png" />

### 15.出现 upgrade to ubuntu pro （升级到 ubuntu 专业版）保持默认即可

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/Ubuntu/img/1%20(9).png" />

### 16.此步骤很重要，‘上下键’切换到 [ ] Install OpenSSH server 使用 ‘空格键’ 将其选择；例：`[X] Install OpenSSH server`

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/Ubuntu/img/1%20(10).png" />

### 17.安装完成，重启

<img src="https://github.com/Sam-Mey/some_project/blob/main/OracleCloud_Resystem/Ubuntu/img/1%20(11).png" />
