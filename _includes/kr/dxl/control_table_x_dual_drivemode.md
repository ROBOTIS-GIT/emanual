
장치의 드라이브 모드를 설정합니다.(펌웨어 v38 부터 지원)

|         Bit         |                     명칭                     | 설명                                                                                                                                                                                                       |
|:-------------------:|:--------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|     Bit 7(0x80)     |                     N/A                      | 미사용, 항상 '0'                                                                                                                                                                                           |
|     Bit 6(0x40)     |                     N/A                      | 미사용, 항상 '0'                                                                                                                                                                                           |
|     Bit 5(0x20)     |                     N/A                      | 미사용, 항상 '0'                                                                                                                                                                                           |
|     Bit 4(0x10)     |                     N/A                      | 미사용, 항상 '0'                                                                                                                                                                                           |
|     Bit 3(0x08)     |                     N/A                      | 미사용, 항상 '0'                                                                                                                                                                                           |
|     Bit 2(0x04)     |           Profile configuration              | Velocity-based Profile('0') : 속도를 기준으로 Profile 생성<br />Time-based Profile('1') : Time-based Profile('1') : 시간을 기준으로 Profile 생성<br />※ 자세한 사항은 [Profile Velocity(112)](#profile-velocity112)를 참고하세요. |
|     Bit 1(0x02)     | Master/Slave Configuration<br />(Dual Joint) | Master mode(‘0’) : Master Dynamixel로 동작합니다.<br />Slave mode(‘1’) : Slave Dynamixel로 동작합니다.                                                                                                 |
|     Bit 0(0x01)     |            Direction of Rotation             | Normal Mode(0): CCW(Positive), CW(Negative)<br />Reverse Mode(1): CCW(Negative), CW(Positive)                                                                                                              |

**참고** : Direction of rotation의 Reverse mode(‘1’)를 설정하면, Dynamixel의 회전 방향이 변경됩니다. 따라서 Position, Velocity, Current, PWM의 방향이 모두 변경됩니다. 좌우 대칭적인 구조의 관절이나 바퀴 구동 시스템을 구성할 때 편리하게 사용할 수 있습니다.
{: .notice}

Master/Slave configuration(Dual joint)은 2개의 Dynamixel을 1개의 Dynamixel처럼 동시에 제어하기 위한 방법입니다.  
Master Dynamixel과 Slave Dynamixel은 동기화 케이블로 연결되어야 합니다.  
Slave Dynamixel은 동기화 케이블을 통해 전달된 Master Dynamixel의 PWM 신호에 의해서 직접 제어됩니다.  
따라서 Slave Dynamixel의 Goal Position, Goal Velocity, Goal Current, Goal PWM은 무시됩니다.

![](/assets/images/dxl/x/x-series_dual_joint.png)

|동기화 케이블|상세설명|
| :---: | :---: |
|일반 모드용|	Slave Dynamixel은 Master Dynamixel의 PWM 신호에 의해서 제어됩니다.<br />즉, Master/Slave Dynamixel의 회전방향은 동일합니다.|
|리버스 모드용(Twisted)|Slave Dynamixel은 Master Dynamixel의 반전된 PWM 신호에 의해서 제어됩니다.<br />즉, Master/Slave Dynamixel의 회전방향은 서로 반대방향이 됩니다.|

**참고** : Master와 Slave가 하드웨어적으로 연결되어있지않으면 로드차이에 의해 조금씩 다르게 구동됩니다. 아래와 같이 프레임으로 연결하신후 듀얼모드를 사용해주세요. 배선은 커넥터 정보를 참고해주세요.
{: .notice}

![](/assets/images/dxl/x/x-series_dual_joint_frame.png)
