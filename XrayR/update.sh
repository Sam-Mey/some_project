#!/bin/bash

function update_XrayR() {
  cd /root/XrayR-release
  docker-compose pull
  docker-compose up -d
}

update_XrayR
