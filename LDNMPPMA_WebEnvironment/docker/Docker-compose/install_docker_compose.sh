install_docker() {
    curl -fsSL https://get.docker.com | bash -s docker
}

install_docker_compose() {
    curl -L "https://github.com/docker/compose/releases/download/1.26.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
}

# 调用函数进行安装
install_docker
install_docker_compose
