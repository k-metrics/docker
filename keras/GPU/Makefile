IMAGE := kmetrics/keras-gpu
TAG := latest
DFILE := Dockerfile

pull:
	docker pull ${IMAGE}:${TAG}

build:
	docker build -t ${IMAGE}:3.6.0 -f ${DFILE} .

build_local:
	docker build -t ${IMAGE}:${TAG} -f ${DFILE}.full .

push:
	docker push ${IMAGE}:${TAG}
