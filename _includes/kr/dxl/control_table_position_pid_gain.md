
위치 제어 모드, 확장 위치 제어 모드에서 동작하는 위치 제어기의 Gain입니다. Control Table의 Gain과 장치 내부 제어기의 Gain은 다음은 같은 관계를 갖습니다. 하기의 상수에는 샘플링타임이 포함되어 있습니다. 편의상 장치 내부 제어기의 Position P Gain을 K<sub>P</sub>P로 표기하고 Control Table의 Gain은 K<sub>P</sub>P<sub>(TBL)</sub>로 표기합니다.

|| 제어기 Gain     | 변환 수식     | 범위 | 설명 |
| :------------: | :------------: | :------------: | :------------: |
| Position D Gain(80) | K<sub>P</sub>D | K<sub>P</sub>D = K<sub>P</sub>D<sub>(TBL)</sub> / 16 | 0 ~ 16,383 | D Gain |
| Position I Gain(82) | K<sub>P</sub>I | K<sub>P</sub>I = K<sub>P</sub>I<sub>(TBL)</sub> / 65,536 | 0 ~ 16,383 | I Gain |
| Position P Gain(84) | K<sub>P</sub>P | K<sub>P</sub>P = K<sub>P</sub>P<sub>(TBL)</sub> / 128 | 0 ~ 16,383 | P Gain |
| Feedforward 2nd Gain(88) | K<sub>FF2nd</sub> | K<sub>FF2nd(TBL)</sub> / 4 | 0 ~ 16,383 | Feedforward Acceleration Gain |
| Feedforward 1st Gain(90) | K<sub>FF1st</sub> | K<sub>FF1st(TBL)</sub> / 4 | 0 ~ 16,383 | Feedforward Velocity Gain |

다음은 위치 제어 모드, 확장 위치 제어 모드에서 동작하는 위치제어기의 블록다이어그램입니다. 사용자의 요청이 장치에 전달된 후, 장치의 Horn이 구동되기까지의 과정은 다음과 같습니다.

1. 사용자의 요청이 통신 버스를 통해 Goal Position(116)에 등록됩니다.
2. Goal Position은 Profile Velocity(112)와 [Profile Acceleration(108)]에 의해서 목표 위치 궤적과 목표 속도 궤적으로 변경됩니다.
3. 목표 속도 궤적과 목표 위치 궤적은 Velocity Trajectory(136), Position Trajectory(140)에 표기됩니다.
4. Feedforward와 PID 제어기는 목표 궤적을 기반으로 모터에 인가할 PWM 출력을 계산합니다.
5. [Goal PWM(100)]은 계산된 PWM 출력을 제한하여 최종 PWM값을 결정합니다.
6. 최종 PWM값은 Inverter를 통해 모터에 적용되고 장치의 Horn이 구동됩니다.
7. 구동 결과는 [Present Position(132)], [Present Velocity(128)], [Present PWM(124)], [Present Current(126)]에 표기됩니다.

![](/assets/images/dxl/position_controller_pid_gain.jpg)

**참고** : PWM 제어 모드의 경우, PID 제어기와 Feedforward 제어기는 모두 비활성화되고 [Goal PWM(100)] 값이 Inverter를 통해서 모터에 직접 인가됩니다. 이를 통해 모터의 전압을 직접 제어할 수 있습니다.
{: .notice}

**참고** : K<sub>a</sub>는 Anti-windup Gain로서 사용자가 변경할 수는 없습니다.
{: .notice}
