---
title: Guide to Creating a Bootable macOS USB Installer on Modern Systems
date: 2023-07-19 17:06:26
category: Technology
---

Creating a macOS USB Installer can be more challenging than its Windows counterpart, particularly when dealing with older macOS versions on the latest systems. For instance, I faced difficulties while attempting to reinstall macOS 10.7 Lion on a Mac Pro 2012 using a MacBook Air with an M1 chip and the latest macOS. This article aims to document the solutions I found for these challenges, which may help others facing similar issues.

## Downloading the macOS Installer

The initial hurdle is obtaining the macOS installer. Apple provides direct download links for macOS versions 10.7 to 10.12 and App Store links for newer versions (10.13 and later). Here's a brief overview of some macOS versions:

- **Mac OS X 10.7 Lion**: The final release under the "Mac OS X" branding, ideal for testing older Intel x64 Macs.
- **OS X 10.11 El Capitan**: The last version named "OS X," great for everyday use on older Macs.
- **macOS 10.15 Catalina**: The final "macOS 10" version, well-suited for daily use on Intel x64 Macs.

### macOS 10.7 - 10.12

Downloading older macOS versions (10.7-10.12) directly can lead to compatibility issues. For example, the installer package (.pkg) inside the downloaded disk image (.dmg) may not be supported on newer Macs. Here's how you can manually extract and prepare the macOS Installer App:

```shell
# Mount the dmg file
open -W ~/Downloads/InstallMacOSX.dmg
# Expand the pkg file
pkgutil --expand /Volumes/Install Mac OS X/InstallMacOSX.pkg ~/Lion
# Extract the app file
cd ~/Lion/InstallMacOSX.pkg
tar -xvf Payload
mv ~/Lion/InstallMacOSX.pkg/InstallESD.dmg ~/Lion/InstallMacOSX.pkg/Install\ Mac\ OS\ X\ Lion.app/Contents/SharedSupport
mv ~/Lion/InstallMacOSX.pkg/Install\ Mac\ OS\ X\ Lion.app ~/Downloads
# Cleanup
rm -rf ~/Lion
```

### macOS 10.13 - Latest

For macOS versions 10.13 and newer, downloading via the App Store can be problematic if your Mac doesn't support the desired macOS version. However, you can use the open-source tool [gibMacOS](https://github.com/corpnewt/gibMacOS) to download these installers. Run "gibMacOS.command" followed by "BuildmacOSInstallApp.command" to create the macOS Installer App.

## Creating a Bootable Image from the Installer

To create a bootable ISO or DMG file from the macOS Installer, refer to this [guide by Eric from Canada](https://ericfromcanada.github.io/output/2022/macos-installer-disk-images-for-virtualization.html).

## Flashing the Bootable Image

1. Mount the bootable image.
2. Identify the target USB drive using `diskutil list external`.
3. Use the `asr` command to restore the installer image to the USB stick:

   ```shell
   sudo asr restore --source /dev/disk5s2 --target /dev/rdisk4s2 --erase
   ```

   Follow the prompts to complete the restoration process.

4. Once completed, your USB stick is ready with the bootable macOS installer.

In summary, creating a macOS USB Installer for older versions on modern systems requires specific steps and tools. By following these guidelines, you can successfully create bootable installers for a range of macOS versions, ensuring compatibility with older hardware.
