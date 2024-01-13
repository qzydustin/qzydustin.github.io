---
layout: post
title: Collection for Common Linux Command
date: 2022-07-28 15:02:35 -0700
category: Technology
---

## systemd

Systemd executes the configuration files in the /etc/systemd/system directory at system start-up.

- Common commands

  ```shell
  systemctl enable httpd
  systemctl start httpd
  systemctl status httpd
  systemctl stop httpd
  systemctl kill httpd
  systemctl restart httpd
  ```

## nohup

The nohup command only writes to nohup.out if the output would otherwise go to the terminal. If you have redirected the output of the command somewhere else - including /dev/null - that's where it goes instead.

```shell
nohup command >/dev/null 2>&1
```

If you're using nohup, that probably means you want to run the command in the background by putting another & on the end of the whole thing:

```shell
nohup command >/dev/null 2>&1 &
```

## rc.local

Auto run commands at system start-up.

- Edit or new /etc/rc.local

  ```apacheconf
  #!/bin/sh -e
  #
  # rc.local
  #
  # This script is executed at the end of each multiuser runlevel.
  # Make sure that the script will "exit 0" on success or any other
  # value on error.
  #
  # In order to enable or disable this script just change the execution
  # bits.
  #
  # By default this script does nothing.

  exit 0
  EOF
  ```

- Apply the changes

  ```shell
  chmod +x /etc/rc.local
  systemctl daemon-reload
  systemctl enable rc-local
  systemctl start rc-local
  ```

## Network Optimization

- Edit /etc/sysctl.conf

  ```apacheconf
  fs.file-max = 1000000
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

- Apply the change

  ```shell
  sysctl --system
  ```
