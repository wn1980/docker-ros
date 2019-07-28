## Docker Installation
### Typical (Ubuntu/Rasbian except arm64)
```
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sh get-docker.sh
```
### Raspbian Buster
```
$ CHANNEL=nightly curl -fsSL https://get.docker.com -o get-docker.sh
$ sh get-docker.sh
```

### arm64 (Refer to [Docker manual](https://docs.docker.com/install/linux/docker-ce/ubuntu/))
```
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

$ sudo add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
$ sudo apt-get update

$ sudo apt-get install docker-ce
```

### Add user to the docker group 
```
$ sudo usermod -aG docker $USER #(reboot to take effect)
```

### Simple test
```
$ docker version
$ docker run --rm hello-world
```

