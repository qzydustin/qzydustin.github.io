---
layout: post
title: Tutorial for Docker Setup
date: 2022-07-07 20:36:36 -0700
category: Technology
---

Docker is a set of platform-as-a-service (PaaS) products that use OS-level virtualization to deliver software in packages called containers

- install docker

  ```shell
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
  ```

- install docker-compose

  ```shell
  docker run --rm -v /usr/local/bin:/dist gists/docker-compose-bin:latest
  docker rmi gists/docker-compose-bin:latest
  ```
