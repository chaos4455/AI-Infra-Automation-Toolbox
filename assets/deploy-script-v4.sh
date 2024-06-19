#!/bin/bash

# Constantes
readonly NUM_CONT=22
readonly IMAGES=(
  "busybox"
  "alpine"
  "nginx"
  "apache"
  "mongo"
  "redis"
  "mysql"
  "postgres"
  "zookeeper"
  "kafka"
  "elasticsearch"
  "kibana"
  "logstash"
  "fluentd"
  "graylog"
  "splunk"
  "sensu"
  "prometheus"
  "grafana"
  "influxdb"
  "telegraf"
)

# Funções
generate_random_image() {
  echo "${IMAGES[$(($RANDOM % ${#IMAGES[@]}))]}"
}

generate_random_name() {
  echo "cnt-$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 10)"
}

# Verificações
if ! command -v docker >/dev/null; then
  echo "Docker não está instalado!"
  exit 1
fi

# Criação dos contêineres
for i in $(seq 1 $NUM_CONT); do
  image=$(generate_random_image)
  name=$(generate_random_name)
  echo "Criando contêiner $name com a imagem $image..."
  docker run --rm --name "$name" "$image"
done

# Listagem dos contêineres
echo "Contêineres implantados:"
docker ps