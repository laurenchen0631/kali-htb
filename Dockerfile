FROM kalilinux/kali-rolling
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
RUN apt-get -y update
RUN apt-get -y dist-upgrade && apt-get -y autoremove 
# install system essentials
RUN apt-get -y install build-essential curl openvpn bridge-utils net-tools seclists vim 
RUN apt-get -y install kali-linux-default kali-linux-nethunter iptables metasploit-framework
RUN apt-get clean

#Copy necessary files for VPN and tunneling
COPY *.ovpn enable-tunnel.sh ./
