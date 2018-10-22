#!/usr/bin/bash
#Set default policy
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
# Inbound Rules which are accepted
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p icmp --icmp-type 0 -m state --state ESTABLISHED,RELATED -j ACCEPT
# Outbound rules which are accepted
iptables -A OUTPUT -o lo -j ACCEPT #Accept outbound connection to localhost
iptables -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT #DNS Port
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT #DNS Port
iptables -A OUTPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT #HTTP Port
iptables -A OUTPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT #HTTPS Port
iptables -A OUTPUT -p tcp --dport 2121 -m state --state NEW,ESTABLISHED -j ACCEPT #FTP Port
iptables -A OUTPUT -p tcp --dport 21 -m state --state NEW,ESTABLISHED -j ACCEPT #FTP Port
iptables -A OUTPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT #FTP Port
iptables -A OUTPUT -p tcp --dport 115 -m state --state NEW,ESTABLISHED -j ACCEPT #Simple FTP
iptables -A OUTPUT -p udp --dport 67 -m state --state NEW,ESTABLISHED -j ACCEPT #DHCP Port
iptables -A OUTPUT -p udp --dport 68 -m state --state NEW,ESTABLISHED -j ACCEPT #DHCP Port
iptables -A OUTPUT -p icmp --icmp-type 8 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT #Ping Port
iptables -A OUTPUT -p tcp --dport 143 -m state --state NEW,ESTABLISHED -j ACCEPT #IMAP Port
iptables -A OUTPUT -p tcp --dport 115 -m state --state NEW,ESTABLISHED -j ACCEPT #Simple FTP
iptables -A OUTPUT -p tcp --dport 993 -m state --state NEW,ESTABLISHED -j ACCEPT #IMAP Port for mail access
iptables -A OUTPUT -p tcp --dport 587 -m state --state NEW,ESTABLISHED -j ACCEPT #IMAP Port 
iptables -A OUTPUT -p tcp --dport 465 -m state --state NEW,ESTABLISHED -j ACCEPT #IMAP Port
iptables -A OUTPUT -p tcp --dport 43 -m state --state NEW,ESTABLISHED -j ACCEPT #WhoIS Port 
# Set default policy for IPV6
ip6tables -P INPUT DROP
ip6tables -P OUTPUT DROP
ip6tables -P FORWARD DROP
