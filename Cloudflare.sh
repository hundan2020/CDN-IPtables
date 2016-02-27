#!/bin/bash
ipset create cf hash:net
for x in $(curl https://www.cloudflare.com/ips-v4); do ipset add cf $x; done
iptables -A INPUT -m set --match-set cf src -p tcp -m multiport --dports http,https -j ACCEPT
for x in $(curl https://www.cloudflare.com/ips-v6); do ipset add cf $x; done
ip6tables -A INPUT -m set --match-set cf src -p tcp -m multiport --dports http,https -j ACCEPT
iptables-save > /etc/iptables/rules.v4
ip6tables-save > /etc/iptables/rules.v6
