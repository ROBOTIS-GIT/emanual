A collection of various DYNAMIXEL configuration settings.

|     Value   |      Operating Mode      | Description                                                                                                        |
|:-----------:|:------------------------:|:-------------------------------------------------------------------------------------------------------------------|
| Bit 7(0x80) |            -             | Unused, always ‘0’ ‘0’                                                                                             |
| Bit 6(0x40) |     Dynamic Brake ON     | **[0]** Dynamic Brake OFF: Deactivate Dynamic Brake when torque is off.<br />**[1]** Dynamic Brake ON: Activate Dynamic Brake when torque is off.  |
| Bit 5(0x20) |            -             | Unused, always ‘0’ ‘0’                                                                                             |
| Bit 4(0x10) |            -             | Unused, always ‘0’ ‘0’                                                                                             |
| Bit 3(0x08) |            -             | Unused, always ‘0’ ‘0’                                                                                             |
| Bit 2(0x04) |  Profile Configuration   | **[0]** Velocity-based Profile: Create profiles based on velocity.<br />**[1]** Time-based Profile: Create profiles based on time.<br />※ For more details, refer to the [Profile](#profile) section of the eManual. |
| Bit 1(0x02) |            -             | Unused, always ‘0’ ‘0’                                                                                             |
| Bit 0(0x01) |   Normal/Reverse Mode    | **[0]** Normal Mode: Counter-clockwise (CCW) is positive, clockwise (CW) is negative.<br />**[1]** Reverse Mode: Clockwise (CW) is positive, counter-clockwise (CCW) is negative.  |
