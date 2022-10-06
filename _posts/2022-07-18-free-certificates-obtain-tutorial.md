---
layout: post
title: Free Certificates Obtain Tutorial
date: 2022-07-18 17:12:32-0700
category: Technology-Tutorial
---

This article will introduce how to get free certificates. The certificates can help you build https website or setup trojan proxy. I use the acme.sh tool to get certificates easily.

- Install acme.sh and set auto upgrade

  ```shell
  curl  https://get.acme.sh | sh -s email=example@email.com
  . .bashrc
  acme.sh --upgrade --auto-upgrade
  ```

- Apply for certificates

  ```shell
  apt install socat
  acme.sh --issue  -d domain.com --keylength ec-256 --standalone
  ```

- Install certificates to a folder

  ```shell
  acme.sh --installcert -d domain.com --ecc --fullchain-file /location/certfile.pem --key-file /location/keyfile.key
  chmod +r /location/keyfile.key
  ```
