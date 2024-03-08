내부 제어의 현재 상태를 나타냅니다.

| 값 |   명칭               | 설명                                                       |
|:--:|:-------------------:|:-----------------------------------------------------------|
| 0  | Start               | 장치에 전원이 인가됨                                         |
| 1  | Init System         | 장치 초기화 진행 중                                          |
| 2  | Inverter OFF        | Torque OFF 상태. Inverter가 OFF되 있음                       |
| 3  | Dynamic Brake       | Torque OFF 상태. Dynamic Brake가 활성화됨                    |
| 4  | Process Torque ON   | Torque ON 작업을 진행 중                                     |
| 5  | Running             | Torque ON 상태                                              |
| 6  | Process Torque OFF  | Torque OFF 작업을 진행 중                                    |
| 7  | Detected HW Fault   | 하드웨어 문제가 감지됨                                        |
| 8  | HW Fault            | 하드웨어 문제. 발생한 문제는 Error Code(153)을 통해 확인 가능   |


**참고** : [Controller State(152)]의 값이 Process Torque On, Process Torque Off일 때, [Torque Enable(512)], [Goal PWM(524)], [Goal Current(526)], [Goal Velocity(528)], [Goal Position(532)]에 값을 쓰면 Result Fail이 Return 됩니다.
{: .notice}
