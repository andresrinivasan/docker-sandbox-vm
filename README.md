# Ubuntu as a Docker VM

This project grew out of a moment when I needed a VM and I thought it would be easier to start up a Linux container than to create a full VM. My goal evolved to creating a sandbox environment that I could reuse independent of whether I was Intel or ARM based hardware (I implemented this on an M2 Air).

## Goals

  * Have all the tools I need to install other software and debug my environment
  * Have just enough X11 to run a GUI app with a remote display (I used XQuartz)
  * Delegate to the host Docker Engine for sibling containers
  * Create a reproducible environment

## Runtime Assumptions

  * If a remote display is needed, it's X11 on the host and is accepting connections
  * The Docker Engine is available on `/var/run/docker.sock` and listening on port 2375 on the host

## Build and Run

```sh
make
```

or if you want to force a complete image rebuild,

```sh
NO_CACHE=--no-cache make
```

The container will be started with the Docker Engine socket mounted so that you can run sibling containers from the VM. The container environment has the DISPLAY set to use the X11 server on the host. Set `DOCKER_HOST=tcp://host.docker.internal:2375` in the container to connect the Docker daemon over HTTPS.

Shell onto the container with `docker exec -it ubuntu-vm bash` or use [VSC to remote connect](https://code.visualstudio.com/docs/devcontainers/attach-container) and be fruitful.

## To Do

  * Shell configuration, completion
  * Disable IPv6 in container
  * Build for multiple platforms at once
  * Add VNC
