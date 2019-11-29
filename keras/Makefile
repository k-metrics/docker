IMAGE := kmetrics/keras
TAG := latest
DFILE := Dockerfile.full

pull:
	docker pull ${IMAGE}:3.6.1

build:
	docker build -t ${IMAGE}:${TAG} -f ${DFILE} .

push:
	docker push ${IMAGE}:${TAG}