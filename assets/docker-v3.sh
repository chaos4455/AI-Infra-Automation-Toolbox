#!/bin/bash

# Step 1: Check if docker is installed
if ! command -v docker &> /dev/null; then
  echo "Docker is not installed. Please install Docker before continuing."
  exit 1
fi

# Step 2: Define a function to prune all containers
prune_containers() {
  echo "Pruning all stopped containers..."
  docker container prune -f
}

# Step 3: Define a function to prune all images
prune_images() {
  echo "Pruning all dangling images..."
  docker image prune -f
}

# Step 4: Define a function to prune all volumes
prune_volumes() {
  echo "Pruning all unused volumes..."
  docker volume prune -f
}

# Step 5: Define a function to prune all networks
prune_networks() {
  echo "Pruning all unused networks..."
  docker network prune -f
}

# Step 6: Execute all the prune functions
prune_containers
prune_images
prune_volumes
prune_networks

echo "All Docker resources have been pruned successfully."
