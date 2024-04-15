## [Multi-Turn Clear Packet](#multi-turn-clear-packet)

DYNAMIXEL-Y is capable of backing up Multi-Turn position information, ensuring that it is preserved even after a power outage. A Multi-Turn Clear Packet is required to reset this value. After a Multi-Turn Clear, DYNAMIXEL will undergo a reboot.  
After replacing the Multi-Turn Backup Battery, it is essential to perform this process prior to resuming operation.

| Packet Type      | P1   | P2 ~ P5                                | Description                                                                            |
|:----------------:|:----:|:--------------------------------------:|:--------------------------------------------------------------------------------|
| Multi-Turn Clear | 0x01 | Fixed value<br />(0x44 0x58 0x4C 0x22) | Sets the current position (Present Position) value to an absolute position within one revolution based on the motor. Can be cleared only when the motor is not in motion.<br />If the Clear Instruction Packet is sent while Torque Enable is active, the Error field in the Status Packet will display Result Fail (0x01). |
| Error Clear      | 0x02 | Fixed value<br />(0x45 0x52 0x43 0x4C) | Clear errors that occurred in DYNAMIXEL.<br />If an error cannot be cleared or the conditions for clearance are not met, the error remains uncleared, and Result Fail (0x01) is displayed in the Error field of the Status Packet. |



**Note**: Multi-Turn Clear resets the motor's absolute position value to within one revolution. Models with an attached reducer may lose their reducer-based absolute position. To prevent this issue, move the reducer's absolute position to 0 before proceeding with the Multi-Turn Clear process.
{: .notice}

### [Multi-Turn Clear Method](#multi-turn-clear-method)

![](/assets/images/dxl/y/multi-turn_clear_guide.PNG)

1. Click the 'Packet' button at the top of DYNAMIXEL Wizard 2.0 to open the packet window. If connected to DYNAMIXEL, click 'Disconnect' to terminate the connection.
2. Select the COM Port and Baud Rate in use for your servos, then click the 'Open' button.
3. Select 'Clear Instruction' from the Instruction tab.
4. Enter the DYNAMIXEL ID for the servo you wish to clear and click the 'Send' button to transmit the packet.
5. Wait until the Status Packet is received. Check the received packet for errors before resuming operation of your servo.


**Note**: For more detailed information, please refer to the [DYNAMIXEL Wizard 2.0] and [DYNAMIXEL Protocol 2.0] eManual pages.
{: .notice}

## [Error Clear Packet](#error-clear-packet)

The Error Clear Packet can be used to clear the error state of a DYNAMIXEL Y actuator without requiring a restart of the device. When there is an active error registered to the device, it can be cleared using a [Clear Instruction Packet]. If the error is unable to be cleared, the returned status packet will indicate a Failed result (0x01).

# [Multi-Turn backup Battery Replacement](#multi-turn-backup-battery-replacement)

DYNAMIXEL-Y features an internal Multi-turn Backup Battery for Multi-Turn Position Backup. After replacing the battery, it is necessary to perform the Multi-Turn Clear operation to reset the Multi-Turn position to ensure accuracy.

## [Procedure for Battery Replacement](#procedure-for-battery-replacement)

![](/assets/images/dxl/y/brtterry_replacement_guide_en.png)

1. Prepare the DYNAMIXEL-Y and new Multi-turn Backup Battery.
2. After supplying power and connecting the DYNAMIXEL-Y to DYNAMIXEL Wizard 2.0, enter the
   Tools → Encoder Battery Replacement menu. 
3. In the case of a model with an included reducer, ensure that the reducer is positioned at it's origin point. (Position 0)
4. Open the battery cover, install the new Multi-turn Backup Battery, close the cover, and click the Next button.
5. Wait for the operation to complete. 
6. Once finished, exit the menu by clicking the OK button.



[DYNAMIXEL Wizard 2.0]: https://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_wizard2/
[Dynamixel Protocol 2.0]: https://emanual.robotis.com/docs/en/dxl/protocol2/
[Clear Instruction Packet]: https://emanual.robotis.com/docs/en/dxl/protocol2/#clear-0x10
