{% assign bus_watchdog= "[Bus Watchdog(8)]" %}
{% assign torque_enable= "[Torque Enable(512)]" %}
{% assign goal_pwm= "[Goal PWM(524)]" %}
{% assign goal_current= "[Goal Current(526)]" %}
{% assign goal_velocity= "[Goal Velocity(528)]" %}
{% assign goal_position= "[Goal Position(532)]" %}
{% assign operating_mode= "[Operating Mode(33)]" %}

The {{ bus_watchdog }} serves as a fail-safe mechanism to halt the device in case communication between the controller and the device is interrupted.
When {{ torque_enable }} is '1' (Torque is ON), the {{ bus_watchdog }} feature monitors the interval of communication between the controller and the device. If the measured communication interval exceeds the configured {{ bus_watchdog }} timer, the DYNAMIXEL will stop moving to ensure safety.  
When this is triggered, the {{ bus_watchdog }} value changes to '-1' to indicate a Bus Watchdog Error. Once in the Bus Watchdog Error state, the Access attribute for Goal Values ({{ goal_pwm }}, {{ goal_current }}, {{ goal_velocity }}, {{ goal_position }} becomes Read-Only. Attempting to write a new value to these Goal Values will result in a Data Range Error, which will be indicated in the Status Packet's Error field. To resolve the Bus Watchdog Error, you must reset {{ bus_watchdog }} to '0' or use the Error Clear Packet to clear the error.


**Note** : For detailed information about Data Range Errors, please refer to the [DYNAMIXEL Protocol 2.0](https://emanual.robotis.com/docs/en/dxl/protocol2/#status-packet) eManual page.
{: .notice}

Here is an example of how the Bus Watchdog function operates:

{% capture bus_watchdog_ex1 %}
1. Set {{ operating_mode }} to Velocity Control Mode and change {{ torque_enable }} to '1'.
2. Write '50' to {{ goal_velocity }}, to have the actuator begin to rotate counterclockwise.
3. Change the value of {{ bus_watchdog }} to '100' (2,000 [ms]) to activate the Bus Watchdog feature. 
4. If no Instruction packet is received for 2,000 milliseconds, the device will come to a stop with a safe deceleration. 
5. The {{ bus_watchdog }} value is set to '-1' to indicate a Bus Watchdog Error, and the Access attribute of Goal Values becomes Read-Only. 
6. Writing '150' to {{ goal_velocity }}, will result in a Data Range Error being reported via the Status Packet. 
7. Change the value of {{ bus_watchdog }} to '0' to clear the Bus Watchdog Error. 
8. Write '150' to {{ goal_velocity }}, and the device starts rotating counterclockwise.
{% endcapture %}

<div class="notice--success">{{ bus_watchdog_ex1 | markdownify }}</div>
