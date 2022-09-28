---
layout: post
title: Setup a Powerful VPN ZeroTier
date: 2022-09-26 15:28:32 -0700
categories: technology
---

ZeroTier creates secure networks between on-premise, cloud, desktop, and mobile devices. Team members can be connected from anywhere in the world on any device.

## Install

The easiest way is to follow the instructions on the official [website](https://www.zerotier.com/download/).

## Access the device via its ZeroTier

After installing the software and joining the network, the device will get a ZeroTier IP. It means that all devices joined the same ZeroTier network are in the same virtual LAN. Another devices in the same ZeroTier network can access this device via its ZeroTier IP. I usually use this to play Warcraft III with friends. By the way, if the warcraft III version is below 1.29, [WC3proxy](https://github.com/FooleAU/wc3proxy) is needed.

## Access the network via one device installed ZeroTier

If you need to access the another network(even global network) through one device(such as raspberry pi or nas) in that network. These is also a list of things you should to do.

- Add some routes on my.ZeroTier.com **Managed Routes**.
  **Destination** is the network you want to visit.
  - The common home network is 192.168.1.0/23.
    Configure the destination route as slightly **larger** than the actual physical subnet, here /23 instead of /24 (a smaller number is a bigger subnet in this notation) This makes devices that are on both the physical and the ZeroTier network prefer the physical connection.
  - The whole network is 0.0.0.0/0.
    To forward global traffic over ZeroTier you need to make sure that “Allow Global” is ticked in your ZeroTier client. This will let your traffic flow!
    **(Via)** is the device IP you want to visit the network through.
- Turn on IP forward on the device installed ZeroTier.
  It is hard to use IP forword in Windows system, so please use Linux system.
  In Linux, only need one command. `sudo sysctl -w net.ipv4.ip_forward=1`.
- Add iptable rules on the device installed ZeroTier. To do this, run the following commands:
  ```shell
  sudo iptables -t nat -A POSTROUTING -o "eth0" -j MASQUERADE
  sudo iptables -A FORWARD -i "eth0" -o "ZT_INTERFACE" -m state --state RELATED,ESTABLISHED -j ACCEPT
  sudo iptables -A FORWARD -i "ZT_INTERFACE" -o "eth0" -j ACCEPT
  ```
  Replace ZT_INTERFACE with the local ZeroTier interface name.
  Replace eth0 with the real thernet interface.
  You can get these from ifconfig.
- Save iptables rules for next boot. To do this, run the following commands:
  ```shell
  sudo apt install iptables-persistent
  sudo iptables-save > /etc/iptables/rules.v4
  ```
