IMAGE := jupyter/datascience-notebook
TAG := latest
LDIR := 
NAME := jupyter_notebook
SHA1 := 
# DFILE := Dockerfile.full

pull:
	docker pull ${IMAGE}:${TAG}

#build:
#	docker build -t ${IMAGE}:${TAG} -f ${DFILE} .

#push:
#	docker push ${IMAGE}:${TAG}

run:
	docker run -d -p 8888:8888 --name ${NAME} -v ${LDIR}:/home/jovyan ${IMAGE}:${TAG} start-notebook.sh --NotebookApp.password=${SHA1}

stop:
	docker stop ${NAME}
#	docker rm ${NAME}
	docker ps -a