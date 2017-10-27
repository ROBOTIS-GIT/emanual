---
layout: archive
lang: en
ref: usb2dynamixel
share: true
author_profile: false
permalink: /docs/en/parts/interface/usb2dynamixel/
sidebar:
  title: USB2Dynamixel
  nav: "usb2dynamixel"
---

# USB2Dynamixel

![](/assets/images/parts/interface/usb2dynamixel_product.jpg)

# [Introduction](#introduction)

# [How to Use](#how-to-use)

USB2Dynamixel is a device used to operate Dynamixel directly from PC.  USB2Dynamixel is connected to USB port of PC, and 3P and 4P connectors are installed so that various Dynamixels can be conntected.
Also, USB2Dynamixel can be used to change from USB port to Serial port on the PC without serial port such as notebook computer, etc.  The function is very useful in the cases when the Dynamixel exclusive controllers such as CM-2, CM-2+, CM-5, and CM-510 are connected to USB Port, or when ZIG2Serial is connected to USB port to control robots wirelessly.

## Dynamixel Control Using PC

![](/assets/images/parts/interface/usb2dynamixel_01.png)

## Changing Serial Port

![](/assets/images/parts/interface/usb2dynamixel_02.png)

## Wireless Communication

![](/assets/images/parts/interface/usb2dynamixel_03.png)

`Note` Difference in voltage may cause unstable USB2DXL connections. Ensure that both connecting equipment and PC are properly grounded.
{: .notice}

# [Layout](#layout)

![](/assets/images/parts/interface/usb2dynamixel_04.jpg)

![](/assets/images/parts/interface/usb2dynamixel_05.jpg)

|Name|Description|
|:---:|:---:|
|Status Display LED|Display power supply, TXD(data writing), and RXD(data reading) status.|
|Function Selection Switch|Select the communication method of TTL, RS-485, and RS-232.|
|3P Connector|Connect Dynamixels of AX Series through TTL communication.|
|4P Connector|Connect Dynamixels of DX, RX Series through RS-485 communication.|
|Serial Connector|Change from USB port to Serial port through RS-232 communication.|

## [Pinout](#pinout)

The following pictures show the usage of connector pins used by USB2Dynamixel. If you want to use each pin for your own purpose, please use them after you learn the usage of each pin.


- PIN Figure of 4P / 3P Cable Connctors

  ![](/assets/images/parts/interface/usb2dynamixel_07.jpg)

- PIN Figure of Serial Connector

  ![](/assets/images/parts/interface/usb2dynamixel_08.jpg)

# [Select Communication Mode](#select-communication-mode)

The communication mode can be selected by chaning the switch of USB2Dynamixel as below.

![](/assets/images/parts/interface/usb2dynamixel_06.png)

1. TTL Communication : Dynamixels using 3-pin port such as AX Series, AX-S1 etc.
2. RS485 Communication : Dynamixels using 4-pin port such as DX Series, RX Series, EX Series etc.
3. RS232 Communication : Controllers using serial cable such as CM-5, CM-510 etc.

# [Tutorials](#tutorials)

- USB2Dynamixel SDK : Please refer to the [USB2Dynamixel SDK].

# [Supply Power](#supply-power)

USB2Dynamixel does not supply power to Dynamixel. Therefore, the power must be supplied separately to operate Dynamixel as the following pictures. Please refer to the explanation page of each Dynamixel regarding proper voltages for each Dynamixel mode.
 
{% capture usb2dynamixel_warning_01 %}
`Warning`
- For the stable power supply, we recommend using ROBOTIS controller or SMPS2Dynamixel.
- Connect your DYNAMIXEL to power supply while it’s off and turn on/off with the power switch.
{% endcapture %}

<div style="notice--warning">{{ usb2dynamixel_warning_01 | markdownify }}</div>
 
## Applying Power to the Dynamixel

Referring to PIN Figure, apply positive (+) voltage to the #2 PIN of the connector, and negative (-) voltage on #1 PIN of the connector.  
Since the 2 connectors of Dynamixels are equal,  power can be applied at any of.)

