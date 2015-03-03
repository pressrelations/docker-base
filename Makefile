docker_registry = dory.pressrelations.de:5000
name = base
tag = 0.0.6

.PHONY: build

all: build

build:
	docker build -t $(docker_registry)/$(name) .
	docker tag $(docker_registry)/$(name) $(docker_registry)/$(name):$(tag)

run:
	docker run -it $(docker_registry)/$(name) bash -l

push:
	docker push $(docker_registry)/$(name)
