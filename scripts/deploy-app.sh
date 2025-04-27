#!/bin/bash

# Clone repository
REPO_URL="https://github.com/harshavardana-reddy/CD_PROJECT.git"
TARGET_DIR="/home/ec2-user/app"

if [ -d "$TARGET_DIR" ]; then
  cd $TARGET_DIR
  git pull origin main
else
  git clone $REPO_URL $TARGET_DIR
  cd $TARGET_DIR
fi

# Replace backend service URL with EC2 IP
if [ -z "$EC2_IP" ]; then
  echo "EC2_IP variable is not set. Exiting."
  exit 1
fi

# Update docker-compose.yaml with the EC2 IP
sed -i "s/backend:5000/${EC2_IP}:5000/g" $TARGET_DIR/docker-compose.yaml

# Optionally, you can verify the replacement was successful
echo "Updated docker-compose.yaml with backend IP: $EC2_IP"
cat $TARGET_DIR/docker-compose.yaml

# Build and run containers
docker-compose down
docker-compose build --no-cache
docker-compose up -d
