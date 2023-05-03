# AriaNg Docker

一个基于 [AriaNg](https://github.com/mayswind/AriaNg) 和 [redbean-docker](https://github.com/kissgyorgy/redbean-docker) 构建的 Aria2 webui Docker 镜像

**注意：这仅仅是 Aria2 的 webui，还需要搭配 Aria2 服务端来使用，例如：[Aria2-Pro-Docker](https://github.com/P3TERX/Aria2-Pro-Docker)**

## 特性

- 体积超小，镜像体积不到 2MB！

## 使用

[DockerHub 地址](https://hub.docker.com/r/ovnrain/aria-ng-docker)

```bash
$ docker pull ovnrain/aria-ng-docker
$ docker run -d \
  --name=aria-ng-docker \
  --restart=unless-stopped \
  -p 3001:80 \
  ovnrain/aria-ng-docker
```

启动一个 Docker 容器，将其名称设置为 `aria-ng-docker`，并将其映射到主机的 `3001` 端口，并且自动重启

其他资料请参考 [AriaNg](https://github.com/mayswind/AriaNg) 以及自行搜寻 Aria2 的使用方法
