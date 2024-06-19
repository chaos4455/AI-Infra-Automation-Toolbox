#!/bin/bash

# Etapa 1: Criar diretório para logs, se não existir
mkdir -p /var/log/ufw-hardening

# Etapa 2: Instalar o UFW, se ainda não estiver instalado
apt-get update && apt-get install -y ufw

# Etapa 3: Habilitar o UFW e definir padrão para "negar"
ufw enable
ufw default deny

# Etapa 4: Permitir acesso SSH na porta 22 para todos os endereços IP
ufw allow 22/tcp comment "SSH Access"

# Etapa 5: Desabilitar regras IPv6, se houver
ufw disable ipv6

# Etapa 6: Salvar as alterações do UFW
ufw reload

# Etapa 7: Registrar logs de hardening no arquivo /var/log/ufw-hardening/hardening.log
logger -s -t ufw-hardening "Hardening concluído" >> /var/log/ufw-hardening/hardening.log