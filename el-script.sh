#!/bin/bash

# 1: Actualizar el sistema e instalar Curl
echo "Actualizando y preparando..."
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl

# 2: Instalar Docker
echo "Instalando Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# 3: Iniciar Docker service y hacer que se ejecuté al inicio
echo "Iniciando el Docker y haciendo que se ejecute al inicio..."
sudo systemctl start docker
sudo systemctl enable docker

# 4: Instalar Docker Compose
echo "Instalando Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# 5: Instalar TeamSpeak Server usando Docker
echo "Instalando TeamSpeak..."
sudo docker pull teamspeak

echo "Listo! :D"
sudo
# 6: Iniciar TeamSpeak
echo "Iniciando TeamSpeak..."
sudo docker run -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -e TS3SERVER_LICENSE=accept --restart=always teamspeak