---
layout: archive
lang: en
ref: turtlebot3_rpi3_software_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/rpi3_software_setup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 5"></div>

# [SBC Software Setup](#sbc-software-setup)

## [Install Linux on TurtleBot3 Burger and Waffle Pi (Raspberry Pi 3)](#install-linux-on-turtlebot3-burger-and-waffle-pi-raspberry-pi-3)

**Warning :** The SDcard should have at least **8 GB** of empty space in order to install Linux on TurtleBot3.
{: .notice--warning}

**[Remote PC]** Download `Ubuntu MATE 16.04` on the Raspberry Pi 3 from the link below.

- [Ubuntu MATE](https://ubuntu-mate.org/download/)

![](/assets/images/platform/turtlebot3/preparation/download_ubuntu_mate_image.png)

**[Remote PC]** In order to install Ubuntu MATE from an image file, it is recommended using GNOME Disks with `Restore Disk Image...` option, which natively supports XZ compressed image.

``` bash
$ sudo apt-get install gnome-disk-utility
```

<iframe width="640" height="480" src="https://www.youtube.com/embed/V_6GNyL6Dac" frameborder="0" allowfullscreen></iframe>

**Tip :** It is recommended using `GNOME Disks`, but other applications such as `ddrescue` on Linux can be used.
{: .notice--info}

``` bash
$ sudo apt-get install gddrescue xz-utils
$ unxz ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz
$ sudo ddrescue -D --force ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img /dev/sdx
```

**Tip :** It is recommended using `GNOME Disks`, but other applications such as `Win32 Disk Imager` on Windows can be used. [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/)
{: .notice--info}
