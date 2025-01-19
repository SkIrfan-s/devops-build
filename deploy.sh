#!/bin/bash
echo "Deploying Docker images..."
docker-compose up -d
if [ $? -eq 0 ]; then
  echo "Docker images deployed successfully."
else
  echo "Failed to deploy Docker images."
  exit 1
fi

