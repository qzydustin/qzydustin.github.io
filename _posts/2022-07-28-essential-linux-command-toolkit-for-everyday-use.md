---
title: Essential Linux Command Toolkit for Everyday Use
date: 2022-07-28 15:02:35 -0700
category: Technology
---

This compilation is designed to be a handy reference for common Linux commands, helping both new and seasoned users navigate various system tasks with ease.

## Systemd

Systemd, the system and service manager for Linux, executes configuration files found in /etc/systemd/system during startup.

- **Key Systemd Commands**

  ```shell
  systemctl enable httpd
  systemctl start httpd
  systemctl status httpd
  systemctl stop httpd
  systemctl kill httpd
  systemctl restart httpd
  ```

## Nohup

The nohup command is used to run another command without being affected by hangups. It writes to nohup.out only if the output is not redirected elsewhere.

```shell
nohup command >/dev/null 2>&1
```

To run the command in the background, add an ampersand at the end:

```shell
nohup command >/dev/null 2>&1 &
```

## rc.local

This feature allows you to automatically run commands at system startup.

- **Editing or Creating /etc/rc.local**

  ```apacheconf
  #!/bin/sh -e
  # [Additional script comments and structure]
  exit 0
  EOF
  ```

- **Applying the Changes**

  ```shell
  chmod +x /etc/rc.local
  systemctl daemon-reload
  systemctl enable rc-local
  systemctl start rc-local
  ```

## Network Optimization

Optimizing network settings can significantly enhance system performance.

- **Editing /etc/sysctl.conf**

  ```apacheconf
  s.file-max = 1000000
  fs.inotify.max_user_instances = 8192
  net.ipv4.tcp_syncookies = 1
  net.ipv4.tcp_fin_timeout = 30
  net.ipv4.tcp_tw_reuse = 1
  net.ipv4.ip_local_port_range = 1024 65000
  net.ipv4.tcp_max_syn_backlog = 16384
  net.ipv4.tcp_max_tw_buckets = 6000
  net.ipv4.route.gc_timeout = 100
  net.ipv4.tcp_syn_retries = 1
  net.ipv4.tcp_synack_retries = 1
  net.core.somaxconn = 32768
  net.core.netdev_max_backlog = 32768
  net.ipv4.tcp_timestamps = 0
  net.ipv4.tcp_max_orphans = 32768
  net.ipv4.conf.all.route_localnet=1
  net.ipv4.ip_forward = 1
  net.ipv4.tcp_no_metrics_save=1
  net.ipv4.tcp_ecn=0
  net.ipv4.tcp_frto=0
  net.ipv4.tcp_fastopen=3
  net.ipv4.tcp_mtu_probing=0
  net.ipv4.tcp_rfc1337=0
  net.ipv4.tcp_sack=1
  net.ipv4.tcp_fack=1
  net.ipv4.tcp_window_scaling=1
  net.ipv4.tcp_adv_win_scale=1
  net.ipv4.tcp_moderate_rcvbuf=1
  net.ipv4.tcp_rmem=40960 873800 167772160
  net.ipv4.tcp_wmem=40960 163840 167772160
  net.core.rmem_max=167772160
  net.core.wmem_max=167772160
  net.ipv4.udp_rmem_min=81920
  net.ipv4.udp_wmem_min=81920
  net.core.default_qdisc=fq
  net.ipv4.tcp_congestion_control=bbr
  ```

- **Applying the New Configuration**

  ```shell
  sysctl --system
  ```

This collection serves as a quick reference to efficiently manage and optimize Linux systems using straightforward commands and configurations.
