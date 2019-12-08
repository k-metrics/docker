IMAGE := kmetrics/jupyter
TAG := latest
LDIR := 
NAME := jupyter_notebook
DFILE := Dockerfile
SHA1 := 

# for Local Buikd #########################################
build:
	docker build -t ${IMAGE}:${TAG} -f ${DFILE} .

push:
	docker push ${IMAGE}:${TAG}

# for RUN #################################################
pull:
	docker pull ${IMAGE}:${TAG}

run:
	# docker run -d -p 8888:8888 --name ${NAME} -v ${LDIR}:/home/jovyan/work ${IMAGE}:${TAG} start-notebook.sh --NotebookApp.password=${SHA1}
	docker run -p 8888:8888 --name ${NAME} -v ${LDIR}:/home/jovyan/work ${IMAGE}:${TAG} 

stop:
	docker stop ${NAME}
	docker rm ${NAME}
	docker ps -a
