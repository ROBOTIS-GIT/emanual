현재 위치 값입니다. 자세한 사항은 [Goal Position(116)](#goal-position116)을 참고하세요.

{% capture present_pos_notice_01 %}
**참고** : Present Position(132)은 Torque OFF 상태일 경우, Operating Mode(11)와 상관없이 4 byte(-2,147,483,648 ~ 2,147,483,647)의 범위를 연속적으로 표현합니다.  
Present Position(132)의 값이 초기화되는 시점은 다음과 같습니다.
1. Operating Mode(11)가 위치 제어 모드로 변경되는 시점에 1 [rev](0 ~ 4,095) 범위로 초기화
2. 위치 제어 모드에서 Torque ON으로 변경되는 시점에 1 [rev](0 ~ 4,095) 범위로 초기화

Homing Offset(20)에 의해 초기화 되는 값은 변경될 수 있습니다.
{% endcapture %}

<div class="notice">
  {{ present_pos_notice_01 | markdownify }}
</div>
