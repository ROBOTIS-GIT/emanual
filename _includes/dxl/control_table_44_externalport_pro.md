Dynamixel PRO is equipped with multi-purpose expansion ports.

|Item|Range|
| :---: | :---: |
|Voltage| 0 ~ 3.3V|
|Current| 0 ~ 5mA|

- Analog input mode: analog values from an external port get converted to digital. These values are automatically updated in External port data(626 ~ 632).
- Output mode: can adjust external port voltage 0V or 3.3V. External port data value of 0 is 0V, 1 for 3.3V.
- Pull-up input mode: Verify port value of 0 or 1. External port data value changes by following voltage from expansion port; 0V to 0. 3.3V to 1. This becomes a weak pull-up. Depending on needs an external strong pull-up is acceptable.
- Pull-up output mode: Verify port value of 0 or 1. External port data value changes by following voltage from expansion port; 0V to 0. 3.3V to 1. This becomes a weak pull-down. Depending on needs an external strong pull-down is acceptable.

#### External expansion port location and pin function
Remove bolts and cover plate to reveal External Port connector.

![](/emanual/assets/images/dxl/pro/pro_external_port.png)

![](/emanual/assets/images/dxl/pro/pro_external_port_pinout.png)

|Pin 1|Pin 2|Pin 3|Pin 4|Pin 5|Pin 6|
| :---: | :---: | :---: | :---: | :---: | :---: |
|GND|3.3V|PORT1|PORT2|PORT3|PORT4|
