
Profile의 최대 속도를 설정합니다.  
Profile Velocity(112)는 전류 제어 모드와 속도 제어 모드를 제외한 모든 제어 모드에서 적용 가능합니다.  
Profile Velocity(112)는 Velocity Limit(44)보다 클 수 없습니다.  
참고로 속도 제어 모드에서는 Profile Velocity(112)는 적용되지 않고 Profile Acceleration(108)만 적용됩니다.

|단위|범위|상세 설명|
| :---: | :---: | :---: |
| 0.229 rpm | 0 ~ Velocity Limit(44) | Profile Velocity(112)이 '0'인 경우, 무한대 속도를 뜻합니다. |

Profile이란 모터 구동 시 급격하게 변하는 속도와 가속도를 조절함으로써 진동, 소음 및 모터의 부하를 줄이는 가감속 제어 방법입니다.  
일반적으로 속도에 근거하여 가감속을 제어하기 때문에 Velocity Profile이라고 불립니다.  
다이나믹셀은 4가지 형태의 Profile을 제공합니다. 다음은 4가지 종류의 Profile과 Profile의 선택 방법을 표시합니다.  
기본적으로 Profile의 선택은 Profile Velocity(112)와 Profile Acceleration(108)의 조합에 의해서 결정됩니다.  
예외적으로 Triangle과 Trapezoidal Profile은 총 이동거리(ΔPos, 목표위치와 현재위치의 차이)가 추가로 고려되어 선택됩니다.  
편의상 Profile Velocity(112)를 V<sub>PRFL</sub>, Profile Acceleration(108)을 A<sub>PRFL</sub>로 표기합니다.  
‘X’는 “상관없음”(Don’t Care)를 뜻합니다.

![](/assets/images/dxl/dxl_profiles.jpg)


다이나믹셀의 Profile은 Goal Position(116)이 주어졌을 때, 현재 속도(Profile의 시작속도)를 기반으로 목표 속도 궤적을 생성합니다.  
따라서 다이나믹셀이 Goal Position(116)로 이동하는 중에 새로운 Goal Position(116)로 목표위치가 변경되어도, 속도의 연속성을 유지하면서 목표 속도 궤적을 생성합니다.  
이와 같이 속도의 불연속이 발생하지 않도록 목표 속도 궤적을 생성하는 기능을 Velocity Override라고 합니다.  
여기서는 수식의 단순화를 위해 Profile의 시작속도를 ‘0’으로 가정합니다.


다음은 위치 제어 모드, 확장 위치 제어 모드, 전류기반 위치 제어 모드에서, Goal Position(116) 명령에 대한 Profile의 동작 과정을 나타냅니다.

1. 사용자의 요청이 다이나믹셀 버스를 통해 Goal Position(116)에 등록됩니다.
2. Profile Velocity(112)와 Profile Acceleration(108)에 의해서 가속 시간(t1)이 결정됩니다.  
3. Profile Velocity(112), Profile Acceleration(108) 그리고 총 이동거리(ΔPos, 목표위치와 현재위치의 차이)에 의해서 Profile의 형태가 다음과 같이 결정됩니다.
4. 최종 선정된 Profile의 형태는 Moving Status(123)에 표기됩니다.(Moving Status(123) 참고)
5. 다이나믹셀은 Profile에 의해 산출된 목표 궤적에 따라 이동하게 됩니다.
6. Profile에 의한 목표 속도 궤적과 목표 위치 궤적은 Velocity Trajectory(136)와 Position Trajectory(140)에 표기됩니다.
7. Goal Position(116)에 도달하는 시간(t3)와 V<sub>PRFL_TRI</sub>은 다음과 같이 계산됩니다.

| 조건     | 프로파일 형태     |
| :------------- | :------------- |
| V<sub>PRFL</sub>(112) = 0 | 프로파일 미사용(Step 명령) |
| (V<sub>PRFL</sub>(112) ≠ 0) & (A<sub>PRF</sub>(108) = 0) | 사각 프로파일 |
| (V<sub>PRFL</sub>(112) ≠ 0) & (A<sub>PRF</sub>(108) ≠ 0) & (V<sub>PRFL_TRI</sub> ≤ V<sub>PRFL</sub>(112)) | 삼각 프로파일 |
| (V<sub>PRFL</sub>(112) ≠ 0) & (A<sub>PRF</sub>(108) ≠ 0) & (V<sub>PRFL_TRI</sub> ＞ V<sub>PRFL</sub>(112)) | 사다리꼴 프로파일 |

![](/assets/images/dxl/dxl_velocity_profiles.jpg)

`Note` 급격한 가속도의 변화를 최소화하기 위해서 다이나믹셀은 Jerk를 관리하고 있습니다. 따라서 Profile에 의한 목표궤적의 정확한 완료시간은 t<sub>3</sub> 보다 다소 길어질 수 있습니다.(상기 그림의 t<sub>4</sub>)
{: .notice}


{% capture group_notice_03 %}
`Note` 속도 제어 모드에서는 Profile Acceleration(108)만 적용됩니다.  
제공되는 Profile의 형태는 Step과 Trapezoidal 2가지 입니다.  
Velocity Override 기능과 Jerk 관리 기능은 동일하게 동작합니다.  
이때의 가속시간(t<sub>1</sub>)은 다음과 같습니다.  
**t<sub>1</sub> = 64 * {Goal Velocity(104) / Profile Acceleration(108)}**
{% endcapture %}

<div class="notice">
  {{ group_notice_03 | markdownify }}
</div>
