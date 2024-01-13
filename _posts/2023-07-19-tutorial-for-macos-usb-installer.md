---
title:  Tutorial for macOS USB Installer
date:   2023-07-19 17:06:26
category: Technology
---

Compared to Microsoft Windows USB Installer, macOS USB Installer is such a big problem, especially if you want to make a historical macOS version USB Installer on the latest macOS system. In my case, I got a Mac Pro 2012, and I want to reinstall macOS 10.7 Lion, but I only have a MacBook Air M1 chip with the latest macOS. I met many problems and would like to record the solution for me or others in the future.

## Where to download the resource?

This is the first problem we will meet. I used to download the official installer from the original source. Apple's website provides direct links to macOS(10.7-10.12) Installers and AppStore links to macOS(10.13-latest).

Here are some macOS version notes:

- Mac OS X 10.7 Lion: 
  - The last "Mac OS X" version.
  - It is an excellent version to test old Macs with Intel x64 CPU.
- OS X 10.11 El Capitan: 
  - The last "OS X" version.
  - It is an excellent version for old Macs' daily use.
- macOS 10.15 Catalina: 
  - The last "macOS 10" version. 
  - It is an excellent version for Intel x64 Macs' daily use.

### macOS(10.7-10.12)

After downloading the macOS through direct links, I still cannot use the pkg in the dmg file to build a macOS Installer App because "the device cannot be supported."

Here is the example script(Lion) to release macOS Installer App from dmg manually.

```shell
## Mount dmg file
open -W ~/Downloads/InstallMacOSX.dmg
## Expand the pkg file
pkgutil --expand /Volumes/Install Mac OS X/InstallMacOSX.pkg  ~/Lion
## Release the app file to the Download folder
cd ~/Lion/InstallMacOSX.pkg
tar -xvf Payload
mv ~/Lion/InstallMacOSX.pkg/InstallESD.dmg ~/Lion/InstallMacOSX.pkg/Install\ Mac\ OS\ X\ Lion.app/Contents/SharedSupport
mv ~/Lion/InstallMacOSX.pkg/Install\ Mac\ OS\ X\ Lion.app /Downloads
## Clean
rm -rf ~/Lion
```

### macOS(10.13-latest)

AppStore links are hard to download. When your Mac does not support the historical system, the AppStore will forbid you to download it. Luckily, there is an open-source tool named [gibMacOS](https://github.com/corpnewt/gibMacOS) that can download those systems(10.13-latest) by open "gibMacOS.command" then open "BuildmacOSInstallApp.command" to build a macOS Installer App.

Now, we should have the macOS Installer App(like "Install Mac OS X Lion.app").

## Make a bootable image from Installer.

Here is a [guide](https://ericfromcanada.github.io/output/2022/macos-installer-disk-images-for-virtualization.html) to making a bootable iso/dmg file.

## Flash the bootable image.

1. Open the bootable image to mount it.

2. Run `diskutil list external` command.

   ```shell
   /dev/disk4 (external, physical):
      #:                       TYPE NAME                    SIZE       IDENTIFIER
      0:      GUID_partition_scheme                        *128.0 GB   disk4
      1:                        EFI EFI                     209.7 MB   disk4s1
      2:                  Apple_HFS Lion                    127.7 GB   disk4s2
   
   /dev/disk5 (disk image):
      #:                       TYPE NAME                    SIZE       IDENTIFIER
      0:     Apple_partition_scheme                        +5.1 GB     disk5
      1:        Apple_partition_map                         32.3 KB    disk5s1
      2:                  Apple_HFS Mac OS X Install ESD    5.1 GB     disk5s2
   ```

3. Run `sudo asr restore --source /dev/disk5s2 --target /dev/rdisk4s2 --erase` to restore the dmg to USB stick
   ```shell
   Validating target...done
   	Validating source...failed to get properties for device disk5, error = 22
   done
   	Erase contents of /dev/disk4s2 (/Volumes/Lion)? [ny]: y
   	Validating sizes...done
   	Restoring  ....10....20....30....40....50....60....70....80....90....100
   	Verifying  ....10....20....30....40....50....60....70....80....90....100
   	Restored target device is /dev/disk4s2.
   	Remounting target volume...done
   Restore completed successfully.
   ```

4. Done!

