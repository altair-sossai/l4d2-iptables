# Flush all existing iptables rules and delete any custom chains
sudo iptables -F
sudo iptables -X

# Set the default policies for the INPUT, OUTPUT, and FORWARD chains to ACCEPT
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT

# Drop packets with INVALID connection tracking state
sudo iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

# Drop packets from private IP address ranges
sudo iptables -A INPUT -s 10.0.0.0/8 -j DROP
sudo iptables -A INPUT -s 172.16.0.0/12 -j DROP
sudo iptables -A INPUT -s 192.168.0.0/16 -j DROP

# Drop packets from multicast and reserved IP address ranges
sudo iptables -A INPUT -s 224.0.0.0/4 -j DROP
sudo iptables -A INPUT -s 240.0.0.0/5 -j DROP

# Drop UDP packets with source port 0
sudo iptables -A INPUT -p udp --sport 0 -j DROP

# Drop UDP broadcast packets
sudo iptables -A INPUT -p udp -m pkttype --pkt-type broadcast -j DROP

# Drop fragmented ICMP packets
sudo iptables -A INPUT -p icmp -f -j DROP

# Drop incoming TCP packets with destination port 27015
sudo iptables -A INPUT -p tcp --dport 27015 -j DROP

# Drop UDP packets with destination port 27015 and length between 0 and 32
sudo iptables -A INPUT -p udp --dport 27015 -m length --length 0:32 -j DROP

# Drop UDP packets with destination port 27015 and length between 2521 and 65535
sudo iptables -A INPUT -p udp --dport 27015 -m length --length 2521:65535 -j DROP

# Allow specific IP addresses to access the server on UDP port 27015 (Uncomment and modify the IP address)
# sudo iptables -A INPUT -p udp --dport 27015 -s 200.79.187.230 -m state --state ESTABLISHED -j ACCEPT

# Allow established UDP connections to port 27015
sudo iptables -A INPUT -p udp --dport 27015 -m state --state ESTABLISHED -j ACCEPT

# Limit incoming UDP connections to port 27015 to prevent DoS attacks
sudo iptables -A INPUT -p udp --dport 27015 -m state --state NEW -m hashlimit --hashlimit-mode srcip,dstport --hashlimit-name StopDoS --hashlimit 1/s --hashlimit-burst 3 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 27015 -m state --state NEW -m hashlimit --hashlimit-mode srcip --hashlimit-name StopDoS --hashlimit 1/s --hashlimit-burst 3 -j ACCEPT

# Drop all other incoming UDP packets to port 27015
sudo iptables -A INPUT -p udp --dport 27015 -j DROP
