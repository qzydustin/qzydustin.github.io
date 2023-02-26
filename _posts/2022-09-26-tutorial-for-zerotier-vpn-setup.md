---
layout: post
title: Tutorial for ZeroTier VPN Setup
date: 2022-09-26 15:28:32 -0700
category: Technology
---

ZeroTier creates secure networks between on-premise, cloud, desktop, and mobile devices. As a result, team members can be connected from anywhere in the world on any device.

## Install

The easiest way is to follow the instructions on the official [website](https://www.zerotier.com/download/).

## Access the device via its ZeroTier

After installing the software and joining the network, the device will get a ZeroTier IP. It means all devices joined the same ZeroTier network are in the same virtual LAN. Therefore, other devices in the same ZeroTier network can access this device via its ZeroTier IP. I usually use this to play Warcraft III with friends. By the way, if the warcraft III version is below 1.29, [WC3proxy](https://github.com/FooleAU/wc3proxy) is needed.

## Access the network via one device installed ZeroTier

If you need to access another network(even a global network) through one device(such as raspberry pi or nas) in that network. This is also a list of things you should do.

- Add some routes on my.ZeroTier.com **Managed Routes**.  
  The **Destination** is the network you want to visit.

  - The typical home network is 192.168.1.0/23.  
    Configure the destination route as slightly **larger** than the actual physical subnet, here /23 instead of /24 (a smaller number is a bigger subnet in this notation). This makes devices on the physical and the ZeroTier networks prefer the physical connection.

  - The whole network is 0.0.0.0/0.  
    To forward global traffic over ZeroTier, you must tick “Allow Global” in your ZeroTier client. This will let your traffic flow!  
    **(Via)** is the device IP you want to visit the network through.

- Turn on IP forward on the device installed ZeroTier.  
  Using IP forward in a Windows system is hard, so please use a Linux system.  
  In Linux, you only need one command. `sudo sysctl -w net.ipv4.ip_forward=1`.

- Add iptable rules on the device installed ZeroTier. To do this, run the following commands:

  ```shell
  sudo iptables -t nat -A POSTROUTING -o "eth0" -j MASQUERADE
  sudo iptables -A FORWARD -i "eth0" -o "ZT_INTERFACE" -m state --state RELATED,ESTABLISHED -j ACCEPT
  sudo iptables -A FORWARD -i "ZT_INTERFACE" -o "eth0" -j ACCEPT
  ```

  Replace ZT_INTERFACE with the local ZeroTier interface name.  
  Replace eth0 with the actual ethernet interface.  
  You can get these from ifconfig.

- Save iptables rules for the next boot. To do this, run the following commands:

  ```shell
  sudo apt install iptables-persistent
  sudo iptables-save > /etc/iptables/rules.v4
  ```
