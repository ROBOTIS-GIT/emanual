The Goal Position(116) sets desired position.  From the front view of DYNAMIXEL, CCW is an increasing direction, whereas CW is a decreasing direction. The way of reaching the Goal Position(116) can differ by the Profile provided by DYNAMIXEL. See the [What is the Profile] for more details.

![](/assets/images/dxl/x/dxl_goal_position.jpg)

| Mode     | Values     | Description |
| :--------: | :--------: | :--------:|
| Position Control Mode | Min Position Limit(52) ~ Max Position Limit(48)| Initial Value : 0 ~ 4,095|
| Extended Position Control Mode|-1,048,575 ~ 1,048,575|-256[rev] ~ 256[rev] |{% if page.product_group!='dxl_xl430' and page.ref!='mx-28-2' %}
| Current-based Position Control Mode|-1,048,575 ~ 1,048,575|-256[rev] ~ 256[rev]|{% else %}{% endif %}

| Unit |    Description     |
|:--------------------------:|:------------------:|
|      0.088 [deg/pulse]      | 1[rev] : 0 ~ 4,095 |


{% capture notice_01 %}
**NOTE** : The [Profile Velocity(112)](#profile-velocity112) and the [Profile Acceleration(108)](#profile-acceleration108) are applied in below cases.
- When the [Operating Mode(11)](#operating-mode11) is **Position Control Mode**, the [Profile Velocity(112)](#profile-velocity112) and the [Profile Acceleration(108)](#profile-acceleration108) are used to create a new profile if the [Goal Position(116)](#goal-position116) is updated.  
- When the [Operating Mode(11)](#operating-mode11) is **Velocity Control Mode**, the [Profile Acceleration(108)](#profile-acceleration108) is used to create a new profile if [Goal Velocity(104)](#goal-velocity104) is updated.
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

**NOTE** : When turning off the power supply or changing Operation Mode on Extended Position Control Mode, the value of Present Position is reset to the absolute position value of single turn .
{: .notice}

{% include en/dxl/control_table_opmode_note.md %}
