---
layout: post
title:  Setup a safe proxy II
date:   2022-07-28 14:45:05 -0700
categories: technology
---

Last time, I introduced Trojan-gfw. this time, we use another proxy tool, Shadowsocks-libev.

It bypasses ISPs' network censorship by encrypting all traffic.



- Install Shadowsocks

  ```shell
  apt install shadowsocks-libev
  ```

- Config Shadowsocks

  The default config is located at /etc/shadowsocks-libev/config.json

  Here is an example config.

  A random password and port number is required.

  ```config
  {
      "server":["::0", "0.0.0.0"],
      "mode":"tcp_and_udp",
      "server_port":8388,
      "local_port":1080,
      "password":"random-password",
      "timeout":86400,
      "method":"chacha20-ietf-poly1305"
  }
  ```

- Start Shadowsocks

  ```shell
  systemctl enable shadowsocks-libev
  systemctl restart shadowsocks-libev
  systemctl status shadowsocks-libev
  ```

  Then, I can use [Outline](https://getoutline.org/) app to connect to the Shadowsocks server. 

  

  If there is some error like below, 

  ```log
  This system doesn't provide enough entropy to quickly generate high-quality random numbers
  Installing the rng-utils/rng-tools or haveged packages may help.
  On virtualized Linux environments, also consider using virtio-rng.
  The service will not start until enough entropy has been collected.
  ```

  you need to install rng-tools and generate some random numbers.

  ```shell
  apt install rng-tools
  rngd -r /dev/urandom
  systemctl restart shadowsocks-libev
  ```

  