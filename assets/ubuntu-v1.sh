#!/bin/bash

# Diretório raiz
ROOT_DIR="/home/$USER"

# Nome base do arquivo de backup
BACKUP_NAME="backup-root"

# Gerar carimbo de data e hora
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

# Criar diretório de backup (se não existir)
mkdir -p ~/Backup

# Caminho completo do arquivo de backup
BACKUP_FILE="~/Backup/$BACKUP_NAME-$TIMESTAMP.tar.gz"

# Criar arquivo de backup
tar -czvf "$BACKUP_FILE" "$ROOT_DIR"

# Verificar se o arquivo de backup foi criado com sucesso
if [ $? -eq 0 ]; then
  echo "Backup criado com sucesso: $BACKUP_FILE"
else
  echo "Falha ao criar o backup!"
  exit 1
fi