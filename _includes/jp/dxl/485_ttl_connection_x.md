## [通信回路](#通信回路)
DYNAMIXEL アクチュエータを制御するには、メインコントローラがそのUART信号を半二重タイプに変換する必要があります。 このための推奨回路図を以下に示します。

### TTL 通信
![](/assets/images/dxl/ttl_circuit.png)

![](/assets/images/dxl/x/x_series_ttl_pin.png)

### RS-485 通信
![](/assets/images/dxl/x/x_series_485_circuit.jpg)

**NOTE**: Above circuit is designed for 5V or 5V tolerant MCU. Otherwise, use a Level Shifter to match the voltage of MCU.
{: .notice}

![](/assets/images/dxl/x/x_series_485_pin.png)

DYNAMIXELの電力は、Pin1（-）、Pin2（+）を介して供給されます。
(上記の回路は、DYNAMIXELのみのコントローラーに組み込まれています。)  
上記の回路図では、TTLレベルのTxDおよびRxDのデータ信号の方向は、次のようにTX_Enable_5Vのレベルに応じて決定されます。  
TX_Enable_5V レベルがHighの場合：TxDの信号がD+およびD-に出力されます。 
TX_Enable_5V レベルがLowの場合：D+およびD-の信号は、RxDに出力されます。

{% include jp/dxl/pinout_warning.md %}
