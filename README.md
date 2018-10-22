# iptables
Script for iptables rules for use in a standard laptop environment.
The following commands can make the rules stick after reboot
/iptables-save > /etc/network/iptables.up.rules
/crontab -e <add the followng in the opened file>
/  @reboot sudo iptables-restore < /etc/network/iptables.up.rules 
