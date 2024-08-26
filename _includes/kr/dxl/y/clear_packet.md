| Packet 종류         | P1   | P2 ~ P5                          | 설명                                                                            |
|:----------------:|:----:|:--------------------------------:|:--------------------------------------------------------------------------------|
| Multi-turn Clear | 0x01 | 고정값<br />(0x44 0x58 0x4C 0x22) |현재 위치(Present Position) 값을 모터 기준 1회전 이내의 절대위치 값으로 초기화. 정지된 상태에서만 Clear 가능.<br />Torque Enable상태에서 Clear Inst Packet을 전송할 경우, Status Packet의 Error 필드에 Result Fail(0x01) 발생.  |
| Error Clear      | 0x02 | 고정값<br />(0x45 0x52 0x43 0x4C) | DYNAMIXEL에 발생한 Error를 Clear.<br />Clear가 불가능한 Error가 있거나 Clear 조건이 아닌 경우 Error는 Clear 되지 않으며 Status Packet의 Error 필드에 Result Fail(0x01) 발생.  |



## [Multi-turn Clear Packet](#multi-turn-clear-packet)

DYNAMIXEL-Y는 Multi-turn을 백업하고 있어 전원 차단 후에도 Multi-turn이 보존되며, Multi-turn Clear Packet을 사용하여 이 값을 초기화 할 수 있습니다. Multi-turn Clear 후 DYNAMIXEL은 재부팅됩니다.  
Multi-turn Backup 배터리를 교체한 후에 반드시 실행하여야 정상사용이 가능합니다.

**참고**: Multi-turn Clear는 ‘모터’ 기준 1회전 이내의 절대 위치 값으로 초기화 됩니다. 감속기가 부착된 모델은 감속기 기준 절대위치를 잃어버릴 수 있습니다. 감속기 기준 절대위치를 0점에 맞추고 Multi-turn Clear를 진행하시기 바랍니다.
{: .notice}

### [Multi-turn Clear 방법](#multi-turn-clear-방법)

![](/assets/images/dxl/y/multi-turn_clear_guide.PNG)

1. DYNAMIXEL Wizard 2.0 상단 ‘Packet’ 버튼을 클릭하여, Packet 창을 엽니다. DYNAMIXEL과 연결되어 있다면 ‘연결 끊기’를 클릭하여 연결을 해제해줍니다.
2. COM Port와 Baudrate를 설정하고 Open 버튼을 클릭합니다.
3. Instruction 탭에서 Clear Instruction을 선택합니다.
4. ID를 입력하고 Send 버튼을 클릭하여 Packet을 전송합니다.
5. Status Packet이 수신될 때까지 대기합니다. 수신된 Packet에 Error가 있는지 확인합니다.


**참고**: Packet 창에 대한 자세한 내용은 [DYNAMIXEL Wizard 2.0]과 [Dynamixel Protocol 2.0] E-Manual을 참고해주시기 바랍니다.
{: .notice}

## [Error Clear Packet](#error-clear-packet)

DYNAMIXEL-Y에서 Error가 발생한 경우 Clear가 가능합니다.  
[Error Code(153)]가 0이 아닌 경우 [Clear Instruction Packet]으로 초기화가 가능합니다. 초기화가 불가능한 경우 Status Packet의 Error 필드에 Result Fail(0x01) 발생합니다. 

# [Multi-turn Backup 배터리 교체](#multi-turn-backup-배터리-교체)

DYNAMIXEL-Y는 Multi-turn Backup을 위해 배터리가 내장되어 있습니다. 배터리 교체 후에는 Multi-turn Clear 작업을 진행하여 Multi-turn 설정을 초기화 해주어야 정상 동작이 가능합니다.

## [배터리 교체 방법](#배터리-교체-방법)

![](/assets/images/dxl/y/brtterry_replacement_guide.PNG)

1. DYNAMIXEL-Y와 배터리를 준비합니다.
2. 전원을 공급하고, DYNAMIXEL Wizard2.0(v2.1.5.7 이상)을 통해서 DYNAMIXEL-Y을 검색한 뒤,  
    도구 → 인코더 배터리 교체 메뉴를 클릭합니다.
3. 감속기 모델인 경우는 원점 위치가 일치하는지 확인하고 다음 버튼을 클릭합니다.  
    (원점위치가 아닌 경우, 원점 위치로 맞춰주세요.)
4. 배터리 커버를 열어서 새 배터리로 교체하고, 커버를 닫고 다음 버튼을 클릭합니다.
5. 작업 진행을 기다립니다.
6. 작업이 완료되고 확인 버튼을 클릭하여 메뉴를 끝냅니다.
7. [Multi-turn Clear Packet](#multi-turn-clear-packet)을 통하여 Multi-turn을 초기화 시켜줍니다.


[DYNAMIXEL Wizard 2.0]: https://emanual.robotis.com/docs/kr/software/dynamixel/dynamixel_wizard2/
[Dynamixel Protocol 2.0]: https://emanual.robotis.com/docs/kr/dxl/protocol2/
[Clear Instruction Packet]: https://emanual.robotis.com/docs/kr/dxl/protocol2/#clear-0x10