---
layout: archive
lang: en
ref: dxl_bridge
read_time: true
share: false
author_profile: false
permalink: /docs/en/parts/interface/dxl_bridge/
sidebar:
  title: DXL Communication Bridge
  nav: "dxl_bridge"
---

# [Introduction](#introduction)

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_product.png){: width='450px'}

The **DYNAMIXEL Communication Bridge** works as a communication converter between TTL (3 Pin JST Type connector) and RS485 (4 Pin JST Type connector) of DYNAMIXEL.

{% capture why_bridge %}

**NOTE**

TTL and RS485 ports in the [U2D2 interface](/docs/en/parts/interface/u2d2/) are separately connected to the master PC,
however, the data line between TTL and RS485 ports are not connected to each other.

Thus, Instructions Packets such as **Broadcast Ping, Sync Read and Bulk Read** over TTL to RS485 and vice versa are not feasible through the U2D2 interface only.

- For more detailes about Instruction Packet, see [DYNAMIXEL Protocol 1.0](/docs/en/dxl/protocol1/#instruction-packet) or [Protocol 2.0](/docs/en/dxl/protocol2/#instruction-packet) depending on what DYNAMIXEL is in use. 

![](/assets/images/parts/interface/dxl_bridge/u2d2_separate_ttl_485.png){: width='600px'}

Unlike the U2D2, the DYNAMIXEL Communication Bridge features a signal conversion between TTL to RS485, which allows Broadcast Ping, Sync Read, and Bulk Read instructions from mixed types of communication. 

![](/assets/images/parts/interface/dxl_bridge/u2d2_bridge_ttl_485.png){: width='950px'}

{% endcapture %}
<div class="notice">{{ why_bridge | markdownify }}</div>

# [Specifications](#specifications)

| Item              | Specifications |
|:------------------|:---------------|
| Operating Voltage | 3.5 V ~ 24.0 V |
| Current           | Max 3.0 A      |
| Baud Rate         | Max 6 Mbps     |

# [Layout](#layout)

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_layout_kr.png){: width='600px'}

## [Description](#description)

1. **TTL / RS485 Connecters (JST 3 / 4 Pins)** : 3 and 4 Pin JST connectors for TTL / RS458 communication.

2. **Mounting holes** : Used to mount on other devices. Mounting holes can be removed if not used by snapping along the V-cut line.

3. **RS485 Termination resistance: Reserved space to install RS485 termination resistor**. 1608 size(1.6 x 0.8 mm) chip resistor can be used.

# [Connection Examples](#connection-examples)

1. If the operating voltages of all DYNAMIXELs are the same, see the following images.

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_same_voltage_01.png){: width='600px'}

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_same_voltage_02.png){: width='600px'}
  
2. If the operating voltages of DYNAMIXELs are different, see the following images.

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_different_voltage_01.png){: width='600px'}

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_different_voltage_02.png){: width='600px'}

# [Reference](#reference)

{% include en/dxl/jst_485_ttl.md %}
