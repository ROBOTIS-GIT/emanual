|2|4|[Model Information](#model-information)          |모델 정보                           |R  |-|
|6|1|[Firmware Version](#firmware-version)            |펌웨어 버전                         |R  |-|
|7|1|[ID](#id)                                        |통신 ID                             |RW |1|
|8|1|[Baud Rate](#baud-rate)                          |통신 속도                          |RW |1|
|9|1|[Return Delay Time](#return-delay-time)          |응답 지연 시간                      |RW |250|
|11|1|[Operating Mode](#operating-mode)               |동작모드                           |RW |3|
|13|4|[Homing Offset](#homing-offset)                 |0점 위치 조정값                     |RW |0|
|17|4|[Moving Threshold](#moving-threshold)           |윰직임 감지 기준값                  |RW |50|
|21|1|[Temperature Limit](#temperature-limit)         |내부 한계 온도                     |RW |80|
|22|2|[Max Voltage Limit](#max-voltage-limit)         |최대 한계 전압                     |RW |400|
|24|2|[Min Voltage Limit](#min-voltage-limit)         |최소 한계 전압                     |RW |150|
|26|4|[Acceleration Limit](#acceleration-limit)       |가속도 최대값                      |RW |-|
|30|2|[Torque Limit](#torque-limit)                   |최대 토크값                        |RW |-|
|32|4|[Velocity Limit](#velocity-limit)               |최대 속도값                        |RW |-|
|36|4|[Max Position Limit](#max-position-limit)       |최대 위치 제한값                   |RW |-|
|40|4|[Min Position Limit](#min-position-limit)       |최소 위치 제한값                   |RW |-|
|44|1|[External Port Mode 1](#external-port-mode)     |외부 포트 모드 1                     |RW |0|
|45|1|[External Port Mode 2](#external-port-mode)     |외부 포트 모드 2                     |RW |0|
|46|1|[External Port Mode 3](#external-port-mode)     |외부 포트 모드 3                     |RW |0|
|47|1|[External Port Mode 4](#external-port-mode)     |외부 포트 모드 4                     |RW |0|
|48|1|[Shutdown](#shutdown)                           |셧다운 에러 정보                     |RW |58|
|49|2|[Indirect Address 1](#indirect-address)         |간접 주소값 1                       |RW |634|
|51|2|[Indirect Address 2](#indirect-address)         |간접 주소값 2                       |RW |635|
|53|2|[Indirect Address 3](#indirect-address)         |간접 주소값 3                       |RW |636|
|...|2|[Indirect Address N](#indirect-address)        |간접 주소값 N                       |RW |...|
|559|2|[Indirect Address 256](#indirect-address)      |간접 주소값 256                     |RW |889|


## [RAM 영역](#ram-영역)

| 주소     | 크기<br />(Byte)     | 명칭     | 의미     | 접근     | 초기값     |
| :-----: | :-------------: | :------------- | :------------- | :----: | :---: |
|562|1|[Torque Enable](#torque-enable)              |토크 On/Off                        |RW |0|
|563|1|[LED Red](#led-red)                          |Red LED 밝기값                    |RW |0|
|564|1|[LED Green](#led-green)                      |Green LED 밝기값                  |RW |0|
|565|1|[LED Blue](#led-blue)                        |Blue LED 밝기값                   |RW |0|
|586|2|[Velocity I Gain](#velocity-i-gain)          |속도 I 게인                         |RW |-|
|588|2|[Velocity P Gain](#velocity-p-gain)          |속도 P 게인                         |RW |-|
|594|2|[Position P Gain](#position-p-gain)          |위치 P 게인                         |RW |-|
|596|4|[Goal Position](#goal-position)              |목표 위치값                      |RW |-|
|600|4|[Goal Velocity](#goal-velocity)              |목표 속도값                      |RW |0|
|604|2|[Goal Torque](#goal-torque)                  |목표 토크값                       |RW |0|
|606|4|[Goal Acceleration](#goal-acceleration)      |목표 가속도값                  |RW |0|
|610|1|[Moving](#moving)                            |움직임 유무                            |R  |-|
|611|4|[Present Position](#present-position)        |현재 위치값                     |R  |-|
|615|4|[Present Velocity](#present-velocity)        |현재 속도값                     |R  |-|
|621|2|[Present Current](#present-current)          |현재 전류값                      |R  |-|
|623|2|[Present Input Voltage](#present-input-voltage)|입력전압                    |R  |-|
|625|1|[Present Temperature](#present-temperature)    |내부온도             |R  |-|
|626|2|[External Port Data 1](#external-port-data)  |외부 포트 데이터 1                       |R/RW|0|
|628|2|[External Port Data 2](#external-port-data)  |외부 포트 데이터 2                       |R/RW|0|
|630|2|[External Port Data 3](#external-port-data)  |외부 포트 데이터 3                       |R/RW|0|
|632|2|[External Port Data 4](#external-port-data)  |외부 포트 데이터 4                       |R/RW|0|
|634|1|[Indirect Data 1](#indirect-data)            |간접 주소 데이터 1                            |RW |0|
|635|1|[Indirect Data 2](#indirect-data)            |간접 주소 데이터 2                            |RW |0|
|636|1|[Indirect Data 3](#indirect-data)            |간접 주소 데이터 3                            |RW |0|
|...|1|[Indirect Data N](#indirect-data)            |간접 주소 데이터 N                            |RW |0|
|889|1|[Indirect Data 256](#indirect-data)          |간접 주소 데이터 256                          |RW |0|
|890|1|[Registered Instruction](#registered-instruction)|Instruction의 등록 여부         |R  |0|
|891|1|[Status Return Level](#status-return-level)   |응답 레벨             |RW |2|
|892|1|[Hardware Error Status](#hardware-error-status)  |하드웨어 에러 상태                  |R  |0|
