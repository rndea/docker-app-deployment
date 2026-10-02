#!/bin/bash

set -e

APP_VERSION=${1:-latest}

echo "=== Updating source code ==="
cd src
git pull

echo "=== Starting Application ==="
cd ..
APP_VERSION=$APP_VERSION docker compose up -d

echo "=== Health Check ==="
curl --fail http://localhost:8087

echo "=== Deployment completed ==="
docker compose ps
