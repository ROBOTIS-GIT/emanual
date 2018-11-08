This value indicates present Position. For more details, please refer to the [Goal Position(564)].

[Goal Position(564)]: #goal-position564

{% capture present_pos_notice_01 %}
**NOTE** : Present Position(580) represents 4 byte size continuous range(-2,147,483,648 ~ 2,147,483,647) when Torque is turned off regardless of Operating Mode(11). However, Present Position(580) will be reset in those cases:

1. Present Position(580) is reset with the value within 1 revolution when Operating Mode(11) is changed to Position Control Mode.
2. Present Position(580) is reset with the value within 1 revolution when Torque Enable(512) is turned on in Position Control Mode.

Reset value of Present Position(580) can be affected by Homing Offset(20).
{% endcapture %}

<div class="notice">{{ present_pos_notice_01 | markdownify }}</div>
