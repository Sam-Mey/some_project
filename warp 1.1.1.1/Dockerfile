# 使用官方的Ubuntu 20.04作为基础镜像
FROM ubuntu:20.04

# 安装必要的软件包
RUN apt-get update && \
    apt-get install -y curl gpg lsb-release

# 下载并添加Cloudflare GPG密钥
RUN curl https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

# 添加Cloudflare的APT源
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-client.list

# 更新APT并安装Cloudflare Warp
RUN apt-get update && \
    apt-get install -y cloudflare-warp

# 运行Cloudflare Warp
CMD ["cloudflare-warp"]

# 安装 Cloudflare Warp
RUN apt-get update && \
    apt-get install -y cloudflare-warp

# 运行 Cloudflare Warp
CMD ["cloudflare-warp"]
