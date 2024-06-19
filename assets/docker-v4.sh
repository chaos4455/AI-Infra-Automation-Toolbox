#!/bin/bash

# Verifica se o comando `docker` está disponível
if ! command -v docker &> /dev/null; then
    echo "Erro: O comando 'docker' não está instalado."
    exit 1
fi

# Executa o comando `docker prune` para remover contêineres, imagens e redes inativas
docker prune

# Verifica se o comando foi executado com sucesso
if [ $? -ne 0 ]; then
    echo "Erro: O comando 'docker prune' falhou."
    exit 1
fi

echo "Contêineres, imagens e redes inativas foram removidos com sucesso."