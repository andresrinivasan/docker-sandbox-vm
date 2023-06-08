.PHONY: run image container

run: image container

image: 
	docker build ${NO_CACHE} -t ubuntu-vm:latest .

container:
	docker run --detach \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--env-file ./env.list \
		--name ubuntu-vm ubuntu-vm:latest
