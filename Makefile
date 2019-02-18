docker_registry = 589401011586.dkr.ecr.eu-central-1.amazonaws.com
name = base
tag = 0.0.9

.PHONY: build

all: build

build:
	docker build -t $(docker_registry)/$(name) .
	docker tag $(docker_registry)/$(name) $(docker_registry)/$(name):$(tag)

run:
	docker run -it $(docker_registry)/$(name) bash -l

push:
	docker push $(docker_registry)/$(name)
