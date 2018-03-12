This method is to give out commands at once to several robots being used for dance or demonstration
Gives out commands to the robot at once using the zigbee module’s broadcast mode

### Bioloid(Entry/Advanced)

- Communication with the Zig2Serial and carious robots

  ![Control_Multiple_Robots_01](/assets/images/edu/bioloid/bioloid_ctrl_multi_robot_01.png)

- Communication with the RC-100 and carious robots

  ![Control_Multiple_Robots_02](/assets/images/edu/bioloid/bioloid_ctrl_multi_robot_02.png)


1. To use the CM-5, connect the controller and ZIG-100 module together.
2. Use the RoboPlus Manager to set the wireless ID of ZIG-100 module on the opposite party’s robot to 65535.
3. No need to set the broadcast channel for communication.
4. Use the RC-100 to give commands directly or use the Zig2Serial to give commands using the PC.

|Device|Channel Default Value|Whether or not the channel can be changed|
|:---:|:---:|:---:|
|CM-5|1|Unchangeable|
|Zig2Serial|1|Changeable|
|RC-100|1|Changeable|

The channel for the ZIG-100 mounted on the CM-5 is unchangeable. Thus, all users must set their channel to #1 for broadcast communication. All channels for the devises must pair to communicate.
{: .notice}


### Bioloid Premium Kit(CM-700)

- Communication with the Zig2Serial and carious robots

  ![Control_Multiple_Robots_03](/assets/images/edu/bioloid/bioloid_ctrl_multi_robot_03.png)

- Communication with the RC-100 and carious robots

  ![Control_Multiple_Robots_04](/assets/images/edu/bioloid/bioloid_ctrl_multi_robot_04.png)


1. When using the CM-510/CM-700, connect the ZIG-100 module with the controller.
2. Use the RoboPlus Manager to change the opposite party’s wireless ID to 65535.
3. The channel on the ZIG-110 connected to the controller it set to #4, so the channels on the Zig2Serial and RC-100 must be set to #4.
4. [How to change the RC-100 channel]
5. [How to change the Zig2Serial channel]

|Device|Channel Default Value|Whether or not the channel can be changed|
|:---:|:---:|:---:|
|CM-510<br />CM530|4|Unchangeable|
|Zig2Serial|1|Changeable|
|RC-100|1|Changeable|

The channel for the zigbee connected to the controller is not changeable. Thus, all users must set their channel to #4 for broadcast communicationAll channels for the devises must pair to communicate.
{: .notice}

[How to change the RC-100 channel]: /docs/en/parts/communication/rc-100/#how-to-set-broadcasting-channel
[How to change the Zig2Serial channel]: /docs/en/parts/communication/zig2serial/#select-broadcast-channel
