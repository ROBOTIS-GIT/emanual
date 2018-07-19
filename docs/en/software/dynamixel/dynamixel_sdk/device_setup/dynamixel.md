---
layout: archive
lang: en
ref: dynamixel
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/device_setup/dynamixel/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 1"></div>

<!--[dummy Header 1]>
  <h1 id="device-setup"><a href="#device-setup">Device Setup</a></h1>
<![end dummy Header 1]-->

## [Dynamixel](#dynamixel)

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_image.jpg)

The SDK and SDK examples were developed based on the MX-28 and H54-200 PRO Dynamixels. 

SDK examples were tested with the following Dynamixels: 

|              | AX  | EX  | RX  | MX  | MX  |  X  |  X  | PRO |
|:------------:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **Protocol** | 1.0 | 1.0 | 1.0 | 1.0 | 2.0 | 1.0 | 2.0 | 2.0 |
|              |     |     |     |     |     |     |     |     |
|  **Series**  |     |     |     |     |     |     |     |     |
|      12      |  O  |  -  |  -  |     |     |  -  |  -  |  -  |
|      18      |     |  -  |  -  |     |     |  -  |  -  |  -  |
|      24      |  -  |  -  |  O  |  O  |  O  |  -  |  -  |  -  |
|      28      |  -  |  -  |  O  |  O  |  O  |  -  |  -  |  -  |
|      64      |  -  |  -  |  O  |  O  |  O  |  -  |  -  |  -  |
|     106      |  -  |  O  |  -  |  O  |  O  |  -  |  -  |  -  |
|     320      |  -  |  -  |  -  |  -  |  -  |  -  |  O  |  -  |
|     430      |  -  |  -  |  -  |  -  |  -  |  O  |  O  |  -  |
|     540      |  -  |  -  |  -  |  -  |  -  |  O  |  O  |  -  |
|              |     |     |     |     |     |     |     |     |
|      42      |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  O  |
|      54      |  -  |  -  |  -  |  -  |  -  |  -  |  -  |  O  |

> O : Compatible  
> X : Incompatible  
> -- : Doesn't exist  
> blank : Not tested yet

**NOTE** : The BulkRead function doesn't work with the AX, EX, or RX series
{: .notice}

### [Power Requirements](#power-requirements)

* 12V for MX (also AX, EX, RX, and X series)

  ![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_setting/1.png)

* 24V for PRO 

  ![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_setting/2.png)

**NOTE** : The X series' 4P connector is not compatible with the USB2Dynamixel connector.
{: .notice}

### [Dynamixel Parameters](#dynamixel-parameters)

To run the SDK examples, the following Dynamixel parameters need to be changed: 
* ID = 1 (and 2, when the example uses two Dynamixels) 
* Baud Rate = 57600 bps (baud value = 34 for MX, 1 for PRO.)

To change Dynamixel parameters, use Dynamixel Wizard, which is part of ROBOTIS [RoboPlus](http://www.robotis.us/roboplus2/) suite of software.

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_setting/3.png)

![](/assets/images/sw/sdk/dynamixel_sdk/device_setup/dynamixel_setting/4.png)

Instructions on how to utilize Dynamixel Wizard are uploaded on the [e-manual](http://emanual.robotis.com/docs/en/software/rplus2/manager/)
