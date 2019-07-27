## Docker Installation
### Typical (Ubuntu/Rasbian)
```
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sh get-docker.sh
```
### Raspbian Buster
```
$ CHANNEL=nightly curl -fsSL https://get.docker.com -o get-docker.sh
$ sh get-docker.sh
```

### arm64
```
$ sudo apt-get update
$ sudo apt-get install docker.io
```

### Add user to the docker group 
```
$ sudo usermod -aG docker $USER #(then logout)
```

### Simple test
```
$ docker version
$ docker run --rm hello-world
```

