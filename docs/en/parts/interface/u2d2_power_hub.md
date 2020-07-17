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

## [Description](#description)

1. **DYNAMIXEL Connectors**: 3 and 4-pins JST connectors are installed for communication. See [Connector Information](#connector-information) for more details.

2. **TTL/RS485 Test Points**: TTL data line, RS485 D +, D-line signals can be easily identified via the test points

3. **Power Connectors**: U2D2 PHB provides three different types of power connectors to supply a diverse voltage and current to DYNAMIXEL. 
    - SMPS DC Connector (2.5mm ID / 5.5mm OD, [Center Positive](https://en.wikipedia.org/wiki/Polarity_symbols))
    - MOLEX Power connector (See [Connector Information](#connector-information) for more details)
    - PCB Screw Terminal Block Connector
      - Left: -
      - Right: +

{% capture caution_01 %}
**CAUTION**: 
- Be sure to check the polarity of the terminal block connector when using an external power supply, to enhance the user safety.
- Some pins stick out on the bottom of the board, which are prone to touch the floor. To prevent from touching a floor, assemble the board with the supplied supporters following [How to Assemble](#how-to-assemble) instruction.
{% endcapture %}
<div class="notice--warning">{{ caution_01 | markdownify }}</div>

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

# [Connector Information](#connector-information)
    
{% include en/dxl/jst_485_ttl.md %}
