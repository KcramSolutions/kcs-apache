TAG=latest

IMAGE_NAME=kcramsolutions/apache

PLATFORMS=linux/amd64,linux/arm64

BUILD_CMD=sudo docker buildx build --platform $(PLATFORMS) -t $(IMAGE_NAME):$(TAG)

build:
	@echo "Starting building $(IMAGE_NAME):$(TAG) for $(PLATFORMS)"
	$(BUILD_CMD) .

build-push:
	@echo "Starting building and pushing the image $(IMAGE_NAME):$(TAG) for $(PLATFORMS)"
	$(BUILD_CMD) --push .

prune:
	@echo "Cleaning non uses images"
	docker system prune -f

inspect:
	docker manifest inspect $(IMAGE_NAME):$(TAG)

clean:
	@echo "Removing image at $(TAG) from the system"
	docker rmi $(IMAGE_NAME):$(TAG) || true


.PHONY: build clean prune inspect build-push 
