#!/bin/bash

# Verifica se o ufw está habilitado
if ! ufw status | grep "Status: active" &> /dev/null; then
  echo "O UFW não está habilitado. Habilitando..."
  sudo ufw enable
fi

# Abre todas as portas do Docker no UFW
sudo ufw allow 2375/tcp  # Porta do Docker Swarm
sudo ufw allow 2376/tcp  # Porta do Docker Swarm
sudo ufw allow 7946/tcp  # Porta do Docker Swarm
sudo ufw allow 4789/tcp  # Porta do Docker Swarm (modo overlay)
sudo ufw allow 2377/tcp  # Porta do Docker Swarm (modo overlay)

# Libera as portas padrão do Docker
sudo ufw allow 2375/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 22/tcp
sudo ufw allow 53/tcp
sudo ufw allow 8080/tcp

# Libera portas adicionais se fornecidas como argumentos
for port in "$@"; do
  sudo ufw allow "$port"/tcp
done

# Recarrega o UFW
sudo ufw reload

echo "As portas do Docker foram liberadas no UFW."