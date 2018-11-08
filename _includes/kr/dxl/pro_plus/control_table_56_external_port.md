다용도로 사용 가능한 External Port를 제공합니다.  
External Port의 용도는 External Port Mode(56 ~ 59)에 의해서 결정되고, External Port의 신호는 External Port Data(600 ~ 607)에 의해서 제어됩니다.  
External Port Data를 통해서 External Port의 신호를 제어하거나, External Port 신호의 상태를 확인할 수 있습니다.  
External Port는 전기적으로 절연되어 있지 않기 때문에, 전기적 사양을 준수하시기 바랍니다.  
쉴드 케이블(Shield cable)이나 트위스트 케이블(Twist pair cable)을 사용하실 경우, 보다 정밀한 측정이 가능합니다. 케이블 길이는 짧을수록 정밀한 측정에 유리합니다.

| 항목  | 사양                               |
| :---: | :--------------------------------: |
| 전압  | 0 ~ 3.3 [V]<br />VESD(HBM) : 2[kV] |
| 전류  | 0 ~ 5 [mA]                         |

※ VESD(HBM) : ESD(Electrostatic Discharge) Voltage(human body model)

| 명칭                     | External Port Mode      | External Port Data                                                                      | 접근   | 비고                                                                                                            |
| :----------------------  | :---------------------: | :-------------------------------------------------------------------------------------  | :----: | :-------------------------------------------------------------------------------------------------------------: |
| Analogue Input           | 0                       | External Port 신호(signal)를 Digital로 변환<br />External Data = signal x (4,095 / 3.3) | R      | Resolution : 12[bit] (0 ~ 4,095)                                                                                |
| Digital Output Push-Pull | 1                       | 0 : External Port의 출력을 0[V]로 변경<br />1 : External Port의 출력을 3.3[V]로 변경    | W      | Output High level(VOH) : 2.4 [V] (min)<br />Output Low level(VOL) : 0.5 [V] (max)                               |
| Digital Input Pull-Up    | 2                       | 0 : External Port의 입력이 0[V]<br />1 : External Port의 입력이 3.3[V] 또는 Open        | R      | Input High level(VIH) : 2.3 [V] (min)<br />Input Low level(VIL) : 1.0 [V] (max)<br />Pull-Up : 40 [k&Omega;] (typ)   |
| Digital Input Pull-Down  | 3 (초기값)              | 0 : External Port의 입력이 0[V] 또는 Open <br />1 : External Port의 입력이 3.3[V]       | R      | Input High level(VIH) : 2.3 [V] (min)<br />Input Low level(VIL) : 1.0 [V] (max)<br />Pull-Down : 40 [k&Omega;] (typ) |

{% capture control_table_externalportdata_warning %}
**경고** : External Port 는 전기적으로 절연되어 있지 않기 때문에, 전기적 사양을 준수하시기 바랍니다.  
전기적 사양을 초과하거나 신호 연결에 문제가 있는 경우, Dynamixel이 손상될 수 있으므로 각별한 주의가 요구됩니다. External Port를 사용할 때 다음 사항들을 주의하시기 바랍니다.
- 정전기(ESD), 단락(Short circuit), 단선(Open circuit) 등에 의한 전기적인 충격이 발생하지 않도록 주의해 주십시오.
- External Port 커넥터로 물이나 먼지가 유입되지 않도록 주의해 주십시오.
- External Port를 사용하지 않을 때는 케이블을 제거해 주십시오.
- External Port에 신호를 연결/해제 할 때는 전원이 꺼진 상태에서 진행해 주십시오.
- External Port 의 GNDext 핀과 Dynamixel 커넥터의 GND핀을 직접 연결하지 마십시오. 전원 노이즈가 External Port로 유입될 수 있습니다.
{% endcapture %}

<div class="notice--warning">{{ control_table_externalportdata_warning | markdownify }}</div>


#### 외부 확장 포트의 위치 및 핀 기능
아래와 같이 나사를 제거하고 커버를 들어내면 외부 확장 포트가 드러납니다.

![](/assets/images/dxl/pro_plus/external_port.png)

![](/assets/images/dxl/pro_plus/external_port_pinout.png)

|핀 1|핀 2|핀 3|핀 4|핀 5|핀 6|
| :---: | :---: | :---: | :---: | :---: | :---: |
|GND|3.3V|PORT1|PORT2|PORT3|PORT4|
