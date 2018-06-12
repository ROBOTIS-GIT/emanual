속도 제어 모드에서 동작하는 속도 제어기의 Gain 입니다. Control Table의 Gain과 장치 내부 제어기의 Gain은 다음은 같은 관계를 갖습니다. 편의상 장치 내부 제어기의 Velocity P Gain을 K<sub>V</sub>P로 표기하고 Control Table의 Gain은 K<sub>V</sub>P<sub>(TBL)</sub>로 표기합니다.


|                     |  제어기 Gain   |  범위 | 상세 설명   |
|:-------------------:|:--------------:|:--------------------------------------------------------:|:-------------------:|
| Velocity I Gain(524) | K<sub>V</sub>I | 0 ~ 32,767 | I Gain |
| Velocity P Gain(526) | K<sub>V</sub>P | 0 ~ 32,767 | P Gain |
| Feedforward 2nd Gain(536) | K<sub>FF1st</sub> | 0 ~ 32,767 | Feedforward Acceleration Gain |

다음은 속도 제어 모드에서 동작하는 속도제어기의 블록다이어그램입니다. 사용자의 요청이 장치에 전달된 후, 장치의 Horn이 구동되기까지의 과정은 다음과 같습니다.
1. 사용자의 요청이 통신 버스를 통해 Goal Velocity(552)에 등록됩니다.
2. Goal Velocity(552)는 Profile Acceleration(556)에 의해서 목표 속도 궤적으로 변경됩니다.
3. 목표 속도 궤적은 Velocity Trajectory(584) 에 표기됩니다.
4. PI 제어기는 목표 속도 궤적을 입력받아 모터에 인가할 PWM 출력을 계산합니다.
5. Goal PWM(548)은 계산된 PWM 출력을 제한하여 최종 PWM값을 결정합니다.
6. 최종 PWM값은 Inverter를 통해 모터에 적용되고 장치의 Horn이 구동됩니다.
7. 구동 결과는 Present Position(580), Present Velocity(576) Present PWM(572), Present Current(574)에 표기됩니다..

![](/assets/images/dxl/pro/proplus_velocity_controller.png)

`참고` K<sub>P</sub>A는 Anti-windup Gain으로 사용자가 변경할 수는 없습니다. PID제어기에 대한 설명은 [위키피디아 PID Controller](http://en.wikipedia.org/wiki/PID_controller)를 참조하세요.
{: .notice}
