#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "Usage: ./deploy.sh <aws-account-id> [region]"
    echo "Example: ./deploy.sh 123456789012 us-east-1"
    exit 1
fi

ACCOUNT_ID=$1
REGION=${2:-us-east-1}
PROJECT_NAME=${3:-mcp-server}
ENVIRONMENT=${4:-dev}

ECR_REPO="${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${PROJECT_NAME}-${ENVIRONMENT}"

echo "Logging in to ECR..."
aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com

echo "Building Docker image..."
docker build -t ${PROJECT_NAME}:latest .

echo "Tagging image..."
docker tag ${PROJECT_NAME}:latest ${ECR_REPO}:latest

echo "Pushing image to ECR..."
docker push ${ECR_REPO}:latest

echo "Deployment complete!"
echo "ECR Image: ${ECR_REPO}:latest"
