# Docker Images

The Docker images were based on [Yolks](https://github.com/pterodactyl/yolks/tree/master) oriented.

The Java Images are based
on [eclipse-temurin](https://github.com/docker-library/repo-info/tree/master/repos/eclipse-temurin/local).


#### How to use Images?

```bash
docker login ghcr.io -u <username> --password-stdin
```

Now you can pull Images:

```bash
docker pull ghcr.io/byte-storede/images:java-8
```