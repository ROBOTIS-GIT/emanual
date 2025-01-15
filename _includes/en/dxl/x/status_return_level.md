{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} 

{% assign status_return_lv = "Status Return Level (16)" %}
{% assign protocol= "DYNAMIXEL Protocol 1.0" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign status_return_lv = "Status Return Level (17)" %}
{% assign protocol= "DYNAMIXEL Protocol 2.0" %}

{% else %}

{% assign status_return_lv = "Status Return Level (68)" %} <!-- X / MX 2.0  -->
{% assign protocol= "DYNAMIXEL Protocol 2.0" %}

{% endif %}


The {{ status_return_lv }} is used to set the DYNAMIXEL's response policy when an instruction packet is received.

| Value |        Responding Instructions         |                       Description                       |
|:-----:|:--------------------------------------:|:-------------------------------------------------------:|
|   0   |            PING Instruction            |   Returns a Status Packet for PING Instructions only   |
|   1   | PING Instruction<br />READ Instruction | Returns a Status Packet for PING and READ Instructions |
|   2   |            All Instructions            |     Returns a Status Packet for all Instructions      |

**NOTE** : If the [Instruction Packet ID](/docs/en/dxl/protocol2/) is set to the [Broadcast ID(0xFE)](/docs/en/dxl/protocol2/#packet-id), a Status Packet will not be returned for READ or WRITE Instructions regardless of {{ status_return_lv }}. For more details, please refer to the `Status Packet` section of the [{{ protocol }}] page.
{: .notice}