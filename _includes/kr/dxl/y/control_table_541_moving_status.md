움직임에 대한 추가적인 정보를 제공합니다. In-Position Bit(0x01)은 위치 제어 모드에서만 동작합니다.

|     값       |        상세       |    설명                                                         |
| :----------: | :---------------: | :------------------------------------------------------------- |
| Bit 7 (0x80) | -                 | 미사용, 항상 ‘0’ ‘0’                                                                                     |
| Bit 6 (0x40) | Position In Range | 현재 위치가 [Min Position limit(84)] ~ [Max position limit(76)] 범위 내 유무<br />0 : Limit Range를 벗어남<br />1 : Limit Range 내에 있음 |
| Bit 5 (0x40)<br /><br />Bit 4 (0x40) | Profile type(H)<br /><br />Profile type(L)   | 현재 사용 중인 프로파일의 타입<br />11 : 사다리꼴 프로파일<br />10 : 삼각 프로파일<br />01 : 사각 프로파일<br />00 : 프로파일 미사용(Step) |
| Bit 3 (0x08) | Following error   | 위치 궤적 [Position Trajectory(560)] 추종 여부<br />0 : 추종함<br />1 : 추종하지 못함                      |
| Bit 2 (0x04) | Moving            | 장치가 회전하는지 여부<br />0 : 정지 상태<br />1 : 움직임이 감지됨                                         |
| Bit 1 (0x02) | Profile ongoing   | [Goal Position(532)] 명령에 따라 Profile 진행 중인지 여부<br />0 : 도달하지 못함<br />1 : Profile 진행중   |
| Bit 0 (0x01) | In-Position       | [Goal Position(532)] 도달 여부<br />0 : 도달하지 못함<br />1 : 도달함                                     |

**참고** : 삼각 속도 프로파일은 사다리꼴 속도 프로파일 조건에서 [Profile Velocity(244)]에 도달하지 못할 때 설정됩니다.
{: .notice}
