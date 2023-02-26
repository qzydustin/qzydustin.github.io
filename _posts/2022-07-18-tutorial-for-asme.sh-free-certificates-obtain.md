---
layout: post
title: Tutorial for ACME.sh Free Certificates Obtain
date: 2022-07-18 17:12:32-0700
category: Technology
---

This article will introduce how to get free certificates. The certificates can help you build an HTTPS website or set up a trojan proxy. I use the acme.sh tool to get certificates quickly.

- Install acme.sh and set auto upgrade

  ```shell
  curl  https://get.acme.sh | sh -s email=example@email.com
  . .bashrc
  acme.sh --upgrade --auto-upgrade
  ```

- Issue a cert by Cloudflare DNS API mode

  - Create [Cloudflare API](https://dash.cloudflare.com/profile)  
    The token needs access read access to Zone.Zone, and write access to Zone.DNS

  - Apply certificates

    ```shell
    export CF_Token="XXXXX"
    export CF_Account_ID="XXXXX"
    export CF_Zone_ID="XXXXX"

    acme.sh --issue --dns dns_cf -d example.com -d example.com --keylength ec-256
    ```

  - Install certificates to a folder

    ```shell
    acme.sh --installcert -d domain.com --ecc \
     --fullchain-file /location/certfile.crt \
     --key-file /location/keyfile.key\
     --reloadcmd "systemctl restart example"
    
    chmod +r /location/keyfile.key
    ```
