| Packet Type      | P1   | P2 ~ P5                                | Description                                                                            |
|:----------------:|:----:|:--------------------------------------:|:--------------------------------------------------------------------------------|
| Multi-Turn Clear | 0x01 | Fixed value<br />(0x44 0x58 0x4C 0x22) | Sets the current position (Present Position) value to an absolute position within one revolution based on the motor. Can be cleared only when the motor is not in motion.<br />If the Clear Instruction Packet is sent while Torque Enable is active, the Error field in the Status Packet will display Result Fail (0x01). |
| Error Clear      | 0x02 | Fixed value<br />(0x45 0x52 0x43 0x4C) | Clear errors that occurred in DYNAMIXEL.<br />If an error cannot be cleared or the conditions for clearance are not met, the error remains uncleared, and Result Fail (0x01) is displayed in the Error field of the Status Packet. |



## [Multi-Turn Clear Packet](#multi-turn-clear-packet)

DYNAMIXEL-Y is capable of backing up Multi-Turn information, ensuring that it is preserved even after a power outage. A Multi-Turn Clear Packet is required to reset this value. After Multi-Turn Clear, DYNAMIXEL will undergo a reboot.  
After replacing the Multi-Turn backup battery, it is essential to perform this process to ensure normal operation.


**Note**: Multi-Turn Clear resets the absolute position value to within one motor revolution. Models with an attached reducer may lose their reducer-based absolute position. Please set the absolute position of the reducer to 0 and proceed with Multi-Turn Clear.
{: .notice}

### [Multi-Turn Clear Method](#multi-turn-clear-method)

![](/assets/images/dxl/y/multi-turn_clear_guide.PNG)

1. Click the 'Packet' button at the top of DYNAMIXEL Wizard 2.0 to open the packet window. If connected to DYNAMIXEL, click 'Disconnect' to terminate the connection.
2. Set the COM Port and Baud Rate, then click the 'Open' button.
3. Select 'Clear Instruction' from the Instruction tab.
4. Enter the correct DYNAMIXEL ID and click the 'Send' button to transmit the packet.
5. Wait until the Status Packet is received. Check the received packet for errors.


**Note**: For more detailed information, please refer to [DYNAMIXEL Wizard 2.0] and [DYNAMIXEL Protocol 2.0] 
{: .notice}

## [Error Clear Packet](#error-clear-packet)

If an error occurs in DYNAMIXEL-Y, it can be cleared.  
If the [Error Code(153)] is not 0, Error Clear can be initialized using the [Clear Instruction Packet]. If initialization is not possible, the Error field in the Status Packet will result in Fail (0x01).  

# [Multi-Turn backup Battery Replacement](#multi-turn-backup-battery-replacement)

DYNAMIXEL-Y features an internal battery for Multi-Turn Position Backup. After replacing the battery, it is necessary to perform the Multi-Turn Clear operation to reset the Multi-Turn settings for proper operation.

## [Procedure for Battery Replacement](#procedure-for-battery-replacement)

![](/assets/images/dxl/y/brtterry_replacement_guide_en.png)

1. Prepare the DYNAMIXEL-Y and a new battery.
2. After supplying power and searching for DYNAMIXEL-Y through DYNAMIXEL Wizard 2.0, click
   Tools → Encoder Battery Replacement menu. 
3. In the case of a reducer model, check if the origin position matches and click the Next button. 
   (If the origin position doesn't match, please adjust it accordingly.)
4. Open the battery cover, replace it with a new battery, close the cover, and click the Next button.
5. Wait for the operation to proceed. 
6. Once finished, exit the menu by clicking the OK button.



[DYNAMIXEL Wizard 2.0]: https://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_wizard2/
[Dynamixel Protocol 2.0]: https://emanual.robotis.com/docs/en/dxl/protocol2/
[Clear Instruction Packet]: https://emanual.robotis.com/docs/en/dxl/protocol2/#clear-0x10