---
title: Step-by-Step Web Server Nginx Setup Guide
date: 2022-11-12 01:44:32-0700
category: Technology
---

Nginx is a high-performance web server known for its efficiency, especially in terms of memory usage, fast startup times, and handling high concurrency. This makes it a popular choice for various internet projects.

- **Installation**

  Nginx is available in the package repositories of most Linux distributions. For instance, in Debian-based systems, you can install Nginx using `apt install nginx`.

- **Common Commands**

  Here are some essential Nginx commands:

  ```shell
  nginx -s stop # Fast shutdown
  nginx -s quit # Graceful shutdown
  nginx -s reload # Reload configuration file
  nginx -s reopen # Reopen log files
  ```

- **Configuring Virtual Hosts**

  The main Nginx configuration file, `/etc/nginx/nginx.conf`, includes the line `include /etc/nginx/sites-enabled/*.conf;` to manage virtual hosts. To enable a virtual host located in `/etc/nginx/sites-available`, use this command:

  ```shell
  ln -s /etc/nginx/sites-available/example.conf /etc/nginx/sites-enabled/
  ```

  Here are some example configurations:

  - **Basic Configuration for Static Websites**

    ```nginx
    server {
      listen 80;
      server_name domain.com;
      root /path/to/staticHtmlFile;
    }
    ```

  - **Static Website with SSL**

    ```nginx
    server {
      listen 443 ssl;
      server_name domain.com;
      ssl_certificate /location/certfile.crt;
      ssl_certificate_key /location/keyfile.key;
      root /path/to/staticHtmlFile;
    }
    ```

  - **Reverse Proxy Configuration**

    ```nginx
    server {
      listen 80;
      server_name domain.com;
      location / {
        proxy_pass https://target.com:port;
      }
    }
    ```

This guide provides a fundamental understanding of installing and configuring Nginx for various use cases, from serving static web pages to setting up a reverse proxy.
