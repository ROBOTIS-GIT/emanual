### [UART Connection Circuit Diagram](#uart-connection-circuit-diagram)
DYNAMIXEL-Y servos require half-duplex RS-485 communications for control. In order to utilize a full-duplex RS-485 network to control DYNAMIXEL actuators a half-duplex conversion circuit is required. The diagram below details the recommended circuit diagram for half-duplex conversion.

![](/assets/images/dxl/y/uart_connection.PNG)

**Note**: The circuit above is suitable for MCUs with a 5V logic level, or which are otherwise 5V tolerant. For devices using other logic levels, use a Level Shifter to match the required operating voltage.
{: .notice}

The above circuit is integrated into ROBOTIS' DYNAMIXEL controllers. In the provided circuit diagram, the direction of the data signal of the TxD and RxD lines is determined based on the level of TX_Enable_5V.
- If TX_Enable_5V = High : The TxD signal is transferred to D+ and D-
- If TX_Enable_5V = Low : The D+ and D- signals are transferred to RxD
