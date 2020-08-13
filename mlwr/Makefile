IMAGE := kmetrics/mlwr
TAG := latest
LDIR := 
NAME := mlwr
DFILE := Dockerfile
PASS := 

################################################################
# Build all images manually
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
# $ make command TAG=tag
build:
ifeq (${TAG}, latest)
	docker build -t ${IMAGE}:${TAG} -f ${DFILE} .
else
	docker build -t ${IMAGE}:${TAG} -f ./${TAG}/${DFILE} .
endif

push: 
	docker push ${IMAGE}:${TAG}

pull:
	docker pull ${IMAGE}:${TAG}

run:
	docker run -d -e PASSWORD=${PASS} -p 8787:8787 -v ${LDIR}:/home/rstudio --name ${NAME} ${IMAGE}:${TAG}

stop:
	docker stop ${NAME}
	docker rm ${NAME}
	docker ps -a
