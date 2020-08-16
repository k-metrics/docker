IMAGE := kmetrics/tidymodels
TAG := latest
DFILE := Dockerfile
PASS := # set login password
NAME := tidymodels
LDIR := # set your mount point here, full path

################################################################
# Automated build on DockerHub is disabled
# All images shoud build manually

build_all:
	docker build -t ${IMAGE}:3.6.1 -f ./3.6.1/${DFILE} ./3.6.1
	docker build -t ${IMAGE}:3.6.2 -f ./3.6.2/${DFILE} ./3.6.2
	docker build -t ${IMAGE}:3.6.3 -f ./3.6.3/${DFILE} ./3.6.3

push_all:
	docker push ${IMAGE}:3.6.1
	docker push ${IMAGE}:3.6.2
	docker push ${IMAGE}:3.6.3


################################################################
# Following commands can use TAG argument
# $ make command TAG=tag
build:
ifeq (${TAG}, latest)
	docker build -t ${IMAGE}:${TAG} -f ${DFILE} .
else
	docker build -t ${IMAGE}:${TAG} -f ./${TAG}/${DFILE} .
endif

# $ make push TAG=tag
push:
	docker push ${IMAGE}:${TAG}


################################################################
# Container management
# $ make pull TAG=tag
pull:
	docker pull ${IMAGE}:${TAG}

# $ make run TAG=tag
run:
	docker run -d -e PASSWORD=${PASS} --name=${NAME} -p 8787:8787 -v ${LDIR}:/home/rstudio/ ${IMAGE}:${TAG}

stop:
	docker stop ${NAME}
	docker rm ${NAME}
	docker ps -a
