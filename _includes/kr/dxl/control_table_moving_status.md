
움직임에 대한 추가적인 정보를 제공합니다. Following Error Bit(0x08)과 In-Position Bit(0x01)은 위치 제어 모드, 확장 위치 제어 모드, 전류기반 위치 제어 모드에서만 동작합니다.

||| 상세     | 설명     |
| :---: | :---: |:---: | :---: |
| Bit 7 | 0x80 | - | 미사용 |
| Bit 6 | 0x40 | - | 미사용 |
| Bit 5<br />~<br />Bit 4 | 0x30 | Profile Type(0x30)<br />Profile Type(0x20)<br />Profile Type(0x10)<br />Profile Type(0x00)|사다리꼴 속도 프로파일(Trapezoidal Velocity Profile)<br />삼각 속도 프로파일(Triangle Velocity Profile)<br />사각 속도 프로파일(Rectangle Velocity Profile)<br />프로파일 미사용(Step)|
| Bit 3 | 0x08 | Following Error | 장치가 목표위치 궤적을 추종하지 못하는 경우 |
| Bit 2 | 0x04 | - | 미사용 |
| Bit 1 | 0x02 | Profile Ongoing | Goal Position(116) 명령에 따라 Profile 진행 중인 경우 |
| Bit 0 | 0x01 | In-Position | 장치가 목표위치에 도달 경우 |

`참고` 삼각 속도 프로파일은 사각 속도 프로파일 입력 조건에서 프로파일 속도(112)에 도달 하지 못할 때 셋 되어집니다
{: .notice}
