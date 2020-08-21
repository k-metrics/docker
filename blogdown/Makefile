IMAGE := kmetrics/blogdown
TAG := latest
DFILE := Dockerfile
PASS := # set login password
NAME := blogdown
LDIR := # set your mount point here, full path

################################################################
# Same as automated building on DockerHub
# pull_base:
# 	docker pull ${BIMAGE}:${BTAG}

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
pull:
	docker pull ${IMAGE}:${TAG}

run:
	docker run -d -e PASSWORD=${PASS} --name=${NAME} -p 8787:8787 -v ${LDIR}:/home/rstudio/ ${IMAGE}:${TAG}

stop:
	docker stop ${NAME}
	docker rm ${NAME}
	docker ps -a
