Moving Status(123) is a collection of bits that provide additional information about the DYNAMIXEL's current motion status. 

|      Bit       |        Value         |   Information    | Description                                                                                                                |
|:--------------:|:--------------------:|:----------------:|:---------------------------------------------------------------------------------------------------------------------------|
|     Bit 7      |          X           |        -         | Reserved for future use                                                                                                    |
|     Bit 6      |          X           |        -         | Reserved for future use                                                                                                    |
| Bit 4<br>Bit 5 | 11<br>10<br>01<br>00 | Velocity Profile | 11 : [Trapezoidal Profile]<br />10 : Triangular Profile<br />01 : [Rectangular Profile]<br />00 : Profile not used([Step]) |
|     Bit 3      |        0 or 1        | Following Error  | Whether or not the DYNAMIXEL is following the desired position trajectory<br>0 : Following<br>1 : Not following                               |
|     Bit 2      |          X           |        -         | Reserved for future use                                                                                                    |
|     Bit 1      |        0 or 1        | Profile Ongoing  | A Profile is in progress following a [Goal Position(116)](#goal-position116) instruction update<br>0 : Profile completed <br>1 : Profile in progress  |
|     Bit 0      |        0 or 1        |   In-Position    | Whether or not the DYNAMIXEL has arrived to the desired [Goal Position(116)](#goal-position116)<br>0 : Not arrived<br>1 : Arrived                                            |

Following Error(0x08) and In-Position(0x01) are available when using {% if page.product_group!='dxl_xl430' %}, **Current-based Position Control Mode**{% else %}{% endif %}**Position Control Mode**, and **Extended Position Control Mode**.

For more details about these operating modes, see [Operating Mode(11)].
**NOTE** : A Triangular velocity profile is when a configured Rectangular velocity profile cannot reach the configured [Profile Velocity(112)](#profile-verlocity112).
{: .notice}

**NOTE** : The In-Position bit will be set when the positional deviation is smaller than a predefined value when in Position related control modes.
{: .notice}

[Trapezoidal Profile]: #what-is-the-profile
[Step]: #what-is-the-profile
[Rectangular Profile]: #what-is-the-profile
