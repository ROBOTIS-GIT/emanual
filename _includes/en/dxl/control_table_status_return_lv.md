{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} 

{% assign stauts_return_lv = "Stuatus Return Level (16)" %}
{% assign protocol= "DYNAMIXEL Protocol 1.0" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign stauts_return_lv = "Stuatus Return Level (17)" %}
{% assign protocol= "DYNAMIXEL Protocol 2.0" %}

{% else %}

{% assign stauts_return_lv = "Stuatus Return Level (68)" %} <!-- X / MX 2.0  -->
{% assign protocol= "DYNAMIXEL Protocol 2.0" %}

{% endif %}


The {{ stauts_return_lv }} decides how to return Status Packet when DYNAMIXEL receives an Instruction Packet.

| Value |        Responding Instructions         |                       Description                       |
|:-----:|:--------------------------------------:|:-------------------------------------------------------:|
|   0   |            PING Instruction            |   Returns the Status Packet for PING Instruction only   |
|   1   | PING Instruction<br />READ Instruction | Returns the Status Packet for PING and READ Instruction |
|   2   |            All Instructions            |     Returns the Status Packet for all Instructions      |

{% if page.product_group=='xl330' %}

**NOTE** : If the [Instruction Packet ID](/docs/en/dxl/protocol2/) is set to the [Broad Cast ID(0xFE)](/docs/en/dxl/protocol2/#packet-id), Status Packet will not be returned for READ or WRITE Instructions regardless of {{ stauts_return_lv }}. For more details, please refer to the `Status Packet` section for [{{ protocol }}].
{: .notice}

{% else %}

**NOTE** : If the Instruction Packet ID is set to the Broadcast ID(0xFE), Status Packet will not be returned for READ or WRITE Instructions regardless of {{ stauts_return_lv }}. For more details, please refer to the `Status Packet` section for [{{ protocol }}].
{: .notice}

{% endif %}

[DYNAMIXEL Protocol 1.0]: /docs/en/dxl/protocol1/
[DYNAMIXEL Protocol 2.0]: /docs/en/dxl/protocol2/
