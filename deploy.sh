#!/bin/bash

echo "=== Updating source code ==="
cd src
git pull

echo "=== Building Docker image ==="
cd ..
docker compose build

echo "=== Starting Application ==="
docker compose up -d

echo "=== Deployment completed ==="
docker compose ps
