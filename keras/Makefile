IMAGE := kmetrics/keras
TAG := latest
DFILE := Dockerfile.full
LDIR := /C/
PASS := docker

pull:
	docker pull ${IMAGE}:3.6.1

build:
	docker build -t ${IMAGE}:${TAG} -f ${DFILE} .

push:
	docker push ${IMAGE}:${TAG}

run:
	docker run -d -p 8787:8787 -v ${LDIR}:/home/rstudio/ -e PASSWORD=${PASS} ${IMAGE}:${TAG}