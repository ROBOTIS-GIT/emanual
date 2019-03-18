This value provides additional information about the movement. Following Error Bit(0x08) and In-Position Bit(0x01) only work with Position Control Mode, Extended Position Control Mode{% if page.product_group!='dxl_xl430' %}, Current-based Position Control Mode{% else %}{% endif %}.


||| Details     | Description     |
| :---: | :---: |:---: | :---: |
| Bit 7 | 0x80 | - | Unused |
| Bit 6 | 0x40 | - | Unused |
| Bit 5<br />~<br />Bit 4 | 0x30 | Profile Type(0x30)<br />Profile Type(0x20)<br />Profile Type(0x10)<br />Profile Type(0x00)|Trapezoidal Velocity Profile<br />Triangular Velocity Profile<br />Rectangular Velocity Profile<br />Profile is not used|
| Bit 3 | 0x08 | Following Error | Dynamixel fails to reach desired position trajectory |
| Bit 2 | 0x04 | - | Unused |
| Bit 1 | 0x02 | Profile Ongoing | Profile is in progress with Goal Position(116) instruction |
| Bit 0 | 0x01 | In-Position | Dynamixel is reached to desired position |

**NOTE** : Triangular velocity profile is configured when Rectangular velocity profile cannot reach to the Profile Velocity(112).
{: .notice}
