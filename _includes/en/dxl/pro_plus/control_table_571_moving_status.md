This value provides additional information about the movement. In-Position Bit(0x01) only works with Position Control Mode and Extended Position Control Mode.

||| Details     | Description     |
| :---: | :---: |:---: | :---: |
| Bit 7 | 0x80 | - | Unused |
| Bit 6 | 0x40 | - | Unused |
| Bit 5<br />~<br />Bit 4 | 0x30 | Profile Type(0x30)<br />Profile Type(0x10)<br />Profile Type(0x00)|Trapezoidal Velocity Profile<br />Rectangle Velocity Profile<br />Profile unused(Step)|
| Bit 3 | 0x08 | - | Unused |
| Bit 2 | 0x04 | - | Unused |
| Bit 1 | 0x02 | - | Unused |
| Bit 0 | 0x01 | In-Position | The device is reached to desired position |
