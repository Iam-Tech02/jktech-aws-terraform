#!/bin/bash

AWS_REGION="${AWS_REGION:-us-east-1}"

AWS_ACCOUNT_ID="${AWS_ACCOUNT_ID}"

REPOSITORY_NAME="${REPOSITORY_NAME:-my-repository}"

IMAGE_TAG="${1}"

if [ -z "$IMAGE_TAG" ]; then
  echo "Error: Image tag is required."
  exit 1
fi

aws ecr get-login-password --region "$AWS_REGION" | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"

docker build -t "$REPOSITORY_NAME:$IMAGE_TAG" .

docker tag "$REPOSITORY_NAME:$IMAGE_TAG" "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPOSITORY_NAME:$IMAGE_TAG"

docker push "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPOSITORY_NAME:$IMAGE_TAG"
