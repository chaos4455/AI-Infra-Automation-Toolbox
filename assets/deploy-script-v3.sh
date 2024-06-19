#!/bin/bash

# Diretório atual
DIR_ATUAL=$(pwd)

# Verifica se o comando 'docker' está instalado
if ! command -v docker >/dev/null; then
  echo "O comando 'docker' não está instalado."
  exit 1
fi

# Verifica a versão do Docker
DOCKER_VERSION=$(docker --version | cut -d',' -f1)
VERSAO_MINIMA_REQUERIDA="20.10.0"
if [[ $(semver compare "$DOCKER_VERSION" "$VERSAO_MINIMA_REQUERIDA") -lt 0 ]]; then
  echo "A versão mínima do Docker requerida é $VERSAO_MINIMA_REQUERIDA."
  echo "Sua versão atual é $DOCKER_VERSION."
  exit 1
fi

# Verifica se o usuário tem permissão para executar o 'docker prune'
if ! docker prune --help >/dev/null; then
  echo "Você não tem permissão para executar o 'docker prune'."
  exit 1
fi

# Executa o 'docker prune'
docker prune -f

# Verifica se o 'docker prune' foi executado com sucesso
if [ $? -ne 0 ]; then
  echo "O 'docker prune' não foi executado com sucesso."
  exit 1
fi

echo "O 'docker prune' foi executado com sucesso."