
장치의 동작 모드를 설정합니다. 각 동작 모드마다 특성이 다르기 때문에, 구현하려는 시스템에 적합한 동작 모드를 설정하시기 바랍니다.

|    값     |                 동작모드                  | 설명                                                                                                                                                                                                                                               |
|:---------:|:-----------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|     1     |   속도제어 모드<br />(0 ~ 360 [&deg;])    | 속도를 제어하는 모드 입니다.<br />기존제품의 바퀴 모드(무한회전)과 동일하며 바퀴형태의 로봇에 유용합니다.                                                                                                                                          |
| 3(기본값) |               위치제어 모드               | 위치를 제어하는 모드 입니다.<br />기존제품의 관절 모드와 동일합니다.<br />Max Position Limit(48), Min Position Limit(52)에 의해서 동작범위가 제한됩니다.<br />1회전 내에서 구동하는 다관절 로봇에 유용합니다.                                      |
|     4     |   확장 위치제어 모드<br />(Multi-turn)    | 위치를 제어하는 모드 입니다.<br />기존제품의 다중 회전 모드와 동일합니다.<br />동작 범위는 총 512회전(-256 ~ 256 [rev]) 입니다.<br />다수의 회전(멀티턴)이 필요한 로봇의 손목 부위나 컨베이어시스템 또는 추가 감속기가 필요한 시스템에 유용합니다. |
|    16     | PWM 제어 모드<br />(Voltage Control Mode) | PWM 출력을 직접 제어합니다. (Voltage Control Mode)                                                                                                                                                                                                 |

{% capture opmode_notice_01 %}
**참고** : Operating Mode (동작모드)가 변경될 때 제어기의 Gain(PID, Feedforward)은 동작 모드에 적합하게 초기화 됩니다. 또한 프로파일 생성기와 제한값들 역시 초기화 됩니다.
1. [Profile Velocity(112)](#profile-velocity112), [Profile Acceleration(108)](#profile-acceleration108) : '0'으로 초기화
2. [Goal PWM(100)](#goal-pwm100) : [PWM Limit(36)](#pwm-limit36)으로 초기화
{% endcapture %}
<div class="notice">{{ opmode_notice_01 | markdownify }}</div>

{% capture opmode_notice_02 %}
**참고** : PWM이란 Pulse Width Modulation(펄스 폭 변조)의 약자로 펄스의 폭(PWM Duty)을 변경시키는 변조방식을 뜻합니다. 펄스의 폭을 변경하여 모터에 공급되는 평균 전압을 제어하는 용도로 사용됩니다.
1. PWM 모드는 다이나믹셀 DYNAMIXEL [AX](/docs/kr/dxl/ax/ax-12w/#cw-compliance-margin) 및 [RX](/docs/kr/dxl/rx/rx-10/#moving-speed-32) 시리즈의 바퀴모드와 유사합니다.
2. [Goal PWM(100)](#goal-pwm100)을 이용하여 모터에 공급되는 전압을 제어하세요.
{% endcapture %}
<div class="notice">{{ opmode_notice_02 | markdownify }}</div>

{% include kr/dxl/control_table_opmode_note.md %}
