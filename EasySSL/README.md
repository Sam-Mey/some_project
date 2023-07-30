# 根据官方步骤自定义一键证书申请

### 1.务必开放 80 端口
#### Ubuntu/Debian
```bash
sudo iptables -I INPUT -s 0.0.0.0/0 -p tcp --dport 80 -j ACCEPT
iptables-save
```
#### CentOS
```bash
sudo systemctl status firewalld
sudo firewall-cmd --zone=public --add-port=12345/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-all
```
