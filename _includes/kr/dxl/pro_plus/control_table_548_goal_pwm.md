{% if page.ref=='rh_p12_rn' or page.ref=='rh_p12_rna' %}
PWM 출력의 제한값으로 사용됩니다. 이 값은 PWM Limit(36)보다 클 수 없습니다. Goal PWM(548)의 동작 방식은 해당 Gain의 설명 부분을 참고하세요.

{% else %}
PWM 제어 모드에서는 Goal PWM(548) 값이 Inverter를 통해서 모터에 직접 인가됩니다. 그 외의 제어 모드에서는 PWM 출력의 제한값으로 사용됩니다.
이 값은 PWM Limit(36)보다 클 수 없습니다. 제어 모드 별 Goal PWM(548)의 동작 방식은 해당 Gain의 설명 부분을 참고하세요.
{% endif %}

|              범위              |              설명              |
|:------------------------------:|:------------------------------:|
| -PWM Limit(36) ~ PWM Limit(36) | PWM Limit(36)의 초기값 : 2,009 |
