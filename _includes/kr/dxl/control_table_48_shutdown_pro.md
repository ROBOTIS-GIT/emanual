다이나믹셀 프로는 동작 중에 발생하는 위험 상황을 감지하여 스스로를 보호할 수 있습니다. 설정할 수 있는 위험 상황은 아래 표와 같습니다.  
각 Bit의 기능은 ‘OR’의 논리로 적용되기 때문에 중복 설정이 가능합니다. 즉, 0x05 (2 진수: 00000101)로 설정되었을 경우 Input Voltage Error와 Overheating Error가 발생하는 것을 모두 감지할 수 있습니다.  
위험 상황이 발생하면 Torque enable값을 0으로 만들어서 모터 출력이 0%가 되도록 합니다
위험 상황이 발생하면 reboot를 하지 않는 한, 다이나믹셀 프로를 사용할 수 없습니다.

|Bit   | 명칭     | 내용     |
| :-------------: | :-------------: | :------------- |
|Bit 7|-|-|
|Bit 6|-|-|
|Bit 5|Overload Error(기본값)|모터의 최대 출력으로 제어 할 수 없는 하중이 지속적으로 적용되는 경우|
|Bit 4|Electrical Shock Error(기본값)|전기적으로 회로가 충격을 받거나, 입력 전력이 부족해서, 모터가 정상동작하지 못하는 경우|
|Bit 3|Motor Encoder Error(기본값)|모터의 엔코더가 동작하지 않을 경우|
|Bit 2|OverHeating Error|내부 온도가 설정된 동작 온도 범위를 벗어난 경우|
|Bit 1|Motor Hall Sensor Error(기본값)|모터의 홀센서 값이 정상 범위를 벗어났을 경우|
|Bit 0|Input Voltage Error|인가된 전압이 설정된 동작 전압 범위를 벗어났을 경우|

{% capture shutdown_01 %}
`참고` Shutdown이 발생하면 다음과 같은 방법으로 다이나믹셀을 REBOOT 시킬 수 있습니다.
1. H/W REBOOT : 전원을 껐다 켜는 방법
2. S/W REBOOT : REBOOT Instruction 전송하는 방법(자세한 사항은 [프로토콜]을 참고해주세요.)
{% endcapture %}

<div class="notice">{{ shutdown_01 || markdownify }}</div>

Shutdown이 발생하면 1초 주기로 LED가 점멸합니다.(펌웨어 버전 41 이상)
{: .notice}

[프로토콜]: /docs/kr/dxl/protocol2/#reboot
