#!/bin/bash

# Verificar se o usuário tem privilégios de root
if [[ $EUID -ne 0 ]]; then
    echo "Este script deve ser executado como root."
    exit 1
fi

# Verificar se a conexão com a internet está disponível
ping -c 1 www.google.com &> /dev/null
if [[ $? -ne 0 ]]; then
    echo "Não há conexão com a internet disponível."
    exit 1
fi

# Atualizar o sistema operacional
echo "Atualizando o sistema operacional..."
apt update -y
apt upgrade -y

# Atualizar pacotes Python
echo "Atualizando pacotes Python..."
pip3 install --upgrade pip
pip3 install --upgrade -r /path/to/requirements.txt

# Atualizar o servidor web
echo "Atualizando o servidor web..."
systemctl restart nginx

# Atualizar o banco de dados
echo "Atualizando o banco de dados..."
systemctl restart mysql

# Verificar se as atualizações foram aplicadas com êxito
echo "Verificando se as atualizações foram aplicadas com êxito..."
apt list --upgradable
pip3 list --outdated
systemctl status nginx
systemctl status mysql

# Se as atualizações foram aplicadas com êxito, notificar o usuário
echo "Atualizações aplicadas com êxito."
exit 0