---
layout: post
title: Tutorial for Docker Setup
date: 2022-07-07 20:36:36 -0700
category: Technology
---

## Docker

Docker is a set of platform-as-a-service (PaaS) products that use OS-level virtualization to deliver software in packages called containers.

Here is an automatic install script. It can be used on Ubuntu, Debian, and other Linus systems.

```shell
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```



## Docker Compose

Docker Compose is a tool that helps you define and share multi-container applications. With Compose, you can create a YAML file to define the services, and with a single command, you can spin everything up or tear it down.

The following command is to install docker-compose, but the latest docker includes docker-compose. The following commands should only be used if you need to install docker-compose manually.

```shell
docker run --rm -v /usr/local/bin:/dist gists/docker-compose-bin:latest
docker rmi gists/docker-compose-bin:latest
```
