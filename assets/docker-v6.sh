#!/bin/bash

# Defina as variáveis necessárias
DOCKER_IMAGES=$(docker images -q)
DOCKER_CONTAINERS=$(docker ps -a -q)
DOCKER_VOLUMES=$(docker volume ls -q)
DOCKER_NETWORKS=$(docker network ls -q)

# Remova as imagens não utilizadas
if [ ! -z "$DOCKER_IMAGES" ]; then
  echo "Removendo imagens não utilizadas..."
  docker rmi $DOCKER_IMAGES
fi

# Remova os contêineres não utilizados
if [ ! -z "$DOCKER_CONTAINERS" ]; then
  echo "Removendo contêineres não utilizados..."
  docker rm $DOCKER_CONTAINERS
fi

# Remova os volumes não utilizados
if [ ! -z "$DOCKER_VOLUMES" ]; then
  echo "Removendo volumes não utilizados..."
  docker volume rm $DOCKER_VOLUMES
fi

# Remova as redes não utilizadas
if [ ! -z "$DOCKER_NETWORKS" ]; then
  echo "Removendo redes não utilizadas..."
  docker network rm $DOCKER_NETWORKS
fi

# Reinicie o serviço docker para aplicar as alterações
echo "Reiniciando o serviço docker..."
systemctl restart docker

echo "Limpeza concluída!"