{% if page.product_group=='dxl_y_m' %}
{% assign status_return_level= "[Status Return Level(68)]" %}
{% endif %}

A unique number used to identify devices on the DYNAMIXEL network. The acceptable ID range is from 0 to 252 (0xFC), with 254 (0xFE) being reserved for the Broadcast ID. The Broadcast ID (254, 0xFE) is used specifically for sending Instruction Packets to all connected DYNAMIXEL devices simultaneously.


**Caution** : Each DYNAMIXEL servo connected to the network requires a unique ID. If device IDs are duplicated, communication errors can occur, and searching for DYNAMIXELs with duplicated IDs will fail.
{: .notice}

**Note** : When a packet is sent to the Broadcast ID (0xFE), no status packets will be returned for read or write instructions regardless of the {{ status_return_level }} setting. For more detailed information, please refer to the Status Packet section of the [DYNAMIXEL Protocol 2.0](https://emanual.robotis.com/docs/en/dxl/protocol2/#status-packet) eManual page.
{: .notice}
