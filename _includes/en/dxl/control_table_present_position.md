This value indicates present Position. For more details, please refer to the [Goal Position(116)](#goal-position).

{% capture present_pos_notice_01 %}
`Note` Present Position(132) represents 4 byte continuous range(-2,147,483,648 ~ 2,147,483,647) when Torque is turned off regardless of Operating Mode(11). However, Present Position(132) will be reset in those cases:
1. Present Position(132) is reset with the value within 1 rev (0 ~ 4,095) when Operating Mode(11) is changed to Position Control Mode.
2. Present Position(132) is reset with the value within 1 rev (0 ~ 4,095) when Torque is turned on in Position Control Mode.

Reset Present Position(132) value can be affected by Homing Offset(20).
{% endcapture %}

<div class="notice">
  {{ present_pos_notice_01 | markdownify }}
</div>
