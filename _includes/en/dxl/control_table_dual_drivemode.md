{% if page.product_group=='dxl_mx2' %}Drive Mode is availabe from the firmware version 39. 
{% endif %}

|    Bit    |                  Item                  |                                                                                                      Description                                                                                                      |
|:---------:|:--------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| Bit 3 ~ 7 |                  N/A                   |                                                                                                  Unused, always '0'                                                                                                   |
|   Bit 2   |         Profile configuration         | Velocity-based Profile('0') : Create a Profile based on Velocity<br />Time-based Profile('1') : Create a Profile based on time<br />※ Please refer to [Profile Velocity(112)](#profile-velocity112) for more details. |
|   Bit 1   | Master/Slave Setting<br />(Dual Joint) |                                                            Master Mode(0): Operate as a Master Dynamixel<br />Slave Mode(1): Operate as a Slave Dynamixel                                                             |
|   Bit 0   |         Direction of Rotation          |                                                             Normal Mode(0): CCW(Positive), CW(Negative)<br />Reverse Mode(1): CCW(Negative), CW(Positive)                                                             |

**NOTE** : Time-based Profile is available from the firmware version 42.
{: .notice}
**NOTE** : Setting Reverse mode('1') for Direction of Rotation, DYNAMIXEL will switch rotating direction.  
Therefore the direction of Position, Velocity, Current, PWM will be affected.  
This feature can be very useful when configuring symmetrical joint system or wheel system.
{: .notice}

Master/Slave configuration (Dual joint) is a method to simultaneously control two Dynamixels like one Dynamixel. Master Dynamixel and Slave Dynamixel must be connected with a sync cable. Slave Dynamixel is directly controlled by the Master Dynamixel’s PWM signal transmitted through the sync cable. Therefore, the Slave Dynamixel’s Goal Position, Goal Velocity, Goal Current and Goal PWM are ignored.

![](/assets/images/dxl/ex/ex-106_dual.png)

|Sync Cable|Description|
| :---: | :---: |
|Normal Mode Sync Cable|Slave Dynamixel is controlled by the Master Dynamixel’s PWM signal. Slave Dynamixel rotates to the same direction of the Master Dynamixel.|
|Reverse Mode Sync Cable|Slave Dynamixel is controlled by the inverted PWM signal of the Master Dynamixel. Slave Dynamixel rotates to the opposite direction of the Master Dynamixel.|

**NOTE** : In a dual master-slave configuration position information from the slave is ignored and the position of the dual configuration is based on the master in PWM control. When master and slave are not physically connected there could be a slight difference on the driven load. Use the frame shown in the below image to achieve dual configuration.  
![](/assets/images/dxl/ex/ex-106+_fr08-h110_fr08-d101.png)  
Please refer to [Connector Information](#connector-information) for cable assembly.  
{: .notice}
