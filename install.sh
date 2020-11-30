#!/bin/bash

echo -e "\e[92m ---------------------------------------------------------\e[0m"
echo -e "\e[92m preparation\e[0m"
echo -e "\e[92m ---------------------------------------------------------\e[0m"

echo -e "\e[93m********** navigate to home directory **********\e[0m"
cd ~

echo -e "\e[93m********** apt update **********\e[0m"
sudo apt update


echo -e "\e[92m ---------------------------------------------------------\e[0m"
echo -e "\e[92m basics\e[0m"
echo -e "\e[92m ---------------------------------------------------------\e[0m"

echo -e "\e[93m********** installing Chrome **********\e[0m"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome*.deb -y
rm google-chrome*.deb

echo -e "\e[93m********** installing Double Commander **********\e[0m"
sudo apt-get install doublecmd-gtk -y

echo -e "\e[93m********** installing VLC video player **********\e[0m"
sudo apt install vlc -y

echo -e "\e[93m********** installing speedtest-cli **********\e[0m"
sudo apt install speedtest-cli -y

echo -e "\e[93m********** installing bpytop **********\e[0m"
sudo snap install bpytop
sudo snap connect bpytop:mount-observe
sudo snap connect bpytop:network-control
sudo snap connect bpytop:hardware-observe
sudo snap connect bpytop:system-observe
sudo snap connect bpytop:process-control
sudo snap connect bpytop:physical-memory-observe


echo -e "\e[92m ---------------------------------------------------------\e[0m"
echo -e "\e[92m office tools\e[0m"
echo -e "\e[92m ---------------------------------------------------------\e[0m"

echo -e "\e[93m********** installing flameshot **********\e[0m"
sudo apt install flameshot -y

echo -e "\e[93m********** installing keepassxc **********\e[0m"
sudo apt install keepassxc -y

echo -e "\e[93m********** installing virt-manager **********\e[0m"
sudo apt install virt-manager -y


echo -e "\e[92m ---------------------------------------------------------\e[0m"
echo -e "\e[92m dev tools\e[0m"
echo -e "\e[92m ---------------------------------------------------------\e[0m"

echo -e "\e[93m********** installing VScode **********\e[0m"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code
rm packages.microsoft.gpg

echo -e "\e[93m********** installing tmux **********\e[0m"
sudo apt install tmux -y

echo -e "\e[93m********** installing vim **********\e[0m"
sudo apt install vim -y

echo -e "\e[93m********** installing git **********\e[0m"
sudo apt install git -y

echo -e "\e[93m********** installing curl **********\e[0m"
sudo apt install curl -y

echo -e "\e[93m********** installing docker **********\e[0m"
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo docker run hello-world
# post-installation steps
sudo groupadd -f docker
sudo usermod -aG docker $USER
newgrp docker <<EONG
id
EONG
docker run hello-world
sudo systemctl enable docker

echo -e "\e[93m********** installing docker compose**********\e[0m"
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version


echo -e "\e[92m ---------------------------------------------------------\e[0m"
echo -e "\e[92m Z shell/ohmyzsh \e[0m"
echo -e "\e[92m ---------------------------------------------------------\e[0m"

echo -e "\e[93m********** installing zsh **********\e[0m"
sudo apt install zsh -y

echo -e "\e[93m********** installing ohmyzsh pre-reqisits **********\e[0m"
sudo apt install fonts-powerline -y
sudo apt-get install fzf -y

echo -e "\e[93m********** installing ohmyzsh **********\e[0m"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# before this step you need to exit ohmyzsh by typing exit
echo -e "\e[93m********** adding ohmyzsh configurataion **********\e[0m"
wget -O ".zshrc" https://raw.githubusercontent.com/azeljkovic/linux_setup/main/.zshrc