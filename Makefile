PROJECT_PREFIX = danyanya/
SERVICE_NAME = nginx-cors
DOCKERFILE = Dockerfile


all: build

build:
	docker build -f $(DOCKERFILE) -t $(PROJECT_PREFIX)$(SERVICE_NAME) .
run:
	docker-compose up
push:
	docker push $(PROJECT_PREFIX)$(SERVICE_NAME)
clean:
	
