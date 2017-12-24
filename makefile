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
	#docker run --rm  --name testapp-hellogo humblebooks
	#docker ps
  
  #// expands to: "go build -o mybinary -v"

run:
	$(GOBUILD) -o $(BINARY_NAME) -v ./...
	./$(BINARY_NAME)

# I need to grok go tests first
# test:
#   $(GOTEST) -v ./...

# No dependencies yet
# deps:
        # $(GOGET) github.com/markbates/goth
        # $(GOGET) github.com/markbates/pop


clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)