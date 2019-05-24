Desired position can be set with Goal Position(116). From the front view of Dynamixels, CCW is an increasing direction whereas CW is a decreasing direction. The way to reaching Goal Position(116) is differ by 4 Profiles provided by Dynamixels. Please refer to the Profile Velocity(112) for more details.

![](/assets/images/dxl/x/dxl_goal_position.jpg)

| Mode     | Values     | Description |
| :--------: | :--------: | :--------: |
| Position Control Mode | Min Position Limit(52) ~ Max Position Limit(48)| Initial Value : 0 ~ 4,095|
|Extended Position Control Mode|-1,048,575 ~ 1,048,575|-256[rev] ~ 256[rev]|{% if page.product_group!='dxl_xl430' and page.ref!='mx-28-2' %}
|Current-based Position Control Mode|-1,048,575 ~ 1,048,575|-256[rev] ~ 256[rev]|{% else %}{% endif %}

|Degree Conversion Constant|Description|
| :---: | :---: |
|0.088&deg;/Value| 1[rev] : 0 ~ 4,095 |

**NOTE** : Profile Velocity(112) and [Profile Acceleration(108)] are applied in below cases:  
In Position Control Mode, Profile Velocity(112) and [Profile Acceleration(108)] are used to create a new profile when Goal Position(116) is updated.  
In Velocity Control Mode, [Profile Acceleration(108)] is used to create a new profile when Goal Velocity(104) is updated.
{: .notice}
