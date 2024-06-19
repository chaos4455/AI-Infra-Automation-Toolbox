#!/bin/bash
# Este script configura o serviço 'docker' para o projeto 'dockerprune'.

# 1. Instalação de pacotes e configuração inicial
sudo apt update
sudo apt install docker.io docker-compose

# 2. Configuração de ambiente e variáveis de execução
sudo usermod -aG docker $USER
sudo systemctl enable docker
sudo systemctl start docker

# 3. Scripts de inicialização e tarefas cron
# Não aplicável a este caso de uso

# 4. Autenticação e permissões de acesso necessárias
# Não aplicável a este caso de uso

# 5. Configuração do serviço, instalação de dependências e comandos necessários
docker pull docker:latest
docker run --rm docker:latest docker prune --all
