```shell
#!/bin/bash

# Instalação de pacotes e configuração inicial
sudo apt-get update
sudo apt-get install -y docker.io

# Configuração de ambiente e variáveis de execução
sudo systemctl start docker
sudo systemctl enable docker

# Scripts de inicialização e tarefas cron
crontab -l 2>/dev/null | grep -v 'prune' > mycron
echo "0 0 * * * docker system prune -af" >> mycron
crontab mycron
rm mycron

# Autenticação e permissões de acesso necessárias
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker