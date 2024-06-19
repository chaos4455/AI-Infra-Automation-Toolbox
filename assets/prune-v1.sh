#!/bin/bash

# Instalação de pacotes e configuração inicial

apt-get update
apt-get install -y docker-compose

# Configuração de ambiente e variáveis de execução

export DOCKER_HOST=tcp://0.0.0.0:2375
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=/etc/docker/certs.d

# Scripts de inicialização e tarefas cron

cat > /etc/cron.d/docker-prune <<EOF
@daily root docker prune -f
EOF

# Autenticação e permissões de acesso necessárias

mkdir -p /etc/docker/certs.d
chmod -R 700 /etc/docker/certs.d

# Reinicialização do Docker

systemctl restart docker

# Verificação do serviço

docker prune -f

echo "Serviço 'prune' configurado com sucesso."
