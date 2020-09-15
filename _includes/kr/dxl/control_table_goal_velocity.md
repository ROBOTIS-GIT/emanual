속도 제어 모드의 경우, Goal Velocity(104)를 통해 목표 속도를 설정할 수 있습니다. 이 값은 [Velocity Limit(44)](#velocity-limit44)보다 클 수 없습니다. 현재 Goal Velocity(104)는 목표 속도로만 사용되고, 속도 제한 값으로는 사용되지 않습니다.

|      단위       |                   범위                   |
|:---------------:|:----------------------------------------:|
| 0.229 [rev/min] | -[Velocity Limit(44)] ~ [Velocity Limit(44)] |

{% capture goal_velocity_note %}
**참고** : 
- 장치의 최대 속도와 최대 토크는 입력전압에 따라 달라집니다. 따라서 입력 전압에 따라 추종할 수 있는 최대 속도 역시 달라집니다. e-Manual은 권장 전압을 기준으로 설명합니다.
- [Profile Acceleration(108)](#profile-acceleration108)과 Goal Velocity(104)를 동시에 변경할 경우, 변경된 [Profile Acceleration(108)](#profile-acceleration108)이 적용되어 Goal Velocity(104)가 수행됩니다.
{% endcapture %}
<div class = "notice">{{ goal_velocity_note | markdownify %}}</div>
