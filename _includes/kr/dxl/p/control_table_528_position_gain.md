위치 제어 모드, 확장 위치 제어 모드에서 동작하는 위치 제어기의 Gain입니다. 편의상 장치 내부 제어기의 Position P Gain을 K<sub>P</sub>P로 표기하고 Control Table의 Gain은 K<sub>P</sub>P<sub>(TBL)</sub>로 표기합니다.

|                           |    제어기 Gain    |    범위    | 설명                       |
|:-------------------------:|:-----------------:|:----------:|:---------------------------|
|   Position D Gain(528)    |  K<sub>P</sub>D   | 0 ~ 32,767 | Position Derivative Gain   |
|   Position I Gain(530)    |  K<sub>P</sub>I   | 0 ~ 32,767 | Position Integral Gain     |
|   Position P Gain(532)    |  K<sub>P</sub>P   | 0 ~ 32,767 | Position Proportional Gain |
| Feedforward 1st Gain(538) | K<sub>FF1st</sub> | 0 ~ 32,767 | Velocity Feedforward Gain  |

다음은 위치 제어 모드, 확장 위치 제어 모드에서 동작하는 위치제어기의 블록다이어그램입니다. 사용자의 요청이 장치에 전달된 후, 장치의 Horn이 구동되기까지의 과정은 다음과 같습니다.

{% capture position_gain_ex1 %}
1. 사용자의 요청이 통신 버스를 통해 Goal Position(564)에 등록됩니다.
2. Goal Position은 Profile Velocity(560)와 Profile Acceleration(556)에 의해서 목표 위치 궤적과 목표 속도 궤적으로 변경됩니다.
3. 목표 속도 궤적과 목표 위치 궤적은 Velocity Trajectory(584), Position Trajectory(588)에 표기됩니다.
4. Feedforward와 PID 제어기는 목표 궤적을 입력받아 모터에 인가할 PWM 출력을 계산합니다.
5. Goal PWM(548)은 계산된 PWM 출력을 제한하여 최종 PWM값을 결정합니다.
6. 최종 PWM값은 Inverter를 통해 모터에 적용되고 장치의 Horn이 구동됩니다.
7. 구동 결과는 Present Position(580), Present Velocity(576), Present PWM(572), Present Current(574)에 표기됩니다.
{% endcapture %}

<div class="notice--success">{{ position_gain_ex1 | markdownify }}</div>

![](/assets/images/dxl/p/position_controller.png)

**참고** : PWM 제어 모드의 경우, PID 제어기와 Feedforward 제어기는 모두 비활성화되고 Goal PWM(548) 값이 Inverter를 통해서 모터에 직접 인가됩니다. 이를 통해 모터의 전압을 직접 제어할 수 있습니다.
{: .notice}

**참고** : K<sub>a</sub>는 Anti-windup Gain로서 사용자가 변경할 수는 없습니다.
{: .notice}
