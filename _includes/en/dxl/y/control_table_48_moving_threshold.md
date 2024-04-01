{% if page.product_group=='dxl_y_m' %}
{% assign moving_status= "[Moving Status(541)]" %}
{% assign present_velocity= "[Present Velocity(548)]" %}
{% endif %}

The threshold value for determining the Moving Bit of {{ moving_status }}. If the {{ present_velocity }} value is greater than this value, the Moving Bit of the {{ moving_status }} register will be set to '1'.

|   Unit    |      Range        |
|:---------:|:-----------------:|
| 1 [Pulse] | 0 ~ 2,147,483,647 |
