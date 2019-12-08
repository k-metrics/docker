IMAGE := kmetrics/tidymodels
TAG := latest
LDIR := 
NAME := tidymodels
DFILE := Dockerfile
PASS := 

# for Local Build #########################################
build:
	docker build -t ${IMAGE}:3.6.1 -f ${DFILE} .

build_local:
	docker build -t ${IMAGE}:${TAG} -f ${DFILE}.full .

push:
	docker push ${IMAGE}:${TAG}

# for RUN #################################################
pull:
	docker pull ${IMAGE}:${TAG}

run:
	docker run -d -e PASSWORD=${PASS} -p 8787:8787 -v ${LDIR}:/home/rstudio --name ${NAME} ${IMAGE}:${TAG}

stop:
	docker stop ${NAME}
	docker rm ${NAME}
	docker ps -a