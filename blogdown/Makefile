IMAGE := kmetrics/blogdown
TAG := full

build:
  docker build -f Dockerfile.full -t ${IMAGE}:${TAG} .

push: 
  docker push ${IMAGE}:${TAG}