![](/assets/images/parts/interface/usb2dynamixel_09.jpg)

## Applying power between USB2Dynamixel and Dynamixel

If power cannot be applied as above, apply the power between USB2Dynamixel and Dynamixel as below.

Separate the power cable on the #2 PIN of USB2Dynamixel connector, and then apply positive(+) voltage.  
Connect additionally Y-cable to the power cable on the #1 PIN of  USB2Dynamixel connector, and then apply negative (-) voltage.

![](/assets/images/parts/interface/usb2dynamixel_10.jpg)

# [Check Driver](#check-driver)

How to check whether the USB2Dynamixel driver is installed correctly.

`Note` USB2Dynamixel and LN-101 uses an identical USB chipset.
{: .notice}

1. Connect USB2Dynamixel to the USB Port of PC.

    ![img_02][img_02]

2. Select Manage in the popped-up menu shown by right-clicking My Computer.

    ![img_04][img_04]

3. Check USB Serial Converter in Universal Serial Bus Controllers of Device Manager.

    ![img_05][img_05]

4. Check USB Serial Port(COMx) in the list of Ports(COM & LPT). COM Port number may vary depending on each system.

    ![img_06][img_06]

# [Install Driver Manually](#install-driver-manually)

If you installed RoboPlus, FTDI Driver (USB2Dynamixel, USB Downloader (LN-101) driver) is installed together automatically. If you didn't install the RoboPlus yet, or if the driver is not installed appropriately, please install it manually according to following procedures.
{: .notice}

1. Connect a device to PC. If the driver is not installed yet, Found New Hardware Wizard will be popped up. Install from a list or specific location (Advanced)(S) -> Next(N)

    ![img_07][img_07]

2. Decide the location of Driver. If RoboPlus S/W has been installed automatically, the driver is in LN101 folder of RoboPlus Installation folder. Or if you want to install the newest version, download the newest version VCP driver from [FTDI Driver Download] page.

    ![img_08][img_08]
    
    ![img_09][img_09]

3. Click the Next(N) button to start the installation. Installation of USB Serial Converter driver is completed.

    ![img_10][img_10]

4. Install the USB Serial Port driver in the same way.

    ![img_11][img_11]


# [Videos](#videos)

Setting up the port
<iframe width="560" height="315" src="https://www.youtube.com/embed/UlD4C1XMsgo" frameborder="0" allowfullscreen></iframe>

[USB2Dynamixel SDK]: /docs/en/software/sdk/usb2dynamixel/
[download_task_code]: /docs/en/software/rplus1/task/getting_started/#program-download
[task_result_print]: /docs/en/software/rplus1/task/getting_started/#print-on-the-screen
[virtual_robot_control]: /docs/en/software/rplus1/task/getting_started/#virtual-robot-control
[CM-100]: /docs/en/parts/controller/cm-100/
[CM-150]: /docs/en/parts/controller/cm-150/
[CM-200]: /docs/en/parts/controller/cm-200/
[CM-700]: /docs/en/parts/controller/cm-700/
[OpenCM9.04]: /docs/en/parts/controller/opencm904/
[FTDI Driver Download]: http://www.ftdichip.com/Drivers/VCP.htm
[img_01]: /assets/images/parts/interface/ln101.jpg
[img_02]: /assets/images/edu/task_download_01.jpg
[img_03]: /assets/images/parts/interface/ln101_to_cm700.png
[img_04]: /assets/images/parts/interface/ln101_01.png
[img_05]: /assets/images/parts/interface/ln101_02.png
[img_06]: /assets/images/parts/interface/ln101_03.png
[img_07]: /assets/images/parts/interface/ln101_04.png
[img_08]: /assets/images/parts/interface/ln101_05.png
[img_09]: /assets/images/parts/interface/ln101_06.png
[img_10]: /assets/images/parts/interface/ln101_07.png
[img_11]: /assets/images/parts/interface/ln101_08.png
