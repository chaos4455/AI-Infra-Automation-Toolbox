ell
#!/bin/bash

# Remover contêineres parados
docker rm $(docker ps -a -q -f status=exited)

# Remover imagens não utilizadas
docker rmi $(docker images -a -q -f dangling=true)

# Remover volumes órfãos
docker volume rm $(docker volume ls -f dangling=true -q)

# Remover redes órfãs
docker network rm $(docker network ls -f scope=local -q)

# Remover data build
docker build prune -a

# Limpar caches
docker system prune --all --force