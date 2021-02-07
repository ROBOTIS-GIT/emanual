장치는 동작 중에 발생하는 위험 상황을 감지하여 스스로를 보호할 수 있습니다.  
각 Bit의 기능은 ‘OR’의 논리로 적용되기 때문에 중복 설정이 가능합니다.  
즉, {% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' or page.product_group=='dxl_mx2' %} [Shutdown(18)] {% else %} [Shutdown(63)] {% endif %} 이 ‘0x05’ (2 진수: 00000101)로 설정되었을 경우, Input Voltage Error(2 진수 : 00000001)와 Overheating Error(2 진수 : 00000100)가 발생하는 것을 모두 감지할 수 있습니다.  
위험 상황이 감지되면, {% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' or page.product_group=='dxl_mx2' %} [Torque Enable(24)] {% else %} [Torque Enable(64)] {% endif %} 값이 ‘0’으로 변경되고 모터 출력은 0 [%]가 됩니다.  
제어기는 Status Packet의 Error 필드에 Alert Bit(0x80)이 설정되었는지를 확인하거나, Hardware Error Status(70)을 통해서 현재 상태를 확인할 수 있습니다.  
위험 상황이 감지된 후에는 REBOOT을 하지 않는 한, {% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' or page.product_group=='dxl_mx2' %} [Torque Enable(24)] {% else %} [Torque Enable(64)] {% endif %}을 ‘1’(Torque ON)로 설정할 수 없습니다.  
Shutdown(63)에서 감지할 수 있는 위험 상황은 아래 표와 같습니다.

|  Bit  |        항목         | 설명                                                                                     |
|:-----:|:-------------------:|:-----------------------------------------------------------------------------------------|
| Bit 7 |          0          | -                                                                                        |
| Bit 6 |  Instruction Error  | 정의되지 않은 Instruction이 전송된 경우, 또는 REG_WRITE명령없이 Action명령이 전달된 경우 |
| Bit 5 |   Overload Error    | 모터의 최대 출력으로 제어할 수 없는 하중이 지속적으로 적용되는 경우                      |
| Bit 4 |   CheckSum Error    | 전송된 Instruction Packet의 CheckSum이 맞지 않을 경우                                   |
| Bit 3 |     Range Error     | Instruction Packet(WRITE)으로 허용범위를 벗어난 값을 쓰려고 할 경우                |
| Bit 2 |  Overheating Error  | 내부 온도가 설정된 동작 온도 범위를 벗어난 경우                                          |
| Bit 1 |  Angle Limit Error  | 적용한 Goal Position이 설정한 CW/CCW Angle Limit 범위를 벗어난 경우                      |
| Bit 0 | Input Voltage Error | 인가된 전압이 설정된 동작 전압 범위를 벗어났을 경우                                      |

 {% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' or page.product_group=='dxl_mx2' %} [Shutdown(18)] {% else %} [Shutdown(63)] {% endif %}

[Shutdown(18)]: #shutdown 
[Shutdown(63)]: #shutdown
[Torque Enable(24)]: #torque-enable
[Torque Enable(64)]: #torque-enable
