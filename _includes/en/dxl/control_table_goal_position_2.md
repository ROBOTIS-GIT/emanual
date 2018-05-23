Target position can be set with Goal Position(116). From the front view of Dynamixels, CCW is an increasing direction whereas CW is a decreasing direction. The way to reaching Goal Position(116) is differ by 4 Profiles provided by Dynamixels. Please refer to the Profile Velocity(112) for more details.

![](/assets/images/dxl/x/dxl_goal_position.jpg)

| Mode     | Values     | Description |
| :--------: | :--------: | :--------: |
| Position Control Mode | Min Position Limit(52) ~ Max Position Limit(48)| Initial Value : 0 ~ 4,095|
|Extended Position Control Mode|-1,048,575 ~ 1,048,575|-256[rev] ~ 256[rev]|
|Current-based Position Control Mode|-1,048,575 ~ 1,048,575|-256[rev] ~ 256[rev]|

|Degree Conversion Constant|Description|
| :---: | :---: |
|0.088&deg;/Value| 1[rev] : 0 ~ 4,095 |

**NOTE** : If Profile Acceleration(108), Profile Velocity(112) and Goal Position(116) are modified simultaneously, Goal Position(116) is processed based on updated Profile Acceleration(108) and Profile Velocity(112).
{: .notice}
