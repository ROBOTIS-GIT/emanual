
[Present Velocity(548)], [Present Position(552)], [Goal Velocity(528)], [Goal Position(532)], [Position Trajectory(560)], [Velocity Trajectory(564)]에 적용되는 전자 기어비(Electronic Gear Ratio)를 설정합니다.  
전자 기어비를 사용하면 제어 입력의 Pulse 단위를 사용자가 원하는 단위로 변경할 수 있습니다.  
위치제어의 경우 전자기어비는 아래와 같이 적용됩니다.

![](/assets/images/dxl/y/dy_equation_1.jpg)

![](/assets/images/dxl/y/electronic_gear.PNG)

전자 기어비 설정 예시는 다음과 같습니다.

Re: 전자 기어비 R: 실제 기어비 L: 볼스크류 리드

| 시스템 형태                      | 설정 단위    | 설명                             |
|:-------------------------------:|:-----------:|:--------------------------------|
| Direct Drive 시스템              | 0.01 [deg] | Dynamixel-Y의 분해능: 524,288 [pulse/rev]<br />![](/assets/images/dxl/y/dy_equation_2.jpg)  |
| 감속기 부착 시스템<br />R = 100:1 | 0.01 [deg] | Dynamixel-Y의 분해능: 524,288 [pulse/rev]<br />![](/assets/images/dxl/y/dy_equation_2.jpg)  |
| 볼스크류 시스템<br />L: 10mm/rev  | 0.01 [mm]  | Dynamixel-Y 1Rev당 Pulse = 524,288<br />Dynamixel-Y의 분해능: 524,288 [pulse/rev]<br />![](/assets/images/dxl/y/dy_equation_3.jpg)  |
