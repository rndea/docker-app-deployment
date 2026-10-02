#!/bin/bash

set -e

APP_VERSION=${1:-latest}

echo "=== Starting Application ==="
APP_VERSION=$APP_VERSION docker compose up -d

echo "=== Health Check ==="
for i in {1..10}; do
	if curl --fail --silent http://localhost:8087; then
		echo
		break
	fi

	echo "Waiting for application..."
	sleep 2
done

if [ "$HEALTHY" = false ]; then
	echo "Health check failed!"
	exit1
fi

echo "=== Deployment completed ==="
docker compose ps
