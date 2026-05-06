Goal Position(116) is used to set the actuator's desired output position.

![](/assets/images/dxl/x/dxl_goal_position.jpg)

| Mode     | Values     | Description |
| :--------: | :--------: | :--------:|
| Position Control Mode | Min Position Limit(52) ~ Max Position Limit(48)| Initial Value : 0 ~ 4,095|
| Extended Position Control Mode|-1,048,575 ~ 1,048,575|-256[rev] ~ 256[rev] |
{% if page.product_group!='dxl_xl430' and page.ref!='mx-28-2' %}
| Current-based Position Control Mode|-1,048,575 ~ 1,048,575|-256[rev] ~ 256[rev]|{% else %}{% endif %}

| Unit |    Description     |
|:--------------------------:|:------------------:|
|      0.088 [deg/pulse]      | 1[rev] : 0 ~ 4,095 |


{% capture notice_01 %}
**NOTE** : [Profile Velocity(112)](#profile-velocity112) and [Profile Acceleration(108)](#profile-acceleration108) are active under the following conditions:
- When the [Operating Mode(11)](#operating-mode11) is **Position Control Mode**, [Profile Velocity(112)](#profile-velocity112) and [Profile Acceleration(108)](#profile-acceleration108) are used to create a new profile when the [Goal Position(116)](#goal-position116) is updated.  
- When the [Operating Mode(11)](#operating-mode11) is **Velocity Control Mode**, [Profile Acceleration(108)](#profile-acceleration108) is used to create a new profile when [Goal Velocity(104)](#goal-velocity104) is updated.
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

**NOTE** : When turning off the power supply or changing the Operating Mode to Extended Position Control Mode, the value of Present Position is reset to the absolute position value within a single turn.
{: .notice}

{% include en/dxl/control_table_opmode_note.md %}
