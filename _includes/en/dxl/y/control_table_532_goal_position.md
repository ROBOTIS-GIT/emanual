{% if page.product_group=='dxl_y_m' %}
{% assign min_position_limit= "[Min Position Limit(84)]" %}
{% assign max_position_limit= "[Max Position Limit(76)]" %}
{% endif %}

The Goal Position is used to specify the target position in position control mode. The Goal Position is limited by the configured {{ min_position_limit }} and {{ max_position_limit }}.


| Unit                                 | Range                                           |  Control Mode                                               | Description           |
|:------------------------------------:|:-----------------------------------------------:| :-----------------------------------------------------------|:----------------------|
| 1[pulse]<br />(Approx. 0.006866 deg) | Min Position limit(84) ~ Max position limit(76) | Current control<br />Velocity control<br />Position control | Unused<br />16,000 = Move to position 16,000 [pulse]
