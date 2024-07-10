{% if page.product_group == 'xl330' or page.product_group == 'xc330' %}
{% assign firmware_version_torque_on_by_goal_update = "firmware **V46**" %}
{% else %}
{% assign firmware_version_torque_on_by_goal_update = "firmware **V45**" %}
{% endif %}

Drive Mode contains several settings for adjusting the operating behavior of DYNAMIXEL servos, including automatic torque on, reverse movement, and movement profiles.
{% if page.product_group=='dxl_x430' %}
of DYNAMIXEL. Drive Mode is available starting from  the **firmware V38**.
{% endif %}

|     Bit     |                Item                 | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|:-----------:|:-----------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Bit 7(0x80) |                  -                  | Unused, always ‘0’                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Bit 6(0x40) |                  -                  | Unused, always ‘0’                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Bit 5(0x20) |                  -                  | Unused, always ‘0’                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Bit 4(0x10) |                  -                  | Unused, always ‘0’                                                                                                                                                                                                                                                                                                                               |{% if page.product_group=='xl330' or page.product_group=='xc330' or page.product_group=='dxl_x430' or page.product_group=='dxl_x540' or page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' or page.product_group=='dxl_xl430' %}                                                 |
| Bit 3(0x08) |      Torque On by Goal Update       | **[0]** Movements will only be executed if [Torque Enable(64)] is set to '1' <br> **[1]** Movements will be executed regardless of the value of [Torque Enable(64)]. If the value of Torque Enable(64) is '0' and a command is given, Torque Enable(64) will be updated to '1'.                                                                                                                                                                                           |{% else %}                                                                                          |
| Bit 3(0x08) |                  -                  | Unused, always ‘0’                                                                                                                                                                                                                                                                                                                               |   |{% endif %}{% if page.product_group=='xl330' or page.product_group=='xc330' or page.product_group=='dxl_x430' or page.product_group=='dxl_x540' or page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' or page.product_group=='dxl_xl430' or page.product_group=='dxl_mx2' %} |
| Bit 2(0x04) |        Profile Configuration        | **[0]** Velocity-based Profile:  Create Profiles based on movement Velocity<br />**[1]** Time-based Profile: Create Profiles based on time steps.<br />※ See [What is the Profile](#what-is-the-profile) |{% else %}                                                                                                                                                                                                                                                                                                                                                                                                           |
| Bit 2(0x04) |                  -                  | Unused, always ‘0’                                                                                                                                                                                          |{% endif %}{% if page.product_group=='dxl_x540' or page.product_group=='dxl_ex' or page.ref=='mx-106-2' or page.ref=='mx-106' %}                                                                                                                                                                                                                                                                   |
| Bit 1(0x02) | Leader/Follower Mode<br />(Dual Joint) | **[0]** Leader Mode: Operate as a Leader DYNAMIXEL.<br />**[1]** Follower Mode: Operate as Follower DYNAMIXEL                                                                                                          |{% else %}                                                                                                                                                                                                                                                                                                                                                                                    |
| Bit 1(0x02) |                  -                  | Unused, always ‘0’                                                                                                                                                                                           |{% endif %}                                                                                                                                                                                                                                                                                                                                                                                       |
| Bit 0(0x01) |         Normal/Reverse Mode         | **[0]** Normal Mode: CCW(Positive), CW(Negative)<br />**[1]** Reverse Mode: CCW(Negative), CW(Positive)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |

{% if page.product_group=='dxl_mx2' or page.product_group=='dxl_x540' or page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' or page.product_group=='dxl_x430' or page.product_group=='dxl_xl430' %}
**NOTE** : Time-based Profile is available starting from **firmware V42**.
{: .notice}
{% else %}{% endif %}

{% if page.product_group=='xl330' or page.product_group=='xc330' or page.product_group=='dxl_x430' or page.product_group=='dxl_x540' or page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' or page.product_group=='dxl_xl430' %}
**NOTE**: Torque On by Goal Update is available starting from {{ firmware_version_torque_on_by_goal_update }}.
{: .notice}
{% else %}{% endif %}

{% capture notice_01 %}
**NOTE** : If the value of Bit 0(Normal/Reverse Mode) of Drive Mode(10) is set to `1`, rotational direction is inverted.  
Thus, {% if page.product_group=='dxl_mx2' or page.product_group=='dxl_x540'  or page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' %}**Position**, **Velocity**, **Current**, **PWM**{% else %}**Goal Position**, **Present Position**{% endif %} will also have inverted directions.
This feature can be very useful when configuring symmetrical joints, or similar mirrored DYNAMIXEL installations.
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

{% if page.ref=='mx-106' or page.product_group=='dxl_ex' %}
{% capture drivemode %}
**CAUTION** : When MX-106 and EX-106+ are set to Wheel Mode(endless), Normal/Reverse Mode is not available.  
Normal/Reverse Mode is activated under Joint Mode and Multi-turn Mode.  
Please refer to [CW/CCW Angle Limit](#cwccw-angle-limit6-8) for configuring Operation Type.
{% endcapture %}
<div class="notice--warning">{{ drivemode | markdownify }}</div>
{% else %}{% endif %}

{% if page.product_group=='dxl_x540' or page.product_group=='dxl_ex' or page.ref=='mx-106-2' or page.ref=='mx-106' %}
#### Dual Mode
Dual Mode is intended to combine two DYNAMIXEL into a single joint to enhance the performance.  
In order to use Dual Mode, Follower DYNAMIXEL should be connected to Leader DYNAMIXEL with the Sync Cable.  

Please note that the Follower DYNAMIXEL is directly controlled only by the PWM signal from the Leader DYNAMIXEL through the Sync Cable.  
Thus, {% if page.product_group=='dxl_ex' or page.ref=='mx-106' %}Goal Position, Moving Speed{% else %}Goal Position, Goal Velocity, Goal Current, Goal PWM{% endif %} of the Follower DYNAMIXEL are unused and ignored.

The rotational direction of Follower DYNAMIXEL is decided by **the type of Sync Cable** rather than the Normal/Reverse Mode setting of Follower DYNAMIXEL.  
The twisted sync cable will actuate the Follower DYNAMIXEL to the opposite direction of the Leader DYNAMIXEL while regular sync cable actuate to the same direction.
{: .notice}

{% if page.product_group=='dxl_x540' %}
![](/assets/images/dxl/x/x-series_dual_joint.png)
{% else %}
![](/assets/images/dxl/ex/ex-106_dual.png)
{% endif %}

|     Sync Cable     | Description                                                                                                                                               |
|:------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Regular Sync Cable | Follower DYNAMIXEL is controlled by the `PWM Signal` from the Leader DYNAMIXEL.<br>Leader and Follower DYNAMIXEL rotate in the **same direction**.              |
| Twisted Sync Cable | Follower DYNAMIXEL is controlled by the `Inverted PWM Signal` from the Leader DYNAMIXEL.<br>Leader and Follower DYNAMIXEL rotate in the **opposite direction**. |

{% capture dual_frame %}
**CAUTION** : If Leader and Follower are not physically connected by frame, both DYNAMIXEL may not perfectly synchronized due to the load applied on each DYNAMIXEL.  
Please use appropriate frame to connect DYNAMIXEL in Dual Mode.
{% if page.product_group=='dxl_x540' %}
![](/assets/images/dxl/x/x-series_dual_joint_frame.png)
{% else %}
![](/assets/images/dxl/ex/ex-106+_fr08-h110_fr08-d101.png)
{% endif %}
{% endcapture %}
<div class="notice--warning">{{ dual_frame | markdownify }}</div>

{% else %}{% endif %}
