When the value of [Torque Enable(512)] is changed from '1' (Torque ON) to '0' (Torque OFF), the device stops its operation and cuts off the signal supplied to the inverter. If the device is rotating, it slows the rotation speed to zero according to the duration specified by Safe Stop Time (104) to prevent damage. 

| Unit |   Range      | Initial Value |
|:----:|:------------:|:-------------:|
| [ms] | 0 ~ 32,767   |   200         |


**Note** : In Current Control mode, only Dynamic Brake deceleration is used.
{: .notice}
