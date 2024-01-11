# 包含一些 安装教程 与一些 全自动化安装脚本

## 目录

1. [数据处理](https://github.com/Sam-Mey/some_project/tree/main/DataProcessing)
2. [Docker 搭建 WEB 环境，LNMP](https://github.com/Sam-Mey/some_project/tree/main/Docker-LNMP)
3. [一键证书申请](https://github.com/Sam-Mey/some_project/tree/main/EasySSL)
4. [OpenWRT LEDE 的编译流程](https://github.com/Sam-Mey/some_project/tree/main/OpenWRT-LEDE)
5. [通过网络引导程序重置 甲骨文云 vps 系统](https://github.com/Sam-Mey/some_project/tree/main/OracleCloud_Resystem)
6. [本地搭建 React + Django 项目开发环境](https://github.com/Sam-Mey/some_project/tree/main/React-Django_dev-env)
7. [一键 设置 vps 防火墙](https://github.com/Sam-Mey/some_project/tree/main/WAF-Rules)
8. [一键 XrayR 安装](https://github.com/Sam-Mey/some_project/tree/main/XrayR)
9. [ssPanel 面板搭建](https://github.com/Sam-Mey/some_project/tree/main/ssPanel)
10. [warp_1.1.1.1 解锁流媒体 （未完成）...](https://github.com/Sam-Mey/some_project/tree/main/warp_1.1.1.1)

### 临时笔记，记性不好 `:(`

> 要将本地 项目 中的文件上传到 GitHub 的 项目 仓库中，您可以按照以下步骤进行操作
>
> 确保已安装Git
>
> 克隆GitHub仓库
>
> 如果您还没有克隆 项目 仓库到您的本地计算机，请在终端（命令提示符）中运行以下命令

```bash
git clone https://github.com/您的用户名/项目.git
```

> 将要上传的文件复制到本地仓库：项目目录中
>
> 将更改添加到暂存区
>
> 在终端中导航到 项目 目录，然后运行以下命令

```bash
cd 项目
git add .
```

### 设置用户名和邮箱地址

```bash
git config --global user.email "your_email@example.com"
git config --global user.name "Your Name"
```

### 提交更改

```bash
git commit -m "添加了新文件"
```

### 推送到GitHub

```bash
git push origin main
```

### 查看哪些文件没有被添加到 Git 跟踪列表

```bash
git status
```
