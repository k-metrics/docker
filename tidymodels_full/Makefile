IMAGE := kmetrics/tidymodels
TAG := full

build: 
	docker build -f Dockerfile -t ${IMAGE}:${TAG} . > tidymodels_${TAG}.log

push: 
	docker push ${IMAGE}:${TAG}
