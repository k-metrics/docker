IMAGE := kmetrics/tidymodels
TAG := latest
DFILE := Dockerfile
PASS := # set login password
NAME := tidymodels
LDIR := # set your mount point here, full path

################################################################
# Build images manually, R3.6.x only
build_all:
	docker build -t ${IMAGE}:3.6.1 -f ./3.6.1/${DFILE} ..
	docker build -t ${IMAGE}:3.6.2 -f ./3.6.2/${DFILE} ..
	docker build -t ${IMAGE}:3.6.3 -f ./3.6.3/${DFILE} ..

push_all:
	docker push ${IMAGE}:3.6.1
	docker push ${IMAGE}:3.6.2
	docker push ${IMAGE}:3.6.3


################################################################
# $ make command TAG=tag
build:
ifeq (${TAG}, latest)
	docker build -t ${IMAGE}:${TAG} -f ${DFILE} ..
else
	docker build -t ${IMAGE}:${TAG} -f ./${TAG}/${DFILE} ..
endif

# $ make push TAG=tag
push: 
	docker push ${IMAGE}:${TAG}

pull:
	docker pull ${IMAGE}:${TAG}

run:
	docker run -d -e PASSWORD=${PASS} -p 8787:8787 -v ${LDIR}:/home/rstudio/project --name ${NAME} ${IMAGE}:${TAG}

stop:
	docker stop ${NAME}
	docker rm ${NAME}
	docker ps -a

