# ubuntu-docker-vm

Sometimes you just want a Linux VM sandbox and Docker is perfect. While you could use `docker run -it ubuntu`, as soon as you exit the shell, the image exits and you lose your VM. The intent here is to create a longer lived image.

## Build and Run

```sh
make
```

The container will be started with both the Docker Engine socket and the X11 socket mounted so that you can run sibling containers in the VM and use GUI apps assuming you have an X11 server running on the host.
