#!/bin/bash

# Diretórios e arquivos
BACKUP_DIR="/backups"
DOCKER_COMPOSE_FILE="docker-compose.yml"
DOCKER_COMPOSE_UP_CMD="docker-compose up -d"

# Verifica se o diretório de backup existe
if [ ! -d "$BACKUP_DIR" ]; then
    # Cria o diretório de backup
    mkdir -p "$BACKUP_DIR"
fi

# Gera o backup dos containers
docker-compose exec db mysqldump --all-databases > "$BACKUP_DIR/db_backup.sql"

# Gera o backup dos volumes
docker-compose exec db tar -cvf "$BACKUP_DIR/volume_backup.tar" /var/lib/mysql

# Gera o backup do arquivo docker-compose.yml
cp "$DOCKER_COMPOSE_FILE" "$BACKUP_DIR/docker-compose.yml.bkp"

# Executa o comando docker-compose up -d
eval "$DOCKER_COMPOSE_UP_CMD"

# Verifica se o backup foi gerado com sucesso
if [ -f "$BACKUP_DIR/db_backup.sql" ] && [ -f "$BACKUP_DIR/volume_backup.tar" ] && [ -f "$BACKUP_DIR/docker-compose.yml.bkp" ]; then
    echo "Backup gerado com sucesso em $BACKUP_DIR"
else
    echo "Falha ao gerar o backup"
fi