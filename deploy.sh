#!/bin/bash

set -e

APP_VERSION=${1:-latest}

echo "=== Starting Application ==="
APP_VERSION=$APP_VERSION docker compose up -d

echo "=== Health Check ==="
curl --fail http://localhost:8087

echo "=== Deployment completed ==="
docker compose ps
