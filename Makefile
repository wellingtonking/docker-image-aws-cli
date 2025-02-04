# Quickly put together just to get started

IMAGE ?= aws-cli
REPO ?= wkng

GIT_HASH ?= $(shell git log --format="%h" -n 1)
TAG ?= ${GIT_HASH}

build-alpine:
	docker build -f Dockerfile.alpine --tag ${REPO}/${IMAGE}:${TAG} .
	docker tag ${REPO}/${IMAGE}:${TAG} ${REPO}/${IMAGE}:3-alpine
	docker tag ${REPO}/${IMAGE}:${TAG} ${REPO}/${IMAGE}:latest

push-alpine:
	docker push ${REPO}/${IMAGE}:${TAG}
	docker push ${REPO}/${IMAGE}:3-alpine
	docker push ${REPO}/${IMAGE}:latest

build-python:
	docker build -f Dockerfile.python --tag ${REPO}/${IMAGE}:${TAG} .
	docker tag ${REPO}/${IMAGE}:${TAG} ${REPO}/${IMAGE}:3.10-slim
	docker tag ${REPO}/${IMAGE}:${TAG} ${REPO}/${IMAGE}:latest

push-python:
	docker push ${REPO}/${IMAGE}:${TAG}
	docker push ${REPO}/${IMAGE}:3.10-slim
	docker push ${REPO}/${IMAGE}:latest
