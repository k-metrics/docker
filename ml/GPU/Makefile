IMAGE := kmetrics/ml-gpu
TAG := latest
DFILE := Dockerfile.full

pull:
	docker pull ${IMAGE}:3.6.0

build:
	docker build -t ${IMAGE}:${TAG} -f ${DFILE} .

push:
	docker push ${IMAGE}:${TAG}