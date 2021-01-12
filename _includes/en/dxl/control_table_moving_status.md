The Moving Status(123), one byte data, provides additional information about the movement.  
Following Error(0x08) and In-Position(0x01) are available under **Position Control Mode**, **Extended Position Control Mode**{% if page.product_group!='dxl_xl430' %}, **Current-based Position Control Mode**{% else %}{% endif %}.

For more details about the mode, see the [Operating Mode(11)].

|      Bit       |        Value         |   Information    | Description                                                                                                                |
|:--------------:|:--------------------:|:----------------:|:---------------------------------------------------------------------------------------------------------------------------|
|     Bit 7      |          X           |        -         | Reserved                                                                                                                   |
|     Bit 6      |          X           |        -         | Reserved                                                                                                                   |
| Bit 4<br>Bit 5 | 11<br>10<br>01<br>00 | Velocity Profile | 11 : [Trapezoidal Profile]<br />10 : Triangular Profile<br />01 : [Rectangular Profile]<br />00 : Profile not used([Step]) |
|     Bit 3      |        0 or 1        | Following Error  | DYNAMIXEL is following the desired position trajectory<br>0 : Following<br>1 : Not following                               |
|     Bit 2      |          X           |        -         | Reserved                                                                                                                   |
|     Bit 1      |        0 or 1        | Profile Ongoing  | Profile is in progress with [Goal Position(116)](#goal-position116) instruction<br>0 : Profile completed <br>1 : Profile in progress  |
|     Bit 0      |        0 or 1        |   In-Position    | DYNAMIXEL has arrived to the desired position<br>0 : Not arrived<br>1 : Arrived                                            |

**NOTE** : The Triangular velocity profile is configured when Rectangular velocity profile cannot reach to the [Profile Velocity(112)](#profile-verlocity112).
{: .notice}

**NOTE** : In-Position bit will be set when the positional deviation is smaller than a predefined value under Position related control modes.
{: .notice}

[Trapezoidal Profile]: #what-is-the-profile
[Step]: #what-is-the-profile
[Rectangular Profile]: #what-is-the-profile
