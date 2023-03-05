# Quickly put together just to get started

IMAGE ?= aws-cli
REPO ?= wkng

GIT_HASH ?= $(shell git log --format="%h" -n 1)
TAG ?= ${GIT_HASH}

build:
	docker build -f Dockerfile.alpine --tag ${REPO}/${IMAGE}:${TAG} .

push:
	docker push ${REPO}/${IMAGE}:${TAG}
