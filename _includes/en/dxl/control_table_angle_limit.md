The angle limit allows the motion to be restrained.
The range and the unit of the value is the same as Goal Position(Address 30, 31).
- CW Angle Limit: the minimum value of Goal Position(Address 30, 31)
- CCW Angle Limit: the maximum value of Goal Position(Address 30, 31)
The following two modes can be set pursuant to the value of CW and CCW.

|Operation Type|CW / CCW|
| :-------------: | :-------------: |
|Wheel Mode|both are 0|
|Joint Mode|neither are 0|

The wheel mode can be used to wheel-type operation robots since motors of the robots spin infinitely. The joint mode can be used to multi-joints robot since the robots can be controlled with specific angles.
