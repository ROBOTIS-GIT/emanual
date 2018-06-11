다음은 전류기반 위치제어기(전류기반 위치 제어 모드)의 블록다이어그램입니다.  
기본적인 내용은 위치제어기와 동일하므로, 위치제어기와의 차이점만 설명합니다.  
블록다이어그램에서 위치제어기와 다른 부분은 초록색으로 표기하였습니다.

1. Feedforward와 PID 제어기는 목표 궤적을 기반으로 목표 전류를 계산합니다.
2. Goal Current(102)는 계산된 목표 전류를 제한하여 최종 목표 전류를 결정합니다.
3. 전류제어기는 최종 목표 전류를 기반으로 모터에 인가할 PWM 출력을 계산합니다.
4. Goal PWM(100)은 계산된 PWM 출력을 제한하여 최종 PWM값을 결정합니다.
5. 최종 PWM값은 Inverter를 통해 모터에 적용되고 장치의 Horn이 구동됩니다.
6. 구동 결과는 Present Position(132), Present Velocity(128), Present PWM(124), Present Current(126)에 표기됩니다.

![](/assets/images/dxl/current_position_controller_pid_gain.jpg)

`참고` K<sub>a</sub>는 Anti-windup Gain로서 사용자가 변경할 수는 없습니다. 보다 자세한 PID 제어기와 Feedforward 제어기에 대한 설명은 [PID Controller](http://en.wikipedia.org/wiki/PID_controller)와 [Feed Forward](https://en.wikipedia.org/wiki/Feed_forward_(control))을 참고하세요.
{: .notice}
