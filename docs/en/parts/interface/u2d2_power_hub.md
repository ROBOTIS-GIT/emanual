---
layout: archive
lang: en
ref: u2d2_power_hub
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/interface/u2d2_power_hub/
sidebar:
  title: U2D2 Power Hub
  nav: "u2d2_power_hub"
---

# [Introduction](#introduction)
Combined with U2D2, it can supply various kinds of external power supply to supply stable power to Dynamixel.

![](/assets/images/parts/interface/u2d2_power_hub/product_image.png)

# [Specifications](#specifications)

|Item|Details|
|:---:|:---:|
|Operaing Voltage|7.4V ~ 24.0V|
|Maximum Current|10.0A|

# [Layout](#layout)

![](/assets/images/parts/interface/u2d2_power_hub/layout.png)

|Part Name|Description|
|:---|:---|
|Power Connectors|In order to use various power sources including SMPS, three types of connectors are attached.|
|DYNAMIXEL Connectors|JST connector 3-pin, 4-pin are provided for communication in two ways|
|TTL/RS485 Test Points|TTL data line, RS485 D +, D-line signals can be easily identified with a separate TP|

# [Cautions](#cautions)

1. When using the terminal block, the left-side is ground and right-side is source, so be careful of polarity when using an external power supply.
2. Since the back of the board is exposed to several pins, it is recommended to combine the provided supporters so that the conductor does not touch the floor to some extent.

# [How to Assemble](#how-to-assemble)

![](/assets/images/parts/interface/u2d2_power_hub/phb_with_u2d2.png)
