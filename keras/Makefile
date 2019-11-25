IMAGE := kmetrics/keras
TAG := latest

build:
  docker build -t ${IMAGE}:${TAG} -f Dockerfile.full .

push:
  docker push ${IMAGE}:${TAG}