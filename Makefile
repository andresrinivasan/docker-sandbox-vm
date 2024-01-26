ARM64 = linux/arm64
AMD64 = linux/amd64

ifeq ($(findstring all, $(platforms)), all)
platforms = arm64 amd64
endif

ifeq ($(findstring arm64, $(platforms)), arm64)
p += $(ARM64)
endif
ifeq ($(findstring amd64, $(platforms)), amd64)
p += $(AMD64)
endif

ifndef p
p := $(shell if [ $$(arch) = "arm64" ]; then echo arm64; else echo amd64; fi)
endif

EXPORT ?= --load

NAME ?= sandbox-vm
TAG ?= $(NAME):latest

BUILDER_NAME = docker-sandbox-vm-builder

run: image container

push: EXPORT = --push
push: PLATFORMS=$(ALL_PLATFORMS)
push: image

comma = ,
empty = $(NULL)
space = $(empty) $(empty)
PLATFORMS = $(subst $(space),$(comma),$(p))

image:
	docker buildx use $(BUILDER_NAME) 2>/dev/null || \
		docker buildx create --name $(BUILDER_NAME) --bootstrap --driver-opt 'image=moby/buildkit:rootless' --use --platform=$(ALL_PLATFORMS)

container:
	docker run --detach --rm \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--env-file ./env.list \
		--name $(NAME) $(TAG)

clean:
	docker stop $(NAME)
	docker rmi $(NAME)

veryclean: clean
	docker buildx rm $(BUILDER_NAME)
