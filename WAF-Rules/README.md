# WAF-Rules （Ubuntu/Debian）

## 安装 iptable 

root目录下执行：
  ```
  # 查看操作系统
  cat /etc/os-release
  ```
```bash
mkdir WAF-Rules
wget https://raw.githubusercontent.com/Sam-Mey/some_project/main/WAF-Rules/iptables.sh && chmod +x iptables.sh && ./iptables.sh
```

#### 查看 当前 IPTables（Linux 防火墙）的开放端口情况：
```
sudo iptables -L -n
```

#### 查看 IPTables（Linux 防火墙）特定端口的规则，例如 80（HTTP）：
```
sudo iptables -L -n | grep "dpt:80"
ss -tuln | grep 80
ss -tuln | grep LISTEN                    # 输出所有正在监听的套接字
```

#### 查看系统上所有端口的开放情况：
```
sudo netstat -tuln
```

#### 查看TCP端口：
```
sudo netstat -tln
```

#### 查看UDP端口：
```
sudo netstat -uln
```

#### 检查系统上的 ping 是否开启：
```
sudo iptables -L INPUT -v -n | grep icmp
```

#### 还可以通过执行以下命令来检查 ping 是否开启：
```
sudo sysctl net.ipv4.icmp_echo_ignore_all
```

#### 开放指定端口：
```
iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 443 -j ACCEPT
iptables-save
```

#### 删除指定端口规则：
```
sudo iptables -D INPUT -p tcp --dport 80 -j ACCEPT
```
