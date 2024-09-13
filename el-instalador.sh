#!/bin/bash

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # Sin color

# Separador
separator() {
    echo -e "${BLUE}--------------------------------------------------${NC}"
}

# Función para mostrar mensajes
message() {
    echo -e "${YELLOW}$1${NC}"
}

# Función para verificar si un comando fue exitoso
check_success() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}$1 completado exitosamente!${NC}"
    else
        echo -e "${RED}Error al completar $1.${NC}"
        exit 1
    fi
}

# 1: Actualizar el sistema e instalar Curl
separator
message "Paso 1: Actualizando sistema e instalando Curl..."
separator

sudo apt update -y && sudo apt upgrade -y
check_success "Actualización del sistema"

sudo apt install -y curl
check_success "Instalación de Curl"

# 2: Instalar Docker
separator
message "Paso 2: Instalando Docker..."
separator

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
check_success "Instalación de Docker"

# 3: Iniciar Docker y habilitarlo en el arranque
separator
message "Paso 3: Iniciando Docker y configurando su ejecución al inicio..."
separator

sudo systemctl start docker
sudo systemctl enable docker
check_success "Configuración de Docker"

# 4: Instalar Docker Compose
separator
message "Paso 4: Instalando Docker Compose..."
separator

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
check_success "Instalación de Docker Compose"

# 5: Instalar TeamSpeak Server usando Docker
separator
message "Paso 5: Instalando TeamSpeak Server..."
separator

sudo docker pull teamspeak
check_success "Descarga de la imagen de TeamSpeak"

# 6: Iniciar TeamSpeak
separator
message "Paso 6: Iniciando TeamSpeak Server..."
separator

sudo docker run -d -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -e TS3SERVER_LICENSE=accept --restart=always teamspeak
check_success "Ejecución de TeamSpeak"

separator
echo -e "${GREEN}Todo listo! :D${NC}"
separator
