The device can protect itself by detecting dangerous situations that could occur during the operation.  
Each Bit is inclusively calculated with the ‘OR’ logic, therefore, multiple options can be generated.  
For instance, when ‘0x05’ (binary : 00000101) is defined as [Shutdown(63)] condition, the device can detect both Input Voltage Error(binary : 00000001) and Overheating Error(binary : 00000100).  
If those errors are detected, [Torque Enable(512)] is reset to ‘0’ and the motor output becomes 0 [%].  
Controllers can identify the error status by checking Alert Bit(0x80) in the Error field of the Status Packet, or reading [Hardware Error Status(518)] of the device.  
In order to turn on the torque of the device in shutdown status, REBOOT has to be performed first. The followings are detectable situations.

|  Bit  |               Item               | Description                                                                     |
|:-----:|:--------------------------------:|:--------------------------------------------------------------------------------|
| Bit 7 |                -                 | Not used, always '0'                                                            |
| Bit 6 |                -                 | Not used, always '0'                                                            |
| Bit 5 |     Overload Error(Default)      | Detect persistent load that exceeds maximum output                              |
| Bit 4 | Electrical Shock Error(Default)  | Detect electric shock on the circuit or insufficient power to operate the motor |
| Bit 3 |   Motor Encoder Error(Default)   | Detect malfunction of the motor encoder                                         |
| Bit 2 |        OverHeating Error         | Detect internal temperature exceeds the configured operating temperature        |
| Bit 1 | Motor Hall Sensor Error(Default) | Motor hall sensor value exceeds normal range                                    |
| Bit 0 |       Input Voltage Error        | Detect input voltage exceeds the configured operating voltage                   |

{% capture shutdown_pro %}
**NOTE** :
1. If Shutdown occurs, use below method to reboot the device.
    - H/W REBOOT : Turn off and turn on the power again
    - S/W REBOOT : Transmit REBOOT Instruction (For more details, please refer to the [Reboot](/docs/en/dxl/protocol2/#reboot) section of e-Manual.)
2. If Shutdown occurs, LED will flicker every second.
3. If Shutdown occurs, Dynamic brake will be activated.
{% endcapture %}

<div class="notice">{{ shutdown_pro | markdownify }}</div>
