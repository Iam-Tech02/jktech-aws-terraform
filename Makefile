REPOSITORY_NAME = my-repository
IMAGE_TAG ?= latest

.PHONY: build push

push: build
	@./ecr.sh $(IMAGE_TAG)

build:
	docker build -t $(REPOSITORY_NAME):$(IMAGE_TAG) .
