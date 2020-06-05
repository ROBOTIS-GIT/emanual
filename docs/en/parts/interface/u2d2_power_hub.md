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
Combined with U2D2, it can supply various kinds of external power supply to supply stable power to DYNAMIXEL.

![](/assets/images/parts/interface/u2d2_power_hub/product_image.png)

# [Specifications](#specifications)

|       Item       |   Details    |
|:----------------:|:------------:|
| Operaing Voltage | 7.4V ~ 24.0V |
| Maximum Current  |    10.0A     |

# [Layout](#layout)

![](/assets/images/parts/interface/u2d2_power_hub/layout.png)

| Part Name             | Description                                                                                   |
|:----------------------|:----------------------------------------------------------------------------------------------|
| Power Connectors      | In order to use various power sources including SMPS, three types of connectors are attached. |
| DYNAMIXEL Connectors  | JST connector 3-pin, 4-pin are provided for communication in two ways                         |
| TTL/RS485 Test Points | TTL data line, RS485 D +, D-line signals can be easily identified with a separate TP          |

# [Cautions](#cautions)

1. When using the terminal block, the left-side is ground and right-side is source, so be careful of polarity when using an external power supply.
2. Since the back of the board is exposed to several pins, it is recommended to combine the provided supporters so that the conductor does not touch the floor to some extent.

# [How to Assemble](#how-to-assemble)

1. Assemble four(4) plastic supporters at each corner of the `U2D2 Power Hub Board` as shown below.  

    ![](/assets/images/parts/interface/u2d2_power_hub/u2d2_phb_06.jpg)

2. Use plastic rivets to mount `U2D2` on the `U2D2 Power Hub Board`.

    ![](/assets/images/parts/interface/u2d2_power_hub/u2d2_phb_07.jpg)

3. Connect `U2D2` and `U2D2 Power Hub Board` with 3P or 4P cables (Both 3P and 4P cables can be connected at the same time).

    ![](/assets/images/parts/interface/u2d2_power_hub/u2d2_phb_03.jpg)

4. Connect additional cables that will connect `U2D2` and `DYNAMIXEL` (Depending on DYNAMIXEL model, converting cables may be required).

    ![](/assets/images/parts/interface/u2d2_power_hub/u2d2_phb_04.jpg)

5. Connect the other side of the cable to `DYNAMIXEL` (Depending on DYNAMIXEL model, converting cables may be required).

    ![](/assets/images/parts/interface/u2d2_power_hub/u2d2_phb_05.jpg)

6. Connect power to `U2D2 Power Hub Board`.

    **DANGER** : Do NOT use multiple power inputs at the same time. Select ONLY one of the power source to connect.
    {: .notice--danger}

    **WARNING** : Check the Recommended Voltage for DYNAMIXEL before supplying the power.
    {: .notice--warning}

    ![](/assets/images/parts/interface/u2d2_power_hub/u2d2_phb_01.jpg)

7. Turn the power switch on `U2D2 Power Hub Board` to supply power to DYNAMIXEL

    ![](/assets/images/parts/interface/u2d2_power_hub/u2d2_phb_08.jpg)
