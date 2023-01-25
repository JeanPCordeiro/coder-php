DOCKER_USERNAME ?= jpcordeiro
APPLICATION_NAME ?= coder-php
APPLICATION_RELEASE ?= latest

info:

get_codercli:
	curl -L https://coder.com/install.sh | sh -s -- 	
build:
	docker build --tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:${APPLICATION_RELEASE} .

push:
	docker login -u ${DOCKER_USERNAME}
	docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}:${APPLICATION_RELEASE}
