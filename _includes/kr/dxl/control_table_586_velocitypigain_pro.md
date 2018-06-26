속도 제어 모드에서 동작하는 속도 제어기의 Gain 입니다. I Gain에는 샘플링 타임이 포함되어 있습니다.  
아래 그림은 속도 제어모드에서의 제어기 블록다이어그램입니다. Velocity P Gain을 K<sub>V</sub>P, Velocity I Gain을 K<sub>V</sub>I 로 표기합니다.

|게인 값 범위|
| :---: |
|0 ~ 32,767|

![](/assets/images/dxl/pro/pro_velocity_controller.png)

**참고** : K<sub>P</sub>A는 Anti-windup Gain으로 사용자가 변경할 수는 없습니다. PID제어기에 대한 설명은 [위키피디아 PID Controller](http://en.wikipedia.org/wiki/PID_controller)를 참조하세요.
{: .notice}
