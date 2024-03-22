

### [UART Connection Circuit Diagram](#uart-connection-circuit-diagram)
To control DYNAMIXEL-Y with a custom made Main Controller, the signal of the Main Controller UART should be converted into RS-485. Below is the recommended circuit diagram.

![](/assets/images/dxl/y/uart_connection.PNG)

**Note**: The circuit above is suitable for MCUs that use 5V power or when the IO is 5V tolerant. For other cases, use a Level Shifter to match the voltage.
{: .notice}

The above circuit is integrated into DYNAMIXEL-exclusive controllers. In the provided circuit diagram, the direction of the data signal of TTL Level TxD and RxD is determined based on the level of TX_Enable_5V as indicated below.
- If TX_Enable_5V =High : The TxD signal is transferred to D+ and D-
- If TX_Enable_5V =Low : The D+ and D- signals are transferred to RxD


