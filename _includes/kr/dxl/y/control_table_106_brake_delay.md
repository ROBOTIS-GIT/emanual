Brake동작 및 Goal Update가 시작될 때까지의 지연 시간을 설정합니다.

| 주소 |   명칭             | 단위 | 범위        | 설명                                                                                       |
|:----:|:-----------------:|:----:|:----------:|:-------------------------------------------------------------------------------------------| 
| 106  | Brake Delay       | [ms] | 0 ~ 32,767 |Torque ON: [Torque Enable(512)] 값이 1로 변경된 시점으로부터 Brake Delay (106)[ms] 뒤에 Brake Release<br />Torque OFF: Brake Lock 시점으로부터 100[ms] 뒤에 제어기 OFF|
| 108  | Goal Update Delay | [ms] | 0 ~ 32,767 | Brake Release가 된 시점으로부터 Goal Update Delay(108)[ms] 뒤에 Goal Position, Velocity, Current, PWM 값의 Update가 시작됨  |
 


