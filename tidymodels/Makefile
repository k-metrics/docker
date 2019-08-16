IMAGE := kmetrics/tidymodels
TAG := 3.6.1

build: 
	docker build -f Dockerfile -t ${IMAGE}:${TAG} . > tidymodels${TAG}.log

push: 
	docker push ${IMAGE}:${TAG}
	docker tag ${IMAGE}:${TAG} ${IMAGE}:latest
	docker push ${IMAGE}:latest