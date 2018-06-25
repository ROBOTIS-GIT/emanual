장치는 동작 중에 발생하는 위험 상황을 감지하여 스스로를 보호할 수 있습니다.  
각 Bit의 기능은 ‘OR’의 논리로 적용되기 때문에 중복 설정이 가능합니다.  
즉, Shutdown(63)이 ‘0x05’ (2 진수: 00000101)로 설정되었을 경우, Input Voltage Error(2 진수 : 00000001)와 Overheating Error(2 진수 : 00000100)가 발생하는 것을 모두 감지할 수 있습니다.  
위험 상황이 감지되면 Torque Enable(512) 값이 ‘0’으로 변경되고 모터 출력은 0%가 됩니다.  
제어기는 Status Packet의 Error 필드에 Alert Error Bit(0x80)이 설정되었는지를 확인하거나, Hardware Error Status(518)을 통해서 현재상태를 확인할 수 있습니다.  
위험 상황이 감지된 후에는 REBOOT을 하지 않는 한, Torque Enable(512)을 ‘1’(Torque ON)로 설정할 수 없습니다.  
Shutdown(63)에서 감지할 수 있는 위험 상황은 아래 표와 같습니다.

|Bit   | 명칭     | 내용     |
| :-------------: | :-------------: | :------------- |
|Bit 7|-|미사용, 항상 '0'|
|Bit 6|-|미사용, 항상 '0'|
|Bit 5|Overload Error(초기값)|모터의 최대 출력으로 제어 할 수 없는 하중이 지속적으로 적용되는 경우|
|Bit 4|Electrical Shock Error(초기값)|전기적으로 회로가 충격을 받거나, 입력 전력이 부족해서, 모터가 정상동작하지 못하는 경우|
|Bit 3|Motor Encoder Error|모터의 엔코더가 동작하지 않을 경우|
|Bit 2|Overheating Error(초기값)|내부 온도가 설정된 동작 온도 범위를 벗어난 경우|
|Bit 1|Motor Hall Sensor Error|모터의 홀센서 값이 정상 범위를 벗어났을 경우|
|Bit 0|Input Voltage Error|인가된 전압이 설정된 동작 전압 범위를 벗어났을 경우|

{% capture shutdown_01 %}
**참고** : Shutdown이 발생하면 다음과 같은 방법으로 장치를 REBOOT 시킬 수 있습니다.
1. H/W REBOOT : 전원을 껐다 켜는 방법
2. S/W REBOOT : REBOOT Instruction 전송하는 방법(자세한 사항은 Protocol 2.0의 [Reboot]을 참고해주세요.)
{% endcapture %}

<div class="notice">{{ shutdown_01 | markdownify }}</div>

Shutdown이 발생하면 1초 주기로 LED가 점멸합니다.
{: .notice}

[프로토콜]: /docs/kr/dxl/protocol2/#reboot
