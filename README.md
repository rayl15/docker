# docker

# Installing Docker in ubuntu system
Remove old version:
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

 sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io


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

Whats Running
```
docker ps
```

What has run (With no name passed, it makes up a name)
```
docker ps -a
```

We can refer to a Container or Image by `IMAGE ID`, `CONTAINER_ID` or either ones `NAME`

####Pull an image
```
docker pull ubuntu (would be latest)
docker pull ubuntu:trusty (Or any tag listed in dockerhub)
```


