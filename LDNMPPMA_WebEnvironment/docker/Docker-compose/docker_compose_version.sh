get_versions() {
    docker_version=$(echo "Docker version 24.0.2, build cb74dfc")
    docker_compose_version=$(echo "docker-compose version 1.26.1, build f216ddbf")

    echo "官方稳定版："
    echo "Docker版本: $docker_version"
    echo "docker-compose版本: $docker_compose_version"
    echo "按 ENTER" 即同意安装； CTRL + C 退出脚本!!!
}
