# Basic go commands
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get

# Binary names
BINARY_NAME=humblebooks
BINARY_UNIX=$(BINARY_NAME)_windows

all: build

build:
	#$(GOBUILD) -o $(BINARY_NAME) -v hello.go
	docker build -t mw-go-1 .
	kubectl create -f mw-go-1-deploy.yaml
clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)