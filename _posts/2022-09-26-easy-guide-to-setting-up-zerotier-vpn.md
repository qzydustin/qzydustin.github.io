---
title: Easy Guide to Setting Up ZeroTier VPN
date: 2022-09-26 15:28:32 -0700
category: Technology
---

ZeroTier offers a seamless way to create secure networks linking various devices like on-premise systems, cloud platforms, desktops, and mobile devices. This connectivity enables team members to collaborate from virtually anywhere in the world on any device.

## Installation Process

To get started, the simplest approach is to follow the setup instructions on the official [ZeroTier website](https://www.zerotier.com/download/).

## Device Access through ZeroTier IP

Once you install ZeroTier and join a network, your device receives a ZeroTier IP. This IP places all devices in the same virtual LAN if they are part of the same ZeroTier network. It facilitates access to this device using its ZeroTier IP. For instance, I use this setup to play Warcraft III with friends. Note that for Warcraft III versions below 1.29, [WC3proxy](https://github.com/FooleAU/wc3proxy) is necessary.

## Accessing Networks via a ZeroTier-Enabled Device

Sometimes, you may need to access different networks, including global ones, through a single device in that network, like a Raspberry Pi or NAS. Here's what to do:

- Configure **Managed Routes** on my.ZeroTier.com.  
  The **Destination** should be the network you wish to access.
  - For typical home networks (e.g., 192.168.1.0/23), configure the destination slightly **larger** than the actual physical subnet to prioritize physical connections.
  - For global traffic (0.0.0.0/0), enable “Allow Global” in your ZeroTier client. **(Via)** should be the IP of the device through which you wish to access the network.

- Enable IP forwarding on the ZeroTier-installed device.  
  This is easier on Linux systems:
  `sudo sysctl -w net.ipv4.ip_forward=1`.

- Implement iptable rules on the ZeroTier device:

  ```shell
  sudo iptables -t nat -A POSTROUTING -o "eth0" -j MASQUERADE
  sudo iptables -A FORWARD -i "eth0" -o "ZT_INTERFACE" -m state --state RELATED,ESTABLISHED -j ACCEPT
  sudo iptables -A FORWARD -i "ZT_INTERFACE" -o "eth0" -j ACCEPT
  ```

  Replace ZT_INTERFACE with your local ZeroTier interface name and eth0 with the actual ethernet interface, obtainable via ifconfig.

- Save iptable rules for subsequent boots:

  ```shell
  sudo apt install iptables-persistent
  sudo iptables-save > /etc/iptables/rules.v4
  ```

This guide aims to provide a straightforward pathway to setting up a ZeroTier VPN, ensuring secure and flexible connectivity across various devices.
