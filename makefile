# Basic go commands
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get

# Binary names
BINARY_NAME=humblebooks

DOCKER_CONTAINER=mw-go-1
DEPLOY_NAME=mw-go-1-deploy
DEPLOY_YAML=mw-go-1-deploy.yaml
DEPLOY_NAMESPACE=madwater-rd
IMAGE_TAG=v2

all: dockerize deploy-dev

build:
	#$(GOBUILD) -o $(BINARY_NAME) -v hello.go	

dockerize:
	docker build -t $(DOCKER_CONTAINER):$(IMAGE_TAG) .

deploy-dev:
	- kubectl delete deploy $(DEPLOY_NAME) --namespace $(DEPLOY_NAMESPACE)
	kubectl create -f $(DEPLOY_YAML) --namespace $(DEPLOY_NAMESPACE)

clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)