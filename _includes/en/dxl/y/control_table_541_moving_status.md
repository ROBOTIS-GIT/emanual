Provides additional information about movement. The In-Position Bit(0x01) is only used in position control mode.

|     Value    |        Item       |    Description                                                                                                                            |
| :----------: | :---------------: | :---------------------------------------------------------------------------------------------------------------------------------------- |
| Bit 7 (0x80) | -                 | Unused, always ‘0’ ‘0’                                                                                                                    |
| Bit 6 (0x40) | Position In Range | Whether the current position is within the range of [Min Position limit(84)] ~ [Max position limit(76)] <br />0 : Out of the Limit Range<br />1 : Within the Limit Range |
| Bit 5 (0x40)<br /><br />Bit 4 (0x40) | Profile type(H)<br /><br />Profile type(L)   | The current profile type in use<br />11 : Trapezoidal profile<br />10 : Triangular profile<br />01 : Rectangular profile<br />00 : Profile unused (Step) |
| Bit 3 (0x08) | Following error   | Whether or not the [Position Trajectory(532)] is being followed<br />0 : Follow<br />1 : Following error                                  |
| Bit 2 (0x04) | Moving            | Whether the device is rotating<br />0 : Standby status<br />1 : Movement detected                                                         |
| Bit 1 (0x02) | Profile ongoing   | Whether the profile is in progress according to the [Goal Position(532)] command<br />0 : Profile complete<br />1 : Profile in progress   |
| Bit 0 (0x01) | In-Position       | Whether the [Goal Position(532)] has been reached<br />0 : Not reached<br />1 : Reached                                                   |
 
**Note** : A triangular velocity profile is set when the [Profile Velocity(244)] is not reached under trapezoidal velocity profile conditions.
{: .notice}
