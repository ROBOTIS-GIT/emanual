{% assign torque_enable= "64" %}
{% assign present_position="132" %}
{% assign homing_offset="20" %}

{% if page.product_group=='dxl_pro_plus' or page.product_group=='dxl_pro_a' or page.product_group=='rh_p12_rna' %}
{% assign torque_enable= "512" %}
{% assign present_position="580" %}
{% elsif page.product_group=='dxl_pro' or page.product_group=='rh_p12_rn' %}
{% assign torque_enable= "562" %}
{% assign present_position="611" %}
{% assign homing_offset="13" %}
{% elsif page.product_group=='dxl_xl320'' %}
{% assign torque_enable= "24" %}
{% assign present_position="37" %}
{% endif %}

{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_mx' or page.product_group=='dxl_rx' %}
{% else %}
Controls Torque ON/OFF. Writing ‘1’ to this address will turn on the Torque and all Data in the EEPROM area will be protected.
{% endif %}

|   Value    | Description                             |
|:----------:|:----------------------------------------|
| 0(Default) | Turn off the torque                     |
|     1      | Turn on the torque and lock EEPROM area |

{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_mx' or page.product_group=='dxl_rx' or page.product_group=='dxl_xl320' %}
{% else %}
**NOTE** : [Present Position({{ present_position }})] can be reset when [Operating Mode(11)] and [Torque Enable({{ torque_enable }})] are updated. For more details, please refer to the [Homing Offset({{ homing_offset }})] and [Present Position({{ present_position }})].
{: .notice}
{% endif %}
