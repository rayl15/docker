# SFTC Docker

# Learning the Basics of Docker
---

## Introduction to Docker
```
Docker is a tool that allows developers, sys-admins etc. to easily deploy their applications in a sandbox (called containers) to run on the host operating system i.e. Linux. The key benefit of Docker is that it allows users to package an application with all of its dependencies into a standardized unit for software development. Unlike virtual machines, containers do not have high overhead and hence enable more efficient usage of the underlying system and resources.
```

## Containers vs VirtualMachines

```
Earlier, we used to create virtual machines, and each VM had an OS which took a lot of space and made it heavy.

Now in docker container’s case, you have a single OS, and the resources are shared between the containers. Hence it is lightweight and boots in seconds.

```

## Docker Architecture

## Docker Installation
```
sudo apt-get install -y docker docker.io docker-engine
```

First to see our images and check our docker version:
```
docker images
docker version
```

Let's us know API version and google-go version for Docker Daemon.
```
docker info
```

- Locations
    - **Where Container Details are Located**
        - `var/lib/docker` is where all `images/containers` are stored
        - cd `var/lib/docker/containers/<hex>`
    - **Where Images are Located**
        - ls `/var/lib/docker/image/aufs/imagedb/content/sha256`
        
Running first container
```
docker run hello-world    
```

Whats Running
```
docker ps
```

What has run (With no name passed, it makes up a name)
```
docker ps -a
```

We can refer to a Container or Image by `IMAGE ID`, `CONTAINER_ID` or either ones `NAME`

#### Pull an image
```
docker pull ubuntu (would be latest)
docker pull ubuntu:trusty (Or any tag listed in dockerhub)
```

"Container Layers build the docker image"

#### Launch container
(i = interactive, -t = attach to terminal)
This will launch the container, but not keep it running once we exit

```
docker run -it ubuntu:xenial /bin/bash
```

```
docker ps -a
```

Grab name name of what we ran, eg 'adoring_einstein'

```
docker restart adoring_einstein
docker ps
docker attach adoring_einstein  (Logs us in)
```

#### Keep the container running in Background
(disconnected/daemonized)

```
docker run -itd ubuntu:xenial /bin/bash
```

#### Run another Instance

```
docker run -itd ubuntu:xenial /bin/bash
```

#### Stopping Containers
```
docker stop <name>
docker ps -a
```

#### Searching for containers
```
docker search ruby
```


#### Build a Dockerfile from box

```
vim Dockerfile
```

**Dockerfile**
```
# This is a nginx image
FROM nginx

MAINTAINER Rahul Sharma <rahul.sharma@sourcefuse.com>

COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]
```

```
docker build -t="sourcefuse/nginx:v1" .
docker images
docker run -t sourcefuse/nginx:v1 /bin/sh
```

#### Docker Ports
##Exposing Container with Port Redirects

A port must be exposed to the underlying Host.

```
; We know this uses port 80

docker ps
docker stop random_name

eg: docker run -d -p <local>:<container/remote> nginx:latest

docker run -d -p 8080:80 nginx:latest
docker ps

In `Dockerfile`, add:
```
EXPOSE 80
```
```
#### See the logs from a container (Running or not running)
```
docker ps -a
docker restart random_name
docker ps
docker logs random_name
```

## Dockerfile Directives: RUN Order of Execution

- **Order of Execution**
    - `FROM`
    - `MAINTAINER`
    - `RUN`
        - * _If you make a `USER` AFTER this, everything will run as THAT user_

- **Important**
    - `RUN`: execute at build time, becomes part of the base image.
    - `CMD`: Runs when a container is instantiated, eg: Run an application.


## Dockerfile Directives: ENV

`Dockerfile:
ENV JAVA_BIN /usr/java/jdk1.8.0/jre`



