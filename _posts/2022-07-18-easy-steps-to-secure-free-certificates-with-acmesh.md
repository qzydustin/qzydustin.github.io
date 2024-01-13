---
title: Easy Steps to Secure Free Certificates with ACME.sh
date: 2022-07-18 17:12:32-0700
category: Technology
---

This guide is dedicated to demonstrating how you can obtain free certificates essential for setting up HTTPS websites or configuring trojan proxies. By leveraging the efficiency of the acme.sh tool, you can quickly secure these certificates.

- **Installation and Automatic Upgrade of acme.sh**

  Begin by installing acme.sh and configuring it for automatic upgrades:

  ```shell
  curl https://get.acme.sh | sh -s email=example@email.com
  . .bashrc
  acme.sh --upgrade --auto-upgrade
  ```

- **Certificate Issuance via Cloudflare DNS API**

  - First, set up your [Cloudflare API](https://dash.cloudflare.com/profile). Ensure that your token has read access to Zone.Zone and write access to Zone.DNS.

  - To apply for certificates, use the following commands:

    ```shell
    export CF_Token="XXXXX"
    export CF_Account_ID="XXXXX"
    export CF_Zone_ID="XXXXX"

    acme.sh --issue --dns dns_cf -d example.com -d example.com --keylength ec-256
    ```

  - **Installing Certificates to a Designated Folder**

    Install the obtained certificates to your chosen location:

    ```shell
    acme.sh --installcert -d domain.com --ecc \
     --fullchain-file /location/certfile.crt \
     --key-file /location/keyfile.key \
     --reloadcmd "systemctl restart example"
    
    chmod +r /location/keyfile.key
    ```

By following these steps, you can efficiently secure and install free certificates, enhancing the security and credibility of your web presence.
