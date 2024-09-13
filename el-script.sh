#!/bin/bash

# Step 1: Actualizar el sistema e instalar Curl
echo "Actualizando y preparando..."
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl

# Step 2: Instalar Docker
echo "Instalando Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Iniciar Docker service y hacer que se ejecuté al inicio
echo "Iniciando el Docker y haciendo que se ejecute al inicio..."
sudo systemctl start docker
sudo systemctl enable docker

# Step 3: Instalar Docker Compose
echo "Instalando Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Step 4: Install TeamSpeak server using Docker
echo "Instalando TeamSpeak..."
sudo docker pull teamspeak

echo "Listo! :D"
