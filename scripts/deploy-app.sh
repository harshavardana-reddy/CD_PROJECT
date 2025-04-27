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

# Build and run containers
docker-compose down
docker-compose build --no-cache
docker-compose up -d