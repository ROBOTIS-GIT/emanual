The Bus Watchdog (8) serves as a safety mechanism (fail-safe) to halt the device in case communication  between the controller and the device is interrupted due to an error.  
When Torque Enable (512) is '1' (Torque ON), the Bus Watchdog feature monitors the interval of communication between the controller and the device. If the measured communication interval exceeds the configured Bus Watchdog (8) timer, the DYNAMIXEL will stop moving to ensure safety.  
When this is triggered, the Bus Watchdog (8) value changes to '-1' to indicate a Bus Watchdog Error. Once in the Bus Watchdog Error state, the Access attribute for Goal Values (Goal PWM (524), Goal Current (526), Goal Velocity (528), Goal Position (532)) becomes Read-Only. Attempting to write a new value to these Goal Values will result in a Data Range Error, which will be indicated in the Status Packet's Error field. To resolve the Bus Watchdog Error, you must reset Bus Watchdog (8) to '0' or use the Error Clear Packet to clear the error.


**Note** : For detailed information about Data Range Errors, please refer to the [DYNAMIXEL Protocol 2.0](https://emanual.robotis.com/docs/en/dxl/protocol2/#status-packet) eManual page.
{: .notice}

Here is an example of how the Bus Watchdog function operates:

{% capture bus_watchdog_ex1 %}
1. After setting Operating Mode (33) to Velocity Control Mode and changing Torque Enable (512) to '1'.
2. Write '50' to Goal Velocity (528), and the device starts rotating counterclockwise.
3. Change the value of Bus Watchdog (546) to '100' (2,000 [ms]) to activate the Bus Watchdog feature. 
4. If no Instruction packet is received for 2,000 milliseconds, the device comes to a stop with a safe deceleration. 
5. Bus Watchdog (8) value is set to '-1' (Bus Watchdog Error), and the Access attribute of Goal Values becomes Read-Only. 
6. Write '150' to Goal Velocity (528), and a Data Range Error is reported via the Status Packet. 
7. Change the value of Bus Watchdog (8) to '0' to clear the Bus Watchdog Error. 
8. Write '150' to Goal Velocity (528), and the device starts rotating counterclockwise.
{% endcapture %}

<div class="notice--success">{{ bus_watchdog_ex1 | markdownify }}</div>