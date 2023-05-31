.PHONY: run image container

run: image container

image: 
	docker build -t ubuntu-vm:latest .

container:
	docker run --detach --name ubuntu-vm ubuntu-vm:latest
