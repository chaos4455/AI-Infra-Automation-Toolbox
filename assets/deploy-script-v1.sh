#!/bin/bash

# Verificar se o diretório de destino existe
if [ ! -d "/backup" ]; then
  mkdir /backup
fi

# Obter a data e hora atuais
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")

# Criar um arquivo tar compactado com todos os arquivos da raiz e subdiretórios
tar -cvzf /backup/backup-$TIMESTAMP.tar.gz /

# Exibir uma mensagem de sucesso
echo "Backup concluído com sucesso em /backup/backup-$TIMESTAMP.tar.gz"