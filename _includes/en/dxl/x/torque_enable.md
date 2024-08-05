{% assign torque_enable= "64" %}
{% assign present_position="132" %}
{% assign homing_offset="20" %}

{% if page.product_group=='dxl_p' or page.product_group=='dxl_pro_a' or page.product_group=='rh_p12_rna' %}
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

|   Value    | Description |
|:----------:|:------------|
| 0(Default) | Torque Off  |
|     1      | Torque On   |

{% else %}

Torque Enable(64) is used to enable or disable the torque for the DYNAMIXEL's internal motor. Setting Torque Enable({{ torque_enable }}) to ‘1’ will enable output Torque and all Data in the EEPROM area will be locked. Setting the value to ‘0’ will disable torque and unlock the EEPROM.

|   Value    | Description                    |
|:----------:|:-------------------------------|
| 0(Default) | Torque Off, EEPROM unlocked    |
|     1      | Torque On, EEPROM locked       |

{% endif %}

{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_mx' or page.product_group=='dxl_rx' or page.product_group=='dxl_xl320' %}

{% else %}

**NOTE** : [Present Position({{ present_position }})] will be reset when the [Operating Mode(11)] or [Torque Enable({{ torque_enable }})] settings are updated. For more details, please refer to the [Homing Offset({{ homing_offset }})] and [Present Position({{ present_position }})] control table items.
{: .notice}
{% endif %}
