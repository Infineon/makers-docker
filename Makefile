
CONTAINER_TAG=v0.0.3
TEST_CONTAINER_TAG=test

WORKFLOW_TEST_TAG=v0.0.3


# store github password safely in local password file with owner only access !
build-docker-login:
	cat ~/.secrets/DOCKERHUB_PASSWORD | docker login -u ifxmakers --password-stdin


# building the docker image from file Dockerfile using the github project sources of install scripts in the main branch
build-local-docker-container: build-docker-login
	docker build -t makers-docker:$(CONTAINER_TAG) -t makers-docker:latest -f Dockerfile docker 2>&1 | tee docker_gen.log
	docker image tag makers-docker:$(CONTAINER_TAG) ifxmakers/makers-docker:$(CONTAINER_TAG) 2>&1 | tee -a docker_gen.log
	docker image tag makers-docker:latest ifxmakers/makers-docker:latest 2>&1 | tee -a docker_gen.log
	docker image push ifxmakers/makers-docker:$(CONTAINER_TAG) 2>&1 | tee -a docker_gen.log


# building the docker image from file Dockerfile.test using the local sources of install scripts
build-test-docker-container: build-docker-login
	docker build -t makers-docker:$(TEST_CONTAINER_TAG) -f Dockerfile.test . 2>&1 | tee -a docker_test_gen.log
	docker image tag makers-docker:$(TEST_CONTAINER_TAG) ifxmakers/makers-docker:$(TEST_CONTAINER_TAG) 2>&1 | tee -a docker_test_gen.log
	docker image push ifxmakers/makers-docker:$(TEST_CONTAINER_TAG) 2>&1 | tee -a docker_test_gen.log


# build the image with tag "push" from github source branch "test_push" - if there are changes in the Dockerfile or the bin or .github/workflows directory
test-workflow: build-docker-login
# git push --delete origin $(WORKFLOW_TEST_TAG)
# git tag -d $(WORKFLOW_TEST_TAG)
	git add Dockerfile .github/workflows/* bin/*
	git commit -m "Updates of workflow and docker input files."
	git tag -a -m "Release $(WORKFLOW_TEST_TAG) tag." $(WORKFLOW_TEST_TAG)
	git push --follow-tags


##############################################################################################################################################################
#TAG=push
#TAG=latest
TAG=test

#DOCKER_REGISTRY=dockerregistry-v2.vih.infineon.com/ifxmakers/makers-docker:$(TAG)
DOCKER_REGISTRY=ifxmakers/makers-docker:$(TAG)
GHCR_REGISTRY=ghcr.io/infineon/makers-docker:$(TAG)

REGISTRY=$(DOCKER_REGISTRY)
# REGISTRY=$(GHCR_REGISTRY)


### Setting DOCKER variable to empty string => containers not used
### Setting DOCKER variable to "docker run ..." => containers used
DOCKER=
DOCKER=docker run --rm -it --privileged $(DEVICES) -v $(PWD):/myLocalWorkingDir:rw -v /opt/makers-hil:/opt/makers-hil:ro -v /opt/hil:/opt/hil:ro -w /myLocalWorkingDir $(REGISTRY)


pull-container:
	docker pull $(REGISTRY)


run-container-bash: pull-container
	$(DOCKER) bash
