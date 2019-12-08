IMAGE := kmetrics/jverse
TAG := latest
LDIR := 
NAME := jverse
DFILE := Dockerfile
PASS := 

build:
	docker build -t ${IMAGE}:${TAG} -f ${DFILE} .

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
