# Docker 构建 warp 镜像文件配套 XrayR 后端实现解锁 Netflix 和 ChatGPT

## 安装 Ubuntu

[官网](1.1.1.1)

```bash
# Add cloudflare gpg key
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg


# Add this repo to your apt repositories
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list


# Install
sudo apt-get update && sudo apt-get install cloudflare-warp
```

## 注册

```bash
warp-cli register
warp-cli set-license key # 将key替换为密钥 (如果没有请到电报获取)
warp-cli set-mode proxy

warp-cli set-proxy prot 40000 (默认项：可不执行此命令)
warp-cli connect
warp-cli status

curl https://www.cloudflare.com/cdn-cgi/trace --socks5 127.0.0.1:40000 # 查看
```
