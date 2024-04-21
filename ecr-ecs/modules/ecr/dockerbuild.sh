#!/bin/bash

# Docker login
aws ecr get-login-password --region $AWS_REGION --profile $AWS_PROFILE | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# build image
docker build $DOCKERFILE_PATH -t $IMAGE_NAME

# Tag
docker tag $IMAGE_NAME:latest $REPO_URL:latest

# Push image
docker push $REPO_URL:latest