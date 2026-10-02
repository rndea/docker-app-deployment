#!/bin/bash

set -e

echo "=== Updating source code ==="
cd src
git pull

echo "=== Building Docker image ==="
cd ..
docker compose build

echo "=== Starting Application ==="
docker compose up -d

echo "=== Health Check ==="
curl --fail http://localhost:8087

echo "=== Deployment completed ==="
docker compose ps
