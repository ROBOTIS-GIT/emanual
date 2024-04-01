{% if page.product_group=='dxl_y_m' %}
{% assign moving_status= "[Moving Status(541)]" %}
{% assign position_trajectory= "[Position Trajectory(560)]" %}
{% assign present_position= "[Present Position(552)]" %}
{% endif %}

The threshold value for determining the Following Error Bit of {{ moving_status }}. If the difference between {{ position_trajectory }} and {{ present_position }} is greater than this value, the Following Error Bit of the [Moving Status(541)] register will be set to '1'.

|   Unit    |      Range        |
|:---------:|:-----------------:|
| 1 [Pulse] | 0 ~ 2,147,483,647 |
