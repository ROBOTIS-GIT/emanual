[Drive Mode(10)]에서 Velocity-based Profile이 선택된 경우, Profile Velocity(560)는 **Profile의 최대 속도를 설정**합니다.  
[Drive Mode(10)]에서 Time-based Profile이 선택된 경우, Profile Velocity(560)는 **Profile의 도달 시간(총 시간)을 설정**합니다.  
Profile Velocity(560)는 **위치제어 모드, 확장 위치제어 모드** 에서만 적용됩니다.  
자세한 사항은 [Profile]에서 확인하세요.

**참고** : 속도 제어 모드에서는 Profile Velocity(560)는 사용하지 않습니다. ([Profile Acceleration(556)]만 적용)
{: .notice}

| Velocity-based Profile |      상세       | 비고                                |
|:----------------------:|:---------------:|:------------------------------------|
|          단위          | 0.01 [rev/min] | Profile의 속도를 설정합니다.        |
|          범위          |    0 ~ [Velocity Limit(44)]    | '0'인 경우, 무한대 속도를 뜻합니다. |

| Time-based Profile |   상세    | 비고                                                                                                                                   |
|:------------------:|:---------:|:---------------------------------------------------------------------------------------------------------------------------------------|
|        단위        | 1 [msec]  | Profile의 도달시간을 설정합니다.                                                                                                       |
|        범위        | 0 ~ 32737 | '0'인 경우, 무한대 속도를 뜻합니다.<br>Profile Acceleration(556, 가속시간)이 Profile Velocity(560, 도달시간)의 50%를 넘을 경우, 50%로 제한되어 적용됩니다. |

**참고** : Time-based Profile은 펌웨어 V12 이상에서 지원합니다. 
{: .notice}
