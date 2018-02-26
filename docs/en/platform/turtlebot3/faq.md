---
layout: archive
lang: en
ref: turtlebot3_faq
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/faq/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 27"></div>

# [FAQ](#faq)

**How to download the STL files of TurtleBot3**
-----------------------------------------------

You can download it in the following way.

We released the TurtleBot3 Friends hardware design file at the link below.

- [TurtleBot3 Friends](http://emanual.robotis.com/docs/en/platform/turtlebot3/friends/#turtlebot3-friends-car)

So, you can download the STL files directly from each Onshape address as shown in the following figures.

1. Sign in. (If you do not have an ID, you have to create one.)
2. Click the "toggle tab manager" (A menu will appear on the left side of the browser.)
3. Click the "Parts folder"
4. Right-click on the icon of the file you want to download.
5. Click the "Export..."
6. Finally, you can download the output file type you want.

![](/assets/images/platform/turtlebot3/faq/download_the_stl_files_01.png)

![](/assets/images/platform/turtlebot3/faq/download_the_stl_files_02.png)


**Intel® Joule™ USB-C port is not recognized on Windows 10**
------------------------------------------------------------

Some users have reported that the USB-C port is not recognized on Windows 10 when they were trying to update BIOS.
Please check below link that describes the solution that worked out(Thanks for ***rknlhrqy*** and ***VRAORESEARCH***).

1. [ROS Discourse](https://discourse.ros.org/t/turtlebot-3-successfully-upload-alternative-ubuntu-desktop-16-04-to-joule/2224)
1. [Intel communities](https://communities.intel.com/thread/109766)


**Can I charge the battery when the battery is connected to Turtlebot3?**
--------------------------------------------------------------------------

Charging and discharging the battery at the same is **NOT** recommended and this may void the warranty of the product. If Turtlebot3 needs to be turned on while charging/replacing battery, please follow below procedure:

1. Connect SMPS 12V 5A to [OpenCR](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=1366&GC=GD0B0102)
2. Disconnect the depleted battery from OpenCR
3. Connect the depleted battery to battery charger or replace the depleted battery with a fully charged battery
4. Connect the fully charged battery to OpenCR
5. Disconnect SMPS 12V 5A from OpenCR

**Intel® Joule™ freezes while booting/installation**
----------------------------------------------------

If BIOS firmware is not properly installed, this might happen. Please burn the BIOS firmware 193 release version again.

1. Turn off the Joule.
2. Proceed BIOS firmware #193 [update](https://software.intel.com/en-us/flashing-the-bios-on-joule) using file from the below link. Make sure that you see the message in the red box.

[Download BIOS Firmware #193](https://downloadmirror.intel.com/26206/eng/joule-firmware-2017-02-19-193-public.zip)

![](/assets/images/platform/turtlebot3/faq/nvstorage.png)

**Enable SSH server in Raspberry Pi**
----------------------------------------------------

First you have to install ssh on [Remote PC] and [Raspberry Pi]

``` bash
  sudo apt-get install ssh
```

In case of Raspberry Pi (TurtleBot3 Burger and Waffle Pi), since the SSH server of Ubuntu MATE 16.04.x and Raspbian is disabled by default. If you want to enable SSH, please refer to the documents below.

[SSH Instruction](https://www.raspberrypi.org/documentation/remote-access/ssh/)

[Ubuntu MATE in Raspberry Pi](https://ubuntu-mate.org/raspberry-pi/)

or you can use following commands

``` bash
  sudo service ssh start
  sudo ufw allow ssh
```

Before start to connect SSH, you need to check host computer's name. Redbox in below image shows it.

![](/assets/images/platform/turtlebot3/faq/computer_name.png)

Then, you can use SSH following command in [Remote PC].

``` bash
  ssh {computer's name}@xxx.xxx.xx.xx
```

![](/assets/images/platform/turtlebot3/faq/connection_ssh.png)


**Timesync between TurtleBot3 and RemotePC**
----------------------------------------------------

**Note :** This solution is subject to connect internet on your Turtlebot and RemotePC under same Network
{: .notice--info}

First, you have to install ``ntpdate``

[TurtleBot] and [RemotePC]

``` bash
  sudo apt-get install ntpdate
```

Second, synchronize to NTP server

[TurtleBot] and [RemotePC]

``` bash
  $ sudo ntpdate ntp.ubuntu.com
```

