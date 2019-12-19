BIMAGE := kmetrics/mlwr
IMAGE := kmetrics/tidymodels
BTAG := latest
TAG := latest
DFILE := Dockerfile
PASS := # set login password
NAME := tidymodels
LDIR := # set your mount point here, full path

################################################################
# Same as automated building on DockerHub
# pull_base:
# 	docker pull ${BIMAGE}:${BTAG}

build_base:
	docker build -t ${IMAGE}:${BTAG} -f ${DFILE} .

push_base:
	docker push ${IMAGE}:${BTAG}

################################################################
# for local building
build:
	docker build -t ${IMAGE}:${TAG} -f ./local/${DFILE} .

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
