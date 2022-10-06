---
layout: post
title: Trojan Proxy Setup Tutorial
date: 2022-07-18 16:58:55 -0700
category: Technology-Tutorial
---

My goal is to build a proxy that bypasses network censorship.
This time I used trojan-gfw. It works by disguising all traffic as https traffic. This makes it impossible for ISPs to identify the traffic.

- Install Trojan

  ```shell
  apt install trojan
  ```

- Config Trojan

  The default config is located at /etc/trojan/config.
  Here is an example config.
  A random password, cert and key file are required.
  Free cert and key file can be obtained by acme.sh.

  ```config
  {
      "run_type": "server",
      "local_addr": "0.0.0.0",
      "local_port": 443,
      "remote_addr": "127.0.0.1",
      "remote_port": 7500,
      "password": [
          "this-is-a-password"
      ],
      "log_level": 1,
      "ssl": {
          "cert": "/etc/trojan/cert.pem",
          "key": "/etc/trojan/cert.key",
          "key_password": "",
          "cipher": "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384",
          "cipher_tls13": "TLS_AES_128_GCM_SHA256:TLS_CHACHA20_POLY1305_SHA256:TLS_AES_256_GCM_SHA384",
          "prefer_server_cipher": true,
          "alpn": [
              "http/1.1"
          ],
          "alpn_port_override": {
              "h2": 81
          },
          "reuse_session": true,
          "session_ticket": false,
          "session_timeout": 600,
          "plain_http_response": "",
          "curves": "",
          "dhparam": ""
      },
      "tcp": {
          "prefer_ipv4": false,
          "no_delay": true,
          "keep_alive": true,
          "reuse_port": false,
          "fast_open": false,
          "fast_open_qlen": 20
      },
      "mysql": {
          "enabled": false,
          "server_addr": "127.0.0.1",
          "server_port": 3306,
          "database": "trojan",
          "username": "trojan",
          "password": "",
          "key": "",
          "cert": "",
          "ca": ""
      }
  }
  ```

- Start Trojan

  ```shell
  systemctl enable trojan
  systemctl start trojan
  systemctl status trojan
  ```

  Then, I can use Shadowrocket app to connect to the Trojan server.
