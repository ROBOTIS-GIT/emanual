
속도 제어 모드에서 동작하는 속도 제어기의 Gain 입니다. Control Table의 Gain과 장치 내부 제어기의 Gain은 다음은 같은 관계를 갖습니다.  
하기의 상수에는 샘플링타임이 포함되어 있습니다. 편의상 장치 내부 제어기의 Velocity P Gain을 K<sub>V</sub>P로 표기하고 Control Table의 Gain은 K<sub>V</sub>P<sub>(TBL)</sub>로 표기합니다.

|                     |  제어기 Gain   |                        변환 수식                         |  범위 | 상세 설명   |
|:-------------------:|:--------------:|:--------------------------------------------------------:|:-------------------:|
| Velocity I Gain(76) | K<sub>V</sub>I | K<sub>V</sub>I = K<sub>V</sub>I<sub>(TBL)</sub> / 65,536 | 0 ~ 16,383 | I Gain |
| Velocity P Gain(78) | K<sub>V</sub>P |  K<sub>V</sub>P = K<sub>V</sub>P<sub>(TBL)</sub> / 128   | 0 ~ 16,383 | P Gain |

다음은 속도 제어 모드에서 동작하는 속도제어기의 블록다이어그램입니다. 사용자의 요청이 장치에 전달된 후, 장치의 Horn이 구동되기까지의 과정은 다음과 같습니다.
1. 사용자의 요청이 통신 버스를 통해 Goal Velocity(104)에 등록됩니다.
2. Goal Velocity(104)는 Profile Acceleration(108)에 의해서 목표 속도 궤적으로 변경됩니다.
3. 목표 속도 궤적은 Velocity Trajectory(136) 에 표기됩니다.
4. PI 제어기는 목표 속도 궤적을 기반으로 모터에 인가할 PWM 출력을 계산합니다.
5. Goal PWM(100)은 계산된 PWM 출력을 제한하여 최종 PWM값을 결정합니다.
6. 최종 PWM값은 Inverter를 통해 모터에 적용되고 장치의 Horn이 구동됩니다.
7. 구동 결과는 Present Position(132), Present Velocity(128) Present PWM(124), Present Current(126)에 표기됩니다.

![](/assets/images/dxl/velocity_controller_pi_gain.jpg)


**NOTE** : K<sub>a</sub>는 Anti-windup Gain이고 &beta;는 위치와 속도의 변환계수로 사용자가 변경할 수는 없습니다. PID 제어기에 대한 자세한 설명은 위키피디아의 [PID Controller]를 참고하세요.
{: .notice}

[PID Controller]: http://en.wikipedia.org/wiki/PID_controller
