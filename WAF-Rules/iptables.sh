#!/bin/bash

# 清除所有规则和链，保留原有规则和链
#iptables -F
#iptables -X

# 禁止ICMP回显请求（ping）
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

# 限制同时建立的新连接数
iptables -A INPUT -p tcp --syn -m connlimit --connlimit-above 10 -j DROP

# 阻止无效的和伪造的源IP地址
iptables -A INPUT -s 127.0.0.0/8 -j DROP
iptables -A INPUT -s 0.0.0.0/8 -j DROP
iptables -A INPUT -s 169.254.0.0/16 -j DROP
iptables -A INPUT -s 192.0.2.0/24 -j DROP
iptables -A INPUT -s 224.0.0.0/4 -j DROP
iptables -A INPUT -d 224.0.0.0/4 -j DROP
iptables -A INPUT -s 240.0.0.0/5 -j DROP
iptables -A INPUT -d 240.0.0.0/5 -j DROP
iptables -A INPUT -s 0.0.0.0/32 -j DROP
iptables -A INPUT -d 0.0.0.0/32 -j DROP

# 限制TCP SYN Flood攻击
iptables -A INPUT -p tcp --syn -m limit --limit 1/s --limit-burst 3 -j ACCEPT
iptables -A INPUT -p tcp --syn -j DROP

# 防止IP被扫描
iptables -N LOG_SCANS
iptables -A LOG_SCANS -m limit --limit 5/m --limit-burst 10 -j LOG --log-prefix "[Port Scan] " --log-level 7
iptables -A LOG_SCANS -j DROP
iptables -A INPUT -p tcp --tcp-flags FIN,SYN,RST,ACK SYN -j LOG_SCANS

# 防止DDoS攻击
iptables -A INPUT -p tcp --dport 80 -m limit --limit 100/minute --limit-burst 200 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j DROP

# 防止XSS攻击
iptables -A INPUT -m string --string "<script>" --algo bm -j DROP

# 防止SQL注入
iptables -A INPUT -m string --string "union" --algo bm -j DROP
iptables -A INPUT -m string --string "select" --algo bm -j DROP

# 防止PHP攻击
iptables -A INPUT -m string --string "<?php" --algo bm -j DROP

# 防止MITM攻击
iptables -A INPUT -p tcp --tcp-flags ALL SYN,FIN -j DROP

# 防止URL攻击
iptables -A INPUT -m string --string "http://" --algo bm -j DROP

# 防止DNS劫持
iptables -A INPUT -p udp --dport 53 -m u32 --u32 "0>>22&0x3f=0x03" -j DROP

# 防止CSRF攻击
iptables -A INPUT -m string --string "Referer: " --algo bm -j DROP

# 默认策略为DROP，即不允许其他任何连接
iptables -P INPUT DROP
iptables -P FORWARD DROP

# 保存规则（对没有安装 iptable 的 vps 需要先安装 iptable ）
iptables-save > /etc/iptables/rules.v4

# 已安装 iptable 运行下列代码
iptables-save

# 重新加载iptables规则（rules.v4）
sudo iptables-restore < /etc/iptables/rules.v4


# 重启iptables服务（根据操作系统可能会有所不同）
#systemctl restart iptables.service