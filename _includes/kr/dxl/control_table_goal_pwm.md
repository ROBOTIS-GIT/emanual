
PWM 제어 모드의 경우, PID 제어기나 Feedforward 제어기는 모두 비활성화되고 Goal PWM(100) 값이 Inverter를 통해서 모터에 직접 인가됩니다. 그 외 제어 모드에서는 PWM 제한값으로 사용됩니다.
이 값은 PWM Limit(36)보다 클 수 없습니다. 제어 모드 별 Goal PWM(100)의 동작 방식은 해당 Gain의 설명 부분을 참고하세요.

| 범위  | 상세 |
| :----: | :---------: |
| -PWM Limit(36) ~ PWM Limit(36) | PWM Limit(36)의 초기값 : 885 |
