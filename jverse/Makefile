IMAGE := kmetrics/jverse
TAG := latest
LDIR := 
NAME := jverse
DFILE := Dockerfile
PASS := 
################################################################
# Build all images manually
build_all:
	docker build -t ${IMAGE}:3.6.1 -f ./3.6.1/${DFILE} ..
	docker build -t ${IMAGE}:3.6.2 -f ./3.6.2/${DFILE} ..
	docker build -t ${IMAGE}:3.6.3 -f ./3.6.3/${DFILE} ..
	docker build -t ${IMAGE}:4.0.0 -f ./4.0.0/${DFILE} ..
	docker build -t ${IMAGE}:4.0.1 -f ./4.0.1/${DFILE} ..
	docker build -t ${IMAGE}:4.0.2 -f ./4.0.2/${DFILE} ..
	docker build -t ${IMAGE}:4.0.3 -f ./4.0.3/${DFILE} ..
	docker build -t ${IMAGE}:${TAG} -f ${DFILE} ..

push_all:
	docker push ${IMAGE}:3.6.1
	docker push ${IMAGE}:3.6.2
	docker push ${IMAGE}:3.6.3
	docker push ${IMAGE}:4.0.0
	docker push ${IMAGE}:4.0.1
	docker push ${IMAGE}:4.0.2
	docker push ${IMAGE}:4.0.3
	docker push ${IMAGE}:${TAG}


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
	docker run -d -e PASSWORD=${PASS} -p 8787:8787 -v ${LDIR}:/home/rstudio/R/project --name ${NAME} ${IMAGE}:${TAG}

stop:
	docker stop ${NAME}
	docker rm ${NAME}
	docker ps -a
