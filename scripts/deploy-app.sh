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

# Replace backendApi in backendURL.jsx with EC2 IP
if [ -z "$EC2_IP" ]; then
  echo "EC2_IP variable is not set. Exiting."
  exit 1
fi

# Update backendApi in backendURL.jsx
sed -i "s|const backendApi = \"localhost\"|const backendApi = \"${EC2_IP}\"|g" $TARGET_DIR/frontendapp/src/backendURL.jsx

# Optionally, you can verify the replacement was successful
echo "Updated backendApi in backendURL.jsx to: $EC2_IP"
cat $TARGET_DIR/frontendapp/src/backendURL.jsx

# Build and run containers
docker-compose down
docker-compose build --no-cache
docker-compose up -d
