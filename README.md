# Dynamic Bounce Manager - Docker Distribution

🎵 **Sistema inteligente de organização de arquivos de áudio**

## 📦 Instalação Rápida

### Pré-requisitos
- Mac (Intel ou Apple Silicon)
- Docker Desktop instalado e rodando ([Download aqui](https://www.docker.com/products/docker-desktop/))
- Pode executar em qualquer pasta do terminal

### Método 1: Download Direto
```bash
# Baixar o script
curl -O https://raw.githubusercontent.com/caioze/bounce_manager_GUI+DOCKER/main/run-from-dockerhub.sh

# Dar permissão de execução
chmod +x run-from-dockerhub.sh

# Executar
./run-from-dockerhub.sh
```

### Método 2: Clone do Repositório
```bash
git clone https://github.com/caioze/bounce_manager_GUI+DOCKER.git
cd bounce_manager_GUI+DOCKER
chmod +x run-from-dockerhub.sh
./run-from-dockerhub.sh
```

## 🚀 Como Funciona

1. **Executa o script** - Baixa automaticamente a imagem Docker
2. **Configura pastas** - Interface amigável para configurar suas pastas de projeto
3. **Monitora automaticamente** - Move arquivos bounced para as pastas corretas
4. **Persistência** - Configurações salvas em `~/.bounce-manager`

## 📚 Documentação

- [Guia Docker Completo](DOCKER_README.md)
- [Manual de Distribuição](DISTRIBUICAO.md)

## 🐳 Docker Hub

Imagem disponível em: `caioze/dynamic-bounce-manager`

## 🆘 Suporte

Para dúvidas ou problemas, abra uma issue neste repositório.
