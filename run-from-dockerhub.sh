#!/bin/bash

# Dynamic Bounce Manager - Run from Docker Hub
# Execute este script em qualquer Mac com Docker Desktop

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Configuração - ALTERE AQUI SEU USUÁRIO DO DOCKER HUB
DOCKER_USER="caioze"  # ← ALTERE AQUI
IMAGE_NAME="$DOCKER_USER/dynamic-bounce-manager"
CONFIG_DIR="$HOME/.bounce-manager"

echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${NC}                                                              ${CYAN}║${NC}"
echo -e "${CYAN}║${NC}  ${GREEN}DYNAMIC BOUNCE MANAGER - FROM DOCKER HUB${NC}                ${CYAN}║${NC}"
echo -e "${CYAN}║${NC}                                                              ${CYAN}║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"

# Verificar se Docker está rodando
if ! docker info >/dev/null 2>&1; then
    echo -e "${RED}❌ Docker Desktop não está rodando.${NC}"
    echo -e "${YELLOW}Por favor, abra o Docker Desktop e tente novamente.${NC}"
    exit 1
fi

# Criar diretório de configuração
if [ ! -d "$CONFIG_DIR" ]; then
    echo -e "${BLUE}📁 Criando diretório de configuração...${NC}"
    mkdir -p "$CONFIG_DIR"
fi

echo -e "${BLUE}🚀 Baixando e executando Dynamic Bounce Manager...${NC}"
echo -e "${CYAN}📂 Configurações serão salvas em: $CONFIG_DIR${NC}"
echo -e "${YELLOW}💡 Dica: Use caminhos completos ao adicionar pastas (ex: /Users/seuusuario/Documents)${NC}"
echo ""

# Executar o container com montagem correta para macOS
docker run -it --rm \
    --name bounce-manager \
    -v "$HOME":/host/Users/$(whoami) \
    -v "$CONFIG_DIR":/app/config \
    -v "$CONFIG_DIR/logs":/app/logs \
    -e TERM=xterm-256color \
    "$IMAGE_NAME"

echo -e "${GREEN}👋 Dynamic Bounce Manager finalizado.${NC}" 