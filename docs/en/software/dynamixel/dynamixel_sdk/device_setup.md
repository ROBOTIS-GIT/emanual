---
layout: archive
lang: en
ref: dynamixel_sdk_device_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/device_setup/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div class="main-header">
  <h1>Device Setup</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

This section provides instructions on how to configure the device.

# [Requirements](#requirements)
{% capture note1%}
**NOTE** : The Quick Start Guide explains how to use DYNAMIXEL with a PC as the controller. Instead of a PC, controllers such as `OpenCR`, `OpenRB`, or `Arduino` can also be used.  
  - [OpenRB-150](/docs/en/parts/controller/openrb-150/)  
  - [OpenCR](http://emanual.robotis.com/docs/en/parts/controller/opencr10/)  
  - [OpenCM9.04](http://emanual.robotis.com/docs/en/parts/controller/opencm904/)  
  - Most other Arduino boards.  
{% endcapture %}
<div class="notice--success">{{note1 | markdownify }}</div>

In order to use DYNAMIXEL with a PC, you need a `U2D2` to convert USB signals to `TTL` or `RS-485`.  
The U2D2 does not supply power to the DYNAMIXEL, so a `U2D2 Power Hub Board` is also required to provide power.  
![](/assets/images/parts/interface/u2d2_01.png)  

# [USB2DYNAMIXEL Driver Installation](#usb2dynamixel-driver-installation)
**NOTE** : Recent Linux include the kernel which contains the FT232RL driver for the FTDI driver used by the U2D2. **Most Linux users won't need to install the driver manually.**
{: .notice}

Windows users need to install the FTDI driver to enable USB-to-serial communication.  
Install the latest VCP driver from the [FTDI Driver Download page](http://www.ftdichip.com/Drivers/VCP.htm).  

# [Connecting The Motor](#connecting-the-motor)
Please use an SMPS that matches the operating voltage of the motor you are using.
* 12V for `X Series` (also for `AX`, `EX`, `RX`, and `MX` series)
* 24V for `P` and `Y` series  

Connect as shown below.  
You can either daisy-chain the U2D2 and Power Hub Board (PHB) to the motor, or connect them separately.  
![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_connection.png)


**NOTE** : You should match the port according to whether your DYNAMIXEL supports TTL or RS485.  
`TTL`: TTL-based DYNAMIXEL's have 3 pin connectors  
`RS485`: RS485-based DYNAMIXEL's have 4 pin connectors.  
![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_3pin_4pin.png)
{: .notice--info}  

# [Verifying Connection](#verifying-connection)
Once all the above settings are complete, you can use the `Dynamixel wizard 2.0` to ensure the connection is working properly  
1. [Install Dynamixel Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/#software-installation)
2. [Scan the motor and Operate it](/docs/en/software/dynamixel/dynamixel_wizard2/#basic-features)
3. [If the firmware is outdated, update it.](/docs/en/software/dynamixel/dynamixel_wizard2/#firmware-update)
