{% if page.product_group=='dxl_mx2' %}Drive Mode is available from the firmware version 39.  
{% elsif page.product_group=='dxl_x430' %}Drive Mode is available from the firmware version 38.  
{% endif %}

|     Bit     |          Item          | Description                                                                                                                                                                                                           |
|:-----------:|:----------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Bit 7(0x80) |           -            | Unused, always '0'                                                                                                                                                                                                    |
| Bit 6(0x40) |           -            | Unused, always '0'                                                                                                                                                                                                    |
| Bit 5(0x20) |           -            | Unused, always '0'                                                                                                                                                                                                    |
| Bit 4(0x10) |           -            | Unused, always '0'                                                                                                                                                                                                    |
| Bit 3(0x08) |           -            | Unused, always '0'                                                                                                                                                                                                    |
| Bit 2(0x04) | Profile configureation | Velocity-based Profile('0') : Create a Profile based on Velocity<br />Time-based Profile('1') : Create a Profile based on time<br />※ Please refer to [Profile Velocity(112)](#profile-velocity112) for more details. |
| Bit 1(0x02) |           -            | Unused, always '0'                                                                                                                                                                                                    |
| Bit 0(0x01) | Direction of rotation  | Normal Mode(0): CCW(Positive), CW(Negative)<br />Reverse Mode(1): CCW(Negative), CW(Positive)                                                                                                                         |

**NOTE** : Time-based Profile is available from the firmware version 42.
{: .notice}                                                              
