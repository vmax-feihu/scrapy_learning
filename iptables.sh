#!/bin/bash

# 允许所有INPUT、OUTPUT活动
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
# 清除预设表filter中的所有INPUT规则链的规则
iptables -F INPUT
iptables -F OUTPUT
# 清除预设表filter中使用者自定链中的规则
iptables -X
# 计数器全部变0
iptables -Z

# 允许本地回环接口(即运行本机访问本机)
iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT

# 允许部分区间段IP的进出访问
iptables -A INPUT -p tcp -s 10.11.180.0/24 -j ACCEPT
iptables -A INPUT -p tcp -d 10.11.180.0/24 -j ACCEPT
iptables -A INPUT -p tcp -s 10.9.233.0/24 -j ACCEPT
iptables -A INPUT -p tcp -d 10.9.233.0/24 -j ACCEPT

# 允许部分端口访问
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
iptables -A INPUT -p udp --dport 123 -j ACCEPT
iptables -A OUTPUT -p udp --sport 123 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT

# 允许ping和traceroute
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j DROP
iptables -A INPUT -m state --state ESTABLISHED -j DROP

# 其他不允许访问
iptables -P INPUT DROP
iptables -P FORWARD DROP

# 禁止特殊端口出口
iptables -A OUTPUT -p tcp --sport 31337:31340 -j DROP
iptables -A OUTPUT -p tcp --dport 31337:31340 -j DROP

# 保存规则表
service iptables save
iptables -L -n --line-numbers

echo "Restart iptables?(y/n)[y]"
RESPONSE="y"
read RESPONSE
while [ "$RESPONSE" != "" ] && [ "$RESPONSE" != "y" ] && [ "$RESPONSE" != "Y" ] && [ "$RESPONSE" != "n" ] && [ "$RESPONSE" != "N" ]
do
	echo "please input your choice.(y/n)[y]"
	read RESPONSE
done
if [ "$RESPONSE" == "Y"  ] || [ "$RESPONSE" == "y" ] || [ "$RESPONSE" == "" ];then
	service iptables restart
fi
