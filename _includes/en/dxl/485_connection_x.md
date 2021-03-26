<!-- 485 통신, X만 사용. -->

## [Communication Circuit](#communication-circuit)
To control the DYNAMIXEL actuators, the main controller needs to convert its UART signals to the half duplex type. The recommended circuit diagram for this is shown below.

### RS-485 Communication
![](/assets/images/dxl/x/x_series_485_circuit.jpg)

**NOTE**: Above circuit is designed for 5V or 5V tolerant MCU. Otherwise, use a Level Shifter to match the voltage of MCU.
{: .notice}

![](/assets/images/dxl/x/x_series_485_pin.png)

The power of DYNAMIXEL is supplied via Pin1(-), Pin2(+).  
(The above circuit is built into DYNAMIXEL's controller only)  
