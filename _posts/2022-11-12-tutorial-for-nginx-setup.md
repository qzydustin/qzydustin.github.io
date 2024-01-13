---
title: Tutorial for Nginx Setup
date: 2022-11-12 01:44:32-0700
category: Technology
---

Nginx is a popular web server. It is widely used in Internet projects because of its low memory consumption, fast startup, and high concurrency capability.

- Install

  Almost each Linux system has the nginx package. For example, `apt install nginx` can be used to install nginx.

- Common commands

  ```shell
  nginx -s stop #fast shutdown
  nginx -s quit #graceful shutdown
  nginx -s reload #reloading the configuration file
  nginx -s reopen #reopening the log files
  ```

- Virtual hosts config

  In the main nginx configuration, `/etc/nginx/nginx.conf`, there is a line `include /etc/nginx/sites-enabled/*.conf;`  
  To activate virtual hosts in `/etc/nginx/sites-available`, run the following command:

  ```shell
  ln -s /etc/nginx/sites-available/example.conf /etc/nginx/sites-enabled/
  ```

  - Basic static web config

    ```nginx
    server {
      listen 80;
      server_name domain.com;
      root staticHtmlFile;
    }
    ```

  - Static web with SSL config

    ```nginx
    server {
      listen 443;
      server_name domain.com;
      ssl on;
      ssl_certificate /location/certfile.crt;
      ssl_certificate_key /location/keyfile.key;
      root staticHtmlFile;
    }
    ```

  - Reverse proxy config

    ```nginx
    server {
      listen 80;
      server_name domain.com;
      location / {
        proxy_pass https://target.com:port;
      }
    }
    ```
