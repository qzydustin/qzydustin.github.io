---
title: Step-by-Step Shadowsocks Proxy Setup Guide
date: 2022-07-28 14:45:05 -0700
category: Technology
---

Building on our previous discussion of Trojan-gfw, this guide focuses on Shadowsocks-libev, an alternative proxy tool that encrypts traffic to evade ISP network censorship. However, users should be aware that Shadowsocks-libev may not be effective for bypassing Chinese network censorship and could result in the server's IP being blocked in mainland China.

- **Installing Shadowsocks**

  Start by installing the Shadowsocks-libev package:

  ```shell
  apt install shadowsocks-libev
  ```

- **Configuring Shadowsocks**

  The standard configuration file is located at /etc/shadowsocks-libev/config.json. Below is an example configuration, requiring a unique password and port number.

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

- **Launching Shadowsocks**

  Execute the following commands to start the Shadowsocks service:

  ```shell
  systemctl enable shadowsocks-libev
  systemctl restart shadowsocks-libev
  systemctl status shadowsocks-libev
  ```

  You can then connect to the Shadowsocks server using the [Outline](https://getoutline.org/) app. If you encounter errors related to entropy for random number generation:

  ```log
  This system doesn't provide enough entropy...
  ```

  Install rng-tools and initiate random number generation:

  ```shell
  apt install rng-tools
  rngd -r /dev/urandom
  systemctl restart shadowsocks-libev
  ```

This tutorial provides a clear pathway to setting up Shadowsocks-libev, ensuring you can navigate the setup process with ease.
