#!/bin/bash

# 指定XrayR-release目录的路径
xrayr_release_dir="/root/XrayR-release"

# 切换到XrayR-release目录
cd "$xrayr_release_dir"

function update_XrayR() {
  cd /root/XrayR-release
  docker-compose pull
  docker-compose up -d
}

update_XrayR
