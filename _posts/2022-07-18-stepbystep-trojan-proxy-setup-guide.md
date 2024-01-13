---
title: Step-by-Step Trojan Proxy Setup Guide
date: 2022-07-18 16:58:55 -0700
category: Technology
---

In this tutorial, I'll walk you through setting up a Trojan proxy, an effective tool for bypassing network censorship. Trojan-gfw is adept at disguising internet traffic as HTTPS, making it challenging for Internet Service Providers (ISPs) to detect your activities.

- **Installing Trojan**

  Begin by installing the Trojan software:

  ```shell
  apt install trojan
  ```

- **Configuring Trojan**

  The default configuration file is located at /etc/trojan/config. Below is an example configuration. You'll need a random password and SSL certificate files, which you can obtain for free using acme.sh.

  ```config
  {
      // Configuration details
  }
  ```

- **Starting the Trojan Service**

  Activate and run the Trojan service:

  ```shell
  systemctl enable trojan
  systemctl start trojan
  systemctl status trojan
  ```

  After these steps, you'll be able to connect to your Trojan server using apps like Shadowrocket. This guide provides a straightforward approach to setting up a secure and reliable proxy server.
