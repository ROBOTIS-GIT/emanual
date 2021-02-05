{% if page.product_group == 'dxl_ax' or page.product_group == 'dxl_ex' or page.product_group == 'dxl_rx' or page.product_group == 'dxl_mx' %}

{% assign stauts_return_lv = "Stuatus Return Level (16)" %}
{% assign protocol= "DYNAMIXEL Protocol 1.0" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign stauts_return_lv = "Stuatus Return Level (17)" %}
{% assign protocol= "DYNAMIXEL Protocol 2.0" %}

{% else %}

{% assign stauts_return_lv = "Stuatus Return Level (68)" %} <!-- X / MX 2.0  -->
{% assign protocol= "DYNAMIXEL Protocol 2.0" %}

{% endif %}

The ID is a unique value in the network to identify each DYNAMIXEL with an Instruction Packet.
0~253 (0xFD) values can be used as an ID, and 254(0xFE) is occupied as a broadcast ID. The Broadcast ID(254, 0xFE) can send an Instruction Packet to all connected DYNAMIXEL simultaneously.

**NOTE** : Please avoid using an identical ID for multiple DYNAMIXEL. You may face communication failure or may not be able to detect DYNAMIXEL with an identical ID.
{: .notice}

**NOTE** : If the Instruction Packet ID is set to the Broadcast ID(0xFE), Status Packets will not be returned for READ or WRITE Instructions regardless of the set value of {{ stauts_return_lv }}. For more details, please refer to the `Status Packet` section for [{{ protocol }}]
{: .notice}
