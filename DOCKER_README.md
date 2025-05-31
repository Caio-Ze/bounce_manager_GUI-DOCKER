# Dynamic Bounce Manager - Docker Version

Este guia explica como usar o Dynamic Bounce Manager em qualquer Mac usando Docker.

## 📋 Pré-requisitos

1. **Docker Desktop** instalado no Mac
   - Download: https://www.docker.com/products/docker-desktop/
   - Certifique-se que o Docker está rodando (ícone na barra de menu)

## 🚀 Como Usar

### Método 1: Script Automático (Recomendado)

1. **Baixe os arquivos do projeto** para qualquer pasta no seu Mac

2. **Execute o script de lançamento:**
   ```bash
   ./run-docker.sh
   ```

3. **O script irá automaticamente:**
   - Verificar se o Docker está rodando
   - Construir a imagem (primeira vez)
   - Iniciar o container
   - Abrir a interface do Dynamic Bounce Manager

### Método 2: Comando Docker Manual

```bash
# Construir a imagem (primeira vez)
docker build -t dynamic-bounce-manager .

# Executar o container
docker run -it \
  --name bounce-manager \
  --rm \
  -v /:/host \
  -v ~/.bounce-manager:/app/config \
  -v ~/.bounce-manager/logs:/app/logs \
  dynamic-bounce-manager
```

## 📁 Configuração de Pastas

### Como Funciona
- O container tem acesso a **todo o sistema de arquivos** do seu Mac
- Você configura as pastas através da interface normal do programa
- As configurações são salvas em `~/.bounce-manager/config.json`

### Exemplo de Configuração
Quando o programa perguntar pelas pastas, você pode usar caminhos normais do Mac:

**Pasta de Origem (onde estão os projetos):**
```
/Users/seuusuario/Music/Logic Pro X
```

**Pasta de Destino (onde salvar os bounces):**
```
/Users/seuusuario/Music/Bounced Files
```

## 🔧 Funcionalidades

### Interface Idêntica
- Menu interativo igual à versão nativa
- Todas as opções funcionam normalmente:
  1. Start/Stop Monitoring
  2. List Configured Folder Pairs
  3. Add Folder Pair
  4. Remove Folder Pair
  5. Clear All Configurations
  6. Open Config File
  7. Exit Program

### Monitoramento Automático
- Detecta automaticamente arquivos em pastas "Bounced Files"
- Move arquivos para as pastas de destino configuradas
- Exibe progresso em tempo real
- Logs detalhados salvos em `~/.bounce-manager/logs/`

## 📂 Estrutura de Arquivos

```
~/.bounce-manager/           # Pasta de configuração
├── config.json            # Configurações das pastas
└── logs/                   # Logs do sistema
    └── bounce_file_manager.log
```

## 🛑 Como Parar

### Durante o Monitoramento:
- **Ctrl+C** - Para e sai
- **Digite 'q' ou 'exit'** - Para e volta ao menu

### No Menu Principal:
- **Opção 7** - Exit Program

## 🔄 Atualizações

Para atualizar para uma nova versão:

1. **Baixe os novos arquivos**
2. **Remova a imagem antiga:**
   ```bash
   docker rmi dynamic-bounce-manager
   ```
3. **Execute novamente:**
   ```bash
   ./run-docker.sh
   ```

## 🐛 Solução de Problemas

### Docker não está rodando
```
❌ Docker is not running. Please start Docker Desktop and try again.
```
**Solução:** Abra o Docker Desktop e aguarde inicializar.

### Permissões de arquivo
Se houver problemas de permissão:
```bash
chmod +x run-docker.sh
```

### Container já existe
O script automaticamente para e remove containers existentes.

### Logs para debug
Verifique os logs em:
```
~/.bounce-manager/logs/bounce_file_manager.log
```

## 💡 Dicas

1. **Primeira execução** demora mais (construção da imagem)
2. **Configurações persistem** entre execuções
3. **Logs são mantidos** para auditoria
4. **Funciona offline** após primeira construção
5. **Não interfere** com outras instalações Python

## 🔒 Segurança

- Container tem acesso ao sistema de arquivos (necessário para monitorar pastas)
- Apenas **move** arquivos (não deleta)
- Configurações ficam isoladas em `~/.bounce-manager/`
- Logs detalhados para auditoria

## 📞 Suporte

Se encontrar problemas:
1. Verifique os logs em `~/.bounce-manager/logs/`
2. Certifique-se que o Docker Desktop está rodando
3. Verifique se as pastas configuradas existem e têm permissão de escrita 