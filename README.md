# docker-kali-pentest
Lazy Docker setup of Kali 🐲 Linux for HTB pen testing 🚩

## Operation
1. Download your OVPN file from HTB.eu and place it in this folder.
2. Build using: `docker build -t kali .`
3. Run using: `docker run -ti  --privileged kali /bin/bash`.
4. Enable tunnel using `./enalbe-tunnel.sh` inside the container.
5. Connect to vpn using `openvpn --config  <myvpnfile> --daemon`.
6. Start hacking.