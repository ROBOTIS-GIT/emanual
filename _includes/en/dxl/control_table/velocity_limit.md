{% if page.product_group=='dxl_y_m' %}
{% assign goal_velocity= "[Goal Velocity(528)]" %}
{% assign profile_velocity= "[Profile Velocity(244)]" %}
{% endif %}

Velocity limit is used to set an upper maximum on the speed of generated trajectories, as well as accepted {{ goal_velocity }} values. Values for {{ goal_velocity }} and {{ profile_velocity }} cannot be set to values exceeding the Velocity Limit. If a value greater than this limit is set, the returned status packet will include a Data Limit Error in the Error field.
