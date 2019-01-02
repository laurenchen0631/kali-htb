FROM kalilinux/kali-linux-docker
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
# do APT update
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get -y autoremove && apt-get clean
# install system essentials
RUN apt-get install build-essential curl file git openvpn bridge-utils kali-linux-nethunter net-tools seclists zsh -y
RUN apt-get install sudo -y

# create a new user
RUN adduser --quiet --disabled-password --shell /bin/bash --home /home/newuser --gecos "User" newuser
RUN echo "newuser:newpassword" | chpasswd
RUN usermod -aG sudo newuser

# switch to new user
USER newuser
WORKDIR /home/newuser

# # install and setup linuxbrew
# RUN $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
# RUN test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
# RUN test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# RUN test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
# RUN echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
# RUN sudo mkdir -p /hilal/.linuxbrew/var/homebrew/linked
# RUN sudo chown -R $(whoami) /hilal/.linuxbrew/var/homebrew/linked
# RUN sudo mkdir -p /hilal/.linuxbrew/var/homebrew/locks
# RUN sudo chown -R $(whoami) /hilal/.linuxbrew/var/homebrew/locks

#Copy necessary files for VPN and tunneling
COPY *.ovpn enable-tunnel.sh ./


