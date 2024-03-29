{% if page.product_group=='dxl_y_m' %}
{% assign operating_mode= "[Operating Mode(33)]" %}
{% endif %}
The frequency of the Low-Pass Filter for Target Current. This is used to define the Goal Current Filter in the {{ operating_mode }} block diagram. Control performance may be improved by reducing unwanted frequencies from the control signal.

| Unit     | Range      |
|:---------|:-----------|
| 0.1[Hz]  | 0 ~ 65,535 |
