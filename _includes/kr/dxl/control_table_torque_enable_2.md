Torque ON/OFF를 제어합니다. ‘1’을 쓰면 Torque ON 상태가 되고, EEPROM 영역의 모든 Data는 잠김 상태로 변경됩니다.

| 값 | 상세 설명    |
| :-------------: | :------------- |
|0(초기값)|Torque OFF 상태로 변경합니다|
|1|Torque ON 상태로 변경하고 EEPROM 영역의 모든 데이터는 잠김상태로 변경됩니다|

**참고** : [Present Position(132)]은 Operating Mode(11)와 [Torque Enable(64)]이 변경되는 시점에 초기화 될 수 있습니다. 자세한 사항은 Homing Offset(20)과 [Present Position(132)]를 참고하세요.
{: .notice}
