# 利用Lean方法编译 OpenWRT-and-LEDE

## 注意

1. **不要用 root 用户进行编译**
2. 国内用户编译前最好准备好梯子
3. lede 默认登录 用户名：192.168.1.1 密码 password
4. openwrt 登录 用户名：root 密码：无


1. Linux 系统，推荐 Ubuntu LTS 或 Windows 子系统 或 阿里云 海外vps

## 准备工作
### 本地 Windows 子系统 为例：
1. 配置 WSL 全局代理
   ```bash
   vim ~/.bashrc
   ```

2. 以 `clash for Windows` （需要开启`Allow Lan`）为例， 
cmd 输入 `ipconfig` 查看 `vEthernet (WSL)` 的 `IPv4` 就是代理 `IP`； 编辑模式在最下面添加两条
   ```bash
   export http_proxy=http://代理IP：代理port
   export https_proxy=http://代理IP：代理port
   ```
3. 保存退出并重新加载源；测试是否代理成功可用：`curl http://google.com` 返回值则为代理生效
   ```bash
   source ~/.bashrc
   ```
## 编译命令
1. 安装编译依赖

   ```bash
   sudo apt update -y
   sudo apt full-upgrade -y
   sudo apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
   bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib \
   git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \
   libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \
   mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pyelftools \
   libpython3-dev qemu-utils rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip \
   vim wget xmlto xxd zlib1g-dev python3-setuptools
   ```

2. 下载源代码，更新 feeds 并选择配置

   ```bash
   git clone https://github.com/openwrt/openwrt.git
   cd openwrt
   ./scripts/feeds update -a
   ./scripts/feeds install -a
   make menuconfig
   ```

3. 下载 dl 库，编译固件
（-j 后面是线程数，第一次编译推荐用单线程）

   ```bash
   make download V=s -j8
   ```
   由于 WSL 的 PATH 中包含带有空格的 Windows 路径，有可能会导致编译失败，请在 `make` 前面加上：

   ```bash
   PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   make V=s -j1
   ```
   
4. 如果你是在 `root` 用户下编译；请 `make` 前面加上：
  
   ```bash
   export FORCE_UNSAFE_CONFIGURE=1
   ```


你可以自由使用，但源码编译二次发布请注明Lean 的 GitHub 仓库链接。谢谢合作！

二次编译：  

```bash
cd lede
git pull
./scripts/feeds update -a
./scripts/feeds install -a
make defconfig
make download -j8
make V=s -j$(nproc)
```

如果需要重新配置：  

```bash
rm -rf ./tmp && rm -rf .config
make menuconfig
make V=s -j$(nproc)
```

编译完成后输出路径：bin/targets


### macOS 原生系统进行编译

1. 在 AppStore 中安装 Xcode

2. 安装 Homebrew：

   ```bash
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   ```

3. 使用 Homebrew 安装工具链、依赖与基础软件包:

   ```bash
   brew unlink awk
   brew install coreutils diffutils findutils gawk gnu-getopt gnu-tar grep make ncurses pkg-config wget quilt xz
   brew install gcc@11
   ```

4. 然后输入以下命令，添加到系统环境变量中：

   ```bash
   echo 'export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"' >> ~/.bashrc
   echo 'export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"' >> ~/.bashrc
   echo 'export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"' >> ~/.bashrc
   echo 'export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"' >> ~/.bashrc
   echo 'export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"' >> ~/.bashrc
   echo 'export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"' >> ~/.bashrc
   echo 'export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"' >> ~/.bashrc
   ```

5. 重新加载一下 shell 启动文件 `source ~/.bashrc`，然后输入 `bash` 进入 bash shell，就可以和 Linux 一样正常编译了

## 特别提示

1. 源代码中绝不含任何后门和可以监控或者劫持你的 HTTPS 的闭源软件， SSL 安全是互联网最后的壁垒。安全干净才是固件应该做到的；

2. 存档版本仓库地址：<https://github.com/coolsnowwolf/openwrt>

3. 官方源码仓库地址：https://github.com/openwrt/openwrt

