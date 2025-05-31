# Como Distribuir o Dynamic Bounce Manager (Docker)

Este documento explica como compartilhar o Dynamic Bounce Manager dockerizado com outros usuários.

## 📦 Arquivos Necessários para Distribuição

### Arquivos Essenciais:
```
├── Dockerfile
├── requirements.txt
├── run-docker.sh
├── test-docker.sh
├── DOCKER_README.md
├── main.py
├── main_gui.py
└── src/
    ├── __init__.py
    ├── config.py
    ├── path_manager.py
    ├── monitor.py
    ├── periodic_scanner.py
    ├── handlers/
    └── utils/
```

### Arquivos Opcionais:
```
├── .dockerignore
├── DISTRIBUICAO.md (este arquivo)
└── README.md
```

## 🚀 Métodos de Distribuição

### Método 1: Pacote ZIP/TAR
1. **Criar arquivo compactado:**
   ```bash
   # Excluir arquivos desnecessários
   tar -czf dynamic-bounce-manager-docker.tar.gz \
     --exclude='.git' \
     --exclude='venv' \
     --exclude='__pycache__' \
     --exclude='*.pyc' \
     --exclude='.DS_Store' \
     --exclude='logs' \
     --exclude='config.json' \
     .
   ```

2. **Instruções para o usuário:**
   - Baixar e extrair o arquivo
   - Instalar Docker Desktop
   - Executar `./run-docker.sh`

### Método 2: Docker Hub (Recomendado)
1. **Fazer build e push da imagem:**
   ```bash
   # Build da imagem
   docker build -t seuusuario/dynamic-bounce-manager .
   
   # Push para Docker Hub
   docker push seuusuario/dynamic-bounce-manager
   ```

2. **Criar script simplificado para usuários:**
   ```bash
   #!/bin/bash
   # download-and-run.sh
   
   echo "🚀 Baixando Dynamic Bounce Manager..."
   docker pull seuusuario/dynamic-bounce-manager
   
   echo "📁 Criando diretório de configuração..."
   mkdir -p ~/.bounce-manager
   
   echo "🎵 Iniciando Dynamic Bounce Manager..."
   docker run -it --rm \
     -v /:/host \
     -v ~/.bounce-manager:/app/config \
     -v ~/.bounce-manager/logs:/app/logs \
     seuusuario/dynamic-bounce-manager
   ```

### Método 3: GitHub Releases
1. **Criar release no GitHub com:**
   - Código fonte (ZIP)
   - Instruções de instalação
   - Script de instalação automática

2. **Script de instalação automática:**
   ```bash
   #!/bin/bash
   # install.sh
   
   # Verificar se Docker está instalado
   if ! command -v docker &> /dev/null; then
       echo "❌ Docker não encontrado. Instalando Docker Desktop..."
       open "https://www.docker.com/products/docker-desktop/"
       exit 1
   fi
   
   # Baixar código fonte
   curl -L https://github.com/seuusuario/repo/archive/main.zip -o bounce-manager.zip
   unzip bounce-manager.zip
   cd bounce-manager-main
   
   # Executar
   chmod +x run-docker.sh
   ./run-docker.sh
   ```

## 📋 Instruções para Usuários Finais

### Pré-requisitos:
1. **Mac com macOS 10.14 ou superior**
2. **Docker Desktop instalado**
   - Download: https://www.docker.com/products/docker-desktop/

### Instalação Rápida:
```bash
# 1. Baixar arquivos
curl -L [URL_DO_ARQUIVO] -o bounce-manager.zip
unzip bounce-manager.zip
cd dynamic-bounce-manager

# 2. Testar instalação (opcional)
./test-docker.sh

# 3. Executar aplicação
./run-docker.sh
```

### Primeira Execução:
1. O Docker irá baixar/construir a imagem (pode demorar)
2. A interface do Dynamic Bounce Manager será exibida
3. Configure suas pastas usando o menu
4. Inicie o monitoramento

## 🔧 Personalização para Distribuição

### Modificar Configurações Padrão:
Edite `src/config.py`:
```python
# Alterar intervalo padrão de scan
DEFAULT_SCAN_INTERVAL = 30  # 30 segundos em vez de 60

# Alterar pastas padrão
def get_default_paths():
    # Suas pastas padrão aqui
    return [...]
```

### Adicionar Logo/Branding:
Modifique as mensagens em `src/config.py`:
```python
INTRO_MSG = f"""
{CYAN}╔═══════════════════════════════════════════╗{NC}
{CYAN}║     SEU NOME - BOUNCE MANAGER             ║{NC}
{CYAN}║     Version {VERSION}                         ║{NC}
{CYAN}╚═══════════════════════════════════════════╝{NC}
"""
```

## 📊 Monitoramento de Uso

### Logs para Suporte:
- Configurações: `~/.bounce-manager/config.json`
- Logs detalhados: `~/.bounce-manager/logs/bounce_file_manager.log`

### Telemetria (Opcional):
Adicione tracking básico em `src/config.py`:
```python
import requests

def send_usage_stats():
    try:
        requests.post('https://seu-servidor.com/stats', {
            'version': VERSION,
            'platform': sys.platform
        }, timeout=5)
    except:
        pass  # Falha silenciosa
```

## 🛡️ Considerações de Segurança

### Para Distribuição Pública:
1. **Remover informações pessoais** dos arquivos de configuração
2. **Validar todas as entradas** do usuário
3. **Adicionar verificações de integridade** dos arquivos
4. **Documentar claramente** as permissões necessárias

### Exemplo de Validação:
```python
def validate_path(path):
    # Não permitir paths perigosos
    dangerous_paths = ['/System', '/usr/bin', '/etc']
    if any(path.startswith(dp) for dp in dangerous_paths):
        raise ValueError(f"Path não permitido: {path}")
    return path
```

## 📞 Suporte aos Usuários

### FAQ Comum:
1. **"Docker não está rodando"** → Abrir Docker Desktop
2. **"Permissão negada"** → `chmod +x run-docker.sh`
3. **"Pasta não encontrada"** → Verificar se o caminho existe
4. **"Arquivos não são movidos"** → Verificar permissões das pastas

### Canal de Suporte:
- Email: seu-email@exemplo.com
- GitHub Issues: https://github.com/seuusuario/repo/issues
- Documentação: Link para documentação completa 