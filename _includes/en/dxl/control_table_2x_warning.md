{% capture 2x_warning %}
**CAUTION** : Be sure to read the following for right use of {% if page.ref=='2xc430-w250' %}2XC430-W250{% else %}2XL430-W250{% endif %} with Control Table.
- Data of [EEPROM Area](#eeprom-area) can only be written when [Torque Enable(64)](#torque-enable) value of the control table for each axle is all set as ‘0’.
- Each axle of {% if page.ref=='2xc430-w250' %}2XC430{% else %}2XL430{% endif %} has its own control table. However, [Baud Rate(8)](#baud-rate) and [Protocol Type(13)](#protocol-type) values are synced all the time as there is only one communication module in the {% if page.ref=='2xc430-w250' %}2XC430-W250{% else %}2XL430-W250{% endif %} actuator. In addition, [Torque Enable(64)](#torque-enable) must be set as “0” when modifying these addresses. 
{% endcapture %}
<div class="notice--warning">{{ 2x_warning | markdownify }}</div>
