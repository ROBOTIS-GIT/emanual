This value indicates present Position. For more details, please refer to the [Goal Position(116)].

{% capture present_pos_notice_01 %}
**NOTE** : [Present Position(132)](#present-position132) represents 4 byte continuous range(-2,147,483,648 ~ 2,147,483,647) when Torque is turned off regardless of [Operating Mode(11)](#operating-mode11). However, [Present Position(132)](#present-position132) will be reset in those cases:
1. [Present Position(132)](#present-position132) is reset with the value within 1 rev (0 ~ 4,095) when [Operating Mode(11)](#operating-mode11) is changed to Position Control Mode.
2. [Present Position(132)](#present-position132) is reset with the value within 1 rev (0 ~ 4,095) when Torque is turned on in Position Control Mode.

Reset [Present Position(132)](#present-position132) value can be affected by [Homing Offset(20)](#homing-offset20).
{% endcapture %}

<div class="notice">
  {{ present_pos_notice_01 | markdownify }}
</div>

{% include en/dxl/control_table_opmode_note.md %}
