IMAGE := kmetrics/tidymodels
TAG := latest
DFILE := Dockerfile
PASS := # set login password
NAME := tidymodels
LDIR := # set your mount point here, full path

################################################################
# Automated build on DockerHub is disabled

build_all:
	docker build -t ${IMAGE}:3.6.1 -f ./3.6.1/${DFILE} ./3.6.1
	docker build -t ${IMAGE}:3.6.2 -f ./3.6.2/${DFILE} ./3.6.2
	docker build -t ${IMAGE}:3.6.3 -f ./3.6.3/${DFILE} ./3.6.3
	docker build -t ${IMAGE}:${TAG} -f ${DFILE} .

push_all:
	docker push ${IMAGE}:3.6.1
	docker push ${IMAGE}:3.6.2
	docker push ${IMAGE}:3.6.3
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
