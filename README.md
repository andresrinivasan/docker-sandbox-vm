# Ubuntu as a Docker VM

This project grew out of a moment when I needed a VM and I thought it would be easier to start up a Linux container than to create a full VM. My goal became to create a sandbox environment that I could reuse. In retrospect it would have been faster to to have created a VM or invest in Vagrant (my host is as an M2 Air).

## Goals

  * Have all the tools I need to install other software and debug my environment
  * Have just enough X11 to run a GUI app with a remote display (I used XQuartz)
  * Delegate to the host Docker Engine for sibling containers

## Build and Run

```sh
make
```

or if you want to force a complete image rebuild,

```sh
NO_CACHE=--no-cache make
```

The container will be started with the Docker Engine socket mounted so that you can run sibling containers from the VM. The environment has the DISPLAY set to use the X11 server on the host.

## To Do

  * Shell configuration, completion
  * Disable IPv6 in container
