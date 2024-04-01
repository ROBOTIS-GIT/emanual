Return Delay Time allows the configuration of the delay time between a DYNAMIXEL receiving and executing an instruction packet and returning a status packet, in increments of two microseconds.
For example, if the value is set to 10, a Status Packet will be returned after a delay of 20 microseconds.

|   Unit   |  Range  |                  Description                         |
|:--------:|:-------:|:----------------------------------------------------:|
| 2 [μsec] | 0 ~ 254 | Default: ‘250’ (500[us])<br>Maximum: ‘254’ (508[us]) |
