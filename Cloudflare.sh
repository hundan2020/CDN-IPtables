#!/bin/bash
iptables -F
iptables -I INPUT -p tcp -m multiport --dports -s "103.21.244.0/22" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "103.22.200.0/22" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "103.31.4.0/22" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "104.16.0.0/12" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "108.162.192.0/18" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "131.0.72.0/22" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "141.101.64.0/18" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "162.158.0.0/15" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "172.64.0.0/13" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "173.245.48.0/20" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "188.114.96.0/20" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "190.93.240.0/20" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "197.234.240.0/22" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "198.41.128.0/17" -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports -s "199.27.128.0/21" -j ACCEPT
iptables -P INPUT DROP
iptables -A INPUT -i -m state --state ESTABLISHED,RELATED -j ACCEPT
ip6tables -I INPUT -p tcp -m multiport --dports -s "2400:cb00::/32" -j ACCEPT
ip6tables -I INPUT -p tcp -m multiport --dports -s "2405:8100::/32" -j ACCEPT
ip6tables -I INPUT -p tcp -m multiport --dports -s "2405:b500::/32" -j ACCEPT
ip6tables -I INPUT -p tcp -m multiport --dports -s "2606:4700::/32" -j ACCEPT
ip6tables -I INPUT -p tcp -m multiport --dports -s "2803:f800::/32" -j ACCEPT
ip6tables -P INPUT DROP
ip6tables -A INPUT -i -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables-save > /etc/iptables/rules.v4
ip6tables-save > /etc/iptables/rules.v6
