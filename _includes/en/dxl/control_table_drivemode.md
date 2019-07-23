{% if page.product_group=='dxl_x430' %}User can set Drive Mode of DYNAMIXEL by configuring the Bit of Drive Mode. Please read descriptions below about Drive Mode which is available from the firmware version 38.
{% else %}User can set Drive Mode of DYNAMIXEL by configuring Bit of Drive Mode. Please read descriptions below about Drive Mode. 
{% endif %}

|     Bit     |                Item                 | Description                                                                                                                                                                                                                                                                                                                                      |
|:-----------:|:-----------------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Bit 7(0x80) |                  -                  | Unused, always ‘0’                                                                                                                                                                                                                                                                                                                               |
| Bit 6(0x40) |                  -                  | Unused, always ‘0’                                                                                                                                                                                                                                                                                                                               |
| Bit 5(0x20) |                  -                  | Unused, always ‘0’                                                                                                                                                                                                                                                                                                                               |
| Bit 4(0x10) |                  -                  | Unused, always ‘0’                                                                                                                                                                                                                                                                                                                               |
| Bit 3(0x08) |                  -                  | Unused, always ‘0’                                                                                                                                                                                         |{% if page.product_group=='dxl_x430' or page.product_group=='dxl_x540' or page.product_group=='dxl_xl430' or page.ref=='mx-106-2' %} |
| Bit 2(0x04) |        Profile Configuration        | **[0]** Velocity-based Profile:  Create a Profile based on Velocity<br />**[1]** Time-based Profile: Create Profile based on time <br />※ Please refer to [Profile Velocity(112)](#profile-velocity112) |{% else %}                                                                                                                              |
| Bit 2(0x04) |                  -                  | Unused, always ‘0’                                                                                                                                                                                          |{% endif %}{% if page.product_group=='dxl_x540' or page.product_group=='dxl_ex' or page.ref=='mx-106-2' or page.ref=='mx-106' %}    |
| Bit 1(0x02) | Master/Slave Mode<br />(Dual Joint) | **[0]** Master Mode: Operate as a Master DYNAMIXEL.<br />**[1]** Slave Mode: Operate as Slave DYNAMIXEL                                                                                                          |{% else %}                                                                                                                     |
| Bit 1(0x02) |                  -                  | Unused, always ‘0’                                                                                                                                                                                           |{% endif %}                                                                                                                        |
| Bit 0(0x01) |         Normal/Reverse Mode         | **[0]** Normal Mode: CCW(Negative), CW(Positive)<br />**[1]** Reverse Mode: CCW(Positive), CW(Negative)                                                                                                                                                                                                                                          |


{% if page.product_group=='dxl_mx2' or page.product_group=='dxl_x540' or page.product_group=='dxl_x430' or page.product_group=='dxl_xl430' %}
**NOTE** : Time-based Profile is available from the firmware version 42.
{: .notice}
{% else %}{% endif %}

{% capture notice_01 %}
**NOTE** : Either setting Bit 0(0x01) as '0' or '1' under Drive Mode reverses the direction of DYNAMIXEL's rotation. Thus, {% if page.product_group=='dxl_mx2' or page.product_group=='dxl_x540' %}**Position**, **Velocity**, **Current**, **PWM**{% else %} **Goal Position**, **Present Position**{% endif %} will have a reversed direction of rotation by Drive Mode(10). 
This feature can be very useful when configuring symmetrical joint system or wheel system.
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

{% if page.ref=='mx-106' or page.product_group=='dxl_ex' %}
{% capture drivemode %}
**CAUTION** : When MX-106 and EX-106+ are set to Wheel Mode(endless), Normal/Reverse Mode isn't supported.    
Normal/Reverse Mode on MX-106 and EX-106+ is available for Joint Mode and Multi-turn Mode .  
Please refer to [CW/CCW Angle Limit](#cwccw-angle-limit6-8) for Operation Type(Wheel Mode, Joint Mode, Multi-turn Mode).
{% endcapture %}
<div class="notice--warning">{{ drivemode | markdownify }}</div>
{% else %}{% endif %}


{% if page.product_group=='dxl_x540' or page.product_group=='dxl_ex' or page.ref=='mx-106-2' or page.ref=='mx-106' %}
#### Dual Mode
Master/Slave configuration (Dual joint) is a method to simultaneously control two DYNAMIXELs like one DYNAMIXEL.  
In order to apply synchronized joints, Master DYNAMIXEL and Slave DYNAMIXEL must be connected by a Sync cable.  

Slave DYNAMIXEL is directly controlled by the Master Dynamixel’s PWM signal transmitted through the Sync cable. The Slave DYNAMIXEL's {% if page.product_group=='dxl_ex' or page.ref=='mx-106' %}Goal Position, Moving Speed {% else %}Goal Position, Goal Velocity, Goal Current and Goal PWM{% endif %} are ignored.

Slave DYNAMIXEL's rotation direction isn't related to Normal/Reverse Mode. The rotation direction is set by Sync cable type which is General and Twisted.

**General Sync Cable** sets the same direction as Master DYNAMIXEL.  
**Twisted Sync Cable** sets the opposite direction from Master DYNAMIXEL.
{: .notice}

{% if page.product_group=='dxl_x540' %}
![](/assets/images/dxl/x/x-series_dual_joint.png)
{% else %}
![](/assets/images/dxl/ex/ex-106_dual.png)
{% endif %}

| Sync Cable | Description                                                                                                                                                        |
|:---------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|        Regular        | Slave DYNAMIXEL is controlled by transmitted non inverted 'PWM Signal' through the Master DYNAMIXEL. <br>Master and Slave DYNAMIXEL rotate in the same direction.. |
|        Twisted        | Slave DYNAMIXEL is controlled by transmitted inverted 'PWM Signal' through the Master DYNAMIXEL. <br>Master and Slave DYNAMIXEL rotate in the opposite direction.  |

{% capture dual_frame %}
**CAUTION** : If Master and Slave are not physically connected by frame(FR08-D101 and FR08-H110), it may cause an unexpected operation because of driven load. Thus, the frame(FR08-D101 and FR08-H110) assembly is recommended for Dual Mode.
{% if page.product_group=='dxl_x540' %}
![](/assets/images/dxl/x/x-series_dual_joint_frame.png)
{% else %}
![](/assets/images/dxl/ex/ex-106+_fr08-h110_fr08-d101.png)
{% endif %}
{% endcapture %}
<div class="notice--warning">{{ dual_frame | markdownify }}</div>

{% else %}{% endif %}
