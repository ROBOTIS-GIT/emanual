Upon receiving an Instruction Packet, DYNAMIXEL servos wait for the Return Delay Time (9) to elapse before returning a Status Packet. The Return Delay Time can be set from 0 to 254, in units of 2 [μsec]. 
For example, if the value is set to 10, the Status Packet will be returned after a delay of 20 [μsec].


|   Unit   |  Range  |                  Description                         |
|:--------:|:-------:|:----------------------------------------------------:|
| 2 [μsec] | 0 ~ 254 | Default: ‘250’ (500[us])<br>Maximum: ‘254’ (508[us]) |


