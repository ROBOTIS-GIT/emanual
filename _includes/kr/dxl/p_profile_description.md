Profile이란 모터 구동 시 급격하게 변하는 속도와 가속도를 조절함으로써 진동, 소음 및 모터의 부하를 줄이는 가감속 제어 방법입니다.  
일반적으로 속도에 근거하여 가감속을 제어하기 때문에 Velocity Profile이라고 불립니다.  
장치는 3가지 형태의 Profile을 제공합니다. 다음은 3가지 종류의 Profile을 표시합니다.  
기본적으로 Profile의 선택은 [Profile Velocity(560)]와 [Profile Acceleration(556)]의 조합에 의해서 결정됩니다.  
예외적으로 Trapezoidal Profile은 총 이동거리(ΔPos, 목표위치와 현재위치의 차이)가 추가로 고려되어 선택됩니다.  

![](/assets/images/dxl/p/profile_types.png)

장치의 Profile은 [Goal Position(564)]이 주어졌을 때, 현재 속도(Profile의 시작속도)를 기반으로 목표 속도 궤적을 생성합니다.  
따라서 장치가 [Goal Position(564)]로 이동하는 중에 새로운 [Goal Position(564)]로 목표위치가 변경되어도, 속도의 연속성을 유지하면서 목표 속도 궤적을 생성합니다.  
이와 같이 속도의 불연속이 발생하지 않도록 목표 속도 궤적을 생성하는 기능을 Velocity Override라고 합니다.  
여기서는 수식의 단순화를 위해 Profile의 시작속도를 ‘0’으로 가정합니다.

다음은 [Goal Position(564)] 명령에 대한 Profile의 동작 과정을 나타냅니다.

{% capture profile_vel_ex1 %}
1. 사용자의 요청이 통신 버스를 통해 [Goal Position(564)](#goal_position564)에 등록됩니다.
2. [Profile Velocity(560)](#profile-velocity560)와 [Profile Acceleration(556)](#profile-acceleration556)에 의해서 가속 시간(t1)이 결정됩니다.  
3. [Profile Velocity(560)](#profile-velocity560), [Profile Acceleration(556)](#profile-acceleration556) 그리고 총 이동거리(ΔPos, 목표 위치와 현재 위치의 차이)에 의해서 Profile의 형태가 다음과 같이 결정됩니다.
4. 최종 선정된 Profile의 형태는 [Moving Status(571)](#moving-status571)에 표기됩니다.
5. 장치는 Profile에 의해 산출된 목표 궤적에 따라 이동하게 됩니다.
6. Profile에 의한 목표 속도 궤적과 목표 위치 궤적은 [Velocity Trajectory(584)](#velocity-trajectory584)와 [Position Trajectory(588)](#position-trajectory588)에 표기됩니다.
{% endcapture %}

<div class="notice--success">{{ profile_vel_ex1 | markdownify }}</div>

| 조건                                                          | 프로파일 형태              |
|:--------------------------------------------------------------|:---------------------------|
| Profile Velocity(560) = 0                                     | 프로파일 미사용(Step 명령) |
| (Profile Velocity(560) ≠ 0) & (Profile Acceleration(556) = 0) | 사각 프로파일              |
| (Profile Velocity(560) ≠ 0) & (Profile Acceleration(556) ≠ 0) | 사다리꼴 프로파일          |

![](/assets/images/dxl/p/velocity_profile.png)

{% capture group_notice_03 %}
**참고** : 속도 제어 모드에서는 [Profile Acceleration(556)](#profile-acceleration556)만 적용됩니다.  
제공되는 Profile의 형태는 Step과 Trapezoidal 2가지 입니다.  
Velocity Override 기능은 동일하게 동작합니다.  
이때의 가속시간(t<sub>1</sub>)은 다음과 같습니다.  
**Velocity-based Profile**: **t<sub>1</sub> = 600 * {Profile Velocity(560) / Profile Acceleration(556)}**  
**Time-based Profile**: **t<sub>1</sub> = Profile Acceleration(556)**
{% endcapture %}

<div class="notice">
  {{ group_notice_03 | markdownify }}
</div>

{% capture group_notice_04 %}
**참고** : Time-based Profile이 선택된 경우, [Profile Velocity(560)](#profile-velocity560)로 Profile 총 시간(t<sub>3</sub>)을, [Profile Acceleration(556)](#profile-acceleration556)로
 가속시간(t<sub>1</sub>)을 [ms] 단위로 설정할 수 있습니다. 이때 [Profile Acceleration(556)](#profile-acceleration556)이 [Profile Velocity(560)](#profile-velocity560)의 50%를 넘을 경우,
 [Profile Acceleration(556)](#profile-acceleration556)은 [Profile Velocity(560)](#profile-velocity560))의 50%로 제한되어 적용됩니다.
{% endcapture %}

<div class="notice">
  {{ group_notice_04 | markdownify }}
</div>

[Profile Acceleration(556)]: #profile-acceleration556
[Profile Velocity(560)]: #profile-velocity560
