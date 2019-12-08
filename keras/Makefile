IMAGE := kmetrics/keras
TAG := latest
DFILE := Dockerfile
LDIR := 
PASS := docker

pull:
	docker pull ${IMAGE}:3.6.1

build:
	docker build -t ${IMAGE}:3.6.1 -f ${DFILE} .

build_local:
	docker build -t ${IMAGE}:${TAG} -f ${DFILE}.full .

push:
	docker push ${IMAGE}:${TAG}

run:
	docker run -d -p 8787:8787 -v ${LDIR}:/home/rstudio/ -e PASSWORD=${PASS} ${IMAGE}:${TAG}
