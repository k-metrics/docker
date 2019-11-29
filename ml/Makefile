IMAGE := kmetrics/ml
TAG := latest
DFILE := Dockerfile

pull:
	docker pull ${IMAGE}:3.6.0

build:
	docker build -t ${IMAGE}:${TAG} -f ${DFILE} .

push:
	docker push ${IMAGE}:${TAG}