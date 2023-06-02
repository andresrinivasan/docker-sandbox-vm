.PHONY: run image container

run: image container

image: 
	docker build -t ubuntu-vm:latest .

container:
	docker run --detach \
		-v /var/run/docker.sock:/var/run/docker.sock -v /tmp/.X11-unix:/tmp/.X11-unix \
		--name ubuntu-vm ubuntu-vm:latest
