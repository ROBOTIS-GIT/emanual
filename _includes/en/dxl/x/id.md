{% if page.product_group == 'dxl_xl320' %}

{% assign status_return_lv = "Status Return Level (17)" %}
{% assign protocol= "DYNAMIXEL Protocol 2.0" %}

{% else %}

{% assign status_return_lv = "Status Return Level (68)" %} <!-- X / MX 2.0  -->
{% assign protocol= "DYNAMIXEL Protocol 2.0" %}

{% endif %}

The ID assigned to a DYNAMIXEL actuator is a unique value used to identify a specific actuator through the DYNAMIXEL network. The numbers 0-253 (0xFD) can be assigned as an ID, with 254 (0xFE) reserved for use as the Broadcast ID that can send an Instruction Packet to all connected DYNAMIXEL servos simultaneously.

**NOTE** : IDs for every DYNAMIXEL connected to a single network must be unique. Shared ID numbers may cause communication failure.
{: .notice}

**NOTE** : If an Instruction Packet ID is set to the Broadcast ID(0xFE), Status Packets will not be returned for READ or WRITE Instructions regardless of the configured {{ status_return_lv }}. For more details, please refer to the `Status Packet` of the [{{ protocol }}] eManual page.
{: .notice}
