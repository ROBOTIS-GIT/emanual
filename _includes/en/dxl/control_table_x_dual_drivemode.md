Drive Mode is availabe from the firmware version 38.

|Bit|Item|Description|
| :---: | :---: | :---: |
|Bit 2 ~ 7|N/A|Unused, always '0'|
|Bit 1|Master/Slave Setting<br />(Dual Joint)|Master Mode(0): Operate as a Master Dynamixel<br />Slave Mode(1): Operate as a Slave Dynamixel|
|Bit 0|Direction of Rotation|Normal Mode(0): CCW(Positive), CW(Negative)<br />Reverse Mode(1): CCW(Negative), CW(Positive)|

**NOTE** : Setting Reverse mode('1') for Direction of Rotation, DYNAMIXEL will switch rotating direction. Therefore the direction of Position, Velocity, Current, PWM will be affected. This feature can be very useful when configuring symmetrical joint system or wheel system.
{: .notice}

Master / Slave Configuration (Dual Joint) is intended to control two DYNAMIXELs as a single module.  
The Master DYNAMIXEL and the Slave DYNAMIXEL has to be interconnected with a Synchronization cable.  
The Slave DYNAMIXEL is controlled by the PWM signal sent from the Master DYNAMIXEL via the synchronization cable.  
Therefore, Goal Position, Goal Current, Goal PWM of the Slave DYNAMIXEL will be ignored in this mode.

![](/assets/images/dxl/x/x-series_dual_joint.png)

|Sync Cable|Description|
| :---: | :---: |
|General Mode|The Slave DYNAMIXEL is controlled by the PWM signal from the Master DYNAMIXEL.<br />Master / Slave DYNAMIXELs have an identical rotational direction.|
|Reverse Mode(Twisted)|The Slave DYNAMIXEL is controlled by inverted PWM signal from the Master DYNAMIXEL.<br />Master / Slave DYNAMIXELs have opposite rotational directions.|

**NOTE** : If Master / Slave DYNAMIXELs are not mechanically connected to each other, each DYNAMIXEL could have minor differences during operation. 
Please mount both DYNAMIXELs as shown in the below image.
{: .notice}

![](/assets/images/dxl/x/x-series_dual_joint_frame.png)
