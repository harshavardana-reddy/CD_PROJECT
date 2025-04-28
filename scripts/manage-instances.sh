#!/bin/bash

# Usage: ./manage-ec2.sh start|stop i-xxxxxxxxxxxxxxxxx

ACTION=$1
INSTANCE_ID=$2

if [[ -z "$ACTION" || -z "$INSTANCE_ID" ]]; then
  echo "Usage: $0 start|stop <instance-id>"
  exit 1
fi

if [[ "$ACTION" == "start" ]]; then
  echo "Starting EC2 instance $INSTANCE_ID..."
  aws ec2 start-instances --instance-ids "$INSTANCE_ID"
elif [[ "$ACTION" == "stop" ]]; then
  echo "Stopping EC2 instance $INSTANCE_ID..."
  aws ec2 stop-instances --instance-ids "$INSTANCE_ID"
else
  echo "Invalid action: $ACTION"
  echo "Use 'start' or 'stop'"
  exit 1
fi
