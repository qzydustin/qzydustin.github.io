---
layout: post
title:  Tutorial for Debian Disable Auto Apt
date:   2023-06-10 17:30:54
category: Technology
---

I have got two almost free VPS from OranMe. One is a 0.1 CPU with 128M memory, and the other is a 0.5 CPU with 512M memory. Those tiny VPS cannot be deployed for any services if you are a regular player. I am using Debian without the desktop to relieve pressure. However, the 0.1 CPU VPS is still very slow to run the `apt update` and `apt upgrade`.

In recent weeks, these VPS have been shutting down unexpectedly occasionally. Stability is paramount for servers; these automatic shutdowns render the VPS virtually worthless. However, I have observed that there is a period of high CPU usage on the control panel before each shutdown. I hypothesize that the VPS provider sends a shutdown command upon detecting prolonged periods of high CPU usage.

Therefore, I initiated a debugging process. By inspecting the file `/var/log/system.log`, I discovered that there were periodic tasks running in the system, and high CPU usage every time was caused by the apt periodic task.

In this system template, there are periodic tasks for automatic `apt update` and `apt upgrade`. Due to the weak performance of the VPS, we should disable these periodic tasks.

Here are the commands.

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

