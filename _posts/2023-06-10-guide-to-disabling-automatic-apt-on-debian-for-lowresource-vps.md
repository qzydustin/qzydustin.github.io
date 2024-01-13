---
title: Guide to Disabling Automatic APT on Debian for Low-Resource VPS
date: 2023-06-10 17:30:54
category: Technology
---

I recently acquired two budget-friendly Virtual Private Servers (VPS) from OranMe, one featuring a 0.1 CPU with 128MB RAM and the other a 0.5 CPU with 512MB RAM. These low-spec servers are not ideal for heavy usage but can be efficient for specific tasks. To maximize their performance, I chose Debian without a desktop environment, aiming to reduce system load.

However, I faced a challenge with the 0.1 CPU VPS, which struggled with the `apt update` and `apt upgrade` processes, significantly slowing down operations.

In the past weeks, both VPS servers experienced unexpected shutdowns, compromising their reliability. Server stability is crucial, and such shutdowns undermine their utility. I noticed a pattern of high CPU usage spikes preceding each shutdown on the control panel, leading me to suspect that these spikes triggered the VPS provider's auto-shutdown mechanism.

To investigate, I delved into the `/var/log/system.log` file and discovered that the high CPU usage coincided with the automatic execution of the apt periodic task.

Debian systems often include automated tasks for `apt update` and `apt upgrade`. While these tasks ensure the system stays updated, they can be resource-intensive, particularly on lower-spec servers like mine. Therefore, disabling these automatic updates is a practical solution for enhancing performance.

Here's how to disable the automatic apt tasks:

```shell
systemctl stop apt-daily-upgrade.service
systemctl disable apt-daily-upgrade.service
systemctl stop apt-daily-upgrade.timer
systemctl disable apt-daily-upgrade.timer

systemctl stop apt-daily.service
systemctl disable apt-daily.service
systemctl stop apt-daily.timer
systemctl disable apt-daily.timer
```

**Conclusion:**
Disabling automatic apt tasks on low-resource Debian servers can significantly improve performance and stability. While this means manual updates are necessary, it allows for better control over resource usage, crucial for maintaining the efficiency of budget VPS solutions. This approach is especially beneficial for servers where stability and consistent performance are more important than having the latest updates automatically installed.
