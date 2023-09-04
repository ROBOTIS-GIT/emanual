---
layout: archive
lang: en
ref: dxl_bridge
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/interface/dxl_bridge/
sidebar:
  title: DXL Communication Bridge
  nav: "dxl_bridge"
---

# [Introduction](#introduction)

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_product_front.png){: width='300px'}

The **DYNAMIXEL Communication Bridge** works as a communication converter between TTL (3 Pin JST Type connector) and RS485 (4 Pin JST Type connector) of DYNAMIXEL.

<iframe width="560" height="315" src="https://www.youtube.com/embed/oRbzORRpgqg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

{% capture why_bridge %}

**NOTE**

TTL and RS485 ports in the [U2D2 interface](/docs/en/parts/interface/u2d2/) are separately connected to the master PC,
however, the data line between TTL and RS485 ports are not connected to each other.

Thus, Instructions Packets such as **Broadcast Ping, Sync Read and Bulk Read** over TTL to RS485 and vice versa are not feasible through the U2D2 interface only.

- For more detailes about Instruction Packet, see [DYNAMIXEL Protocol 1.0](/docs/en/dxl/protocol1/#instruction-packet) or [Protocol 2.0](/docs/en/dxl/protocol2/#instruction-packet) depending on what DYNAMIXEL is in use. 

![](/assets/images/parts/interface/dxl_bridge/u2d2_separate_ttl_485.png){: width='600px'}

Unlike the U2D2, the DYNAMIXEL Communication Bridge features a signal conversion between TTL to RS485, which allows Broadcast Ping, Sync Read, and Bulk Read instructions from mixed types of communication. 

![](/assets/images/parts/interface/dxl_bridge/u2d2_bridge_ttl_485.png)

{% endcapture %}
<div class="notice">{{ why_bridge | markdownify }}</div>

# [Specifications](#specifications)

| Item              | Specifications |
|:------------------|:---------------|
| Operating Voltage | 3.5 V ~ 30.0 V |
| Current Raiting   | 3.0 A          |
| Baud Rate         | Max 6 Mbps     |

{% include en/dxl/warning.md %}

# [Layout](#layout)

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_layout_front.png){: width='600px'}  

> Layout - Front

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_layout_back.png){: width='600px'}

> Layout - Back

**NOTE**: `VDD` is the same terminology as the `Vin` printed back of the DYNAMIXEL Communication Bridge.
{: .notice}

## [Description](#description)

1. **TTL (JST 3 Pins) / RS485 Connecters (JST 4 Pins)** : 3 and 4 Pin JST connectors for TTL / RS458 communication.

2. **Mounting holes** : Used to mount on other devices. Mounting holes can be removed if not used by snapping along the V-cut line.

3. **RS485 Termination resistance: Reserved space to install RS485 termination resistor**. 1608 size(1.6 x 0.8 mm) chip resistor can be used.

# [Connection Examples](#connection-examples)

1. If the operating voltages of all DYNAMIXELs are the same, see the following images.

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_same_voltage_01.png)
    > Powering the DYNAMIXEL from Master Device. 

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_same_voltage_02.png)
    > Powering the DYNAMIXEL from external power source. 
  
2. If the operating voltages of DYNAMIXELs are different, see the following images.

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_different_voltage_01.png)
    > Powering the DYNAMIXEL Communication Bridge from the RS485 connector side. 

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_different_voltage_02.png)
    > Powering the DYNAMIXEL Communication Bridge from the TTL connector side. 

    **WARNING**: `VDD` pins (See [Layout](#layout)) of DYNAMIXEL Communication Bridge between a RS485 and TTL connector are connected each other. In case the TTL and RS485 connectors use different power, be sure to connect **only one `VDD`** to the DYNAMIXEL Communication Bridge for the product safety. 
    {: .notice--warning} 

# [Reference](#reference)

## [Connector Information](#connector-information)

{% include en/dxl/jst_485_ttl.md %}
