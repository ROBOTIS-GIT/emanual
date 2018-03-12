Goal Torque(604)를 이용해, 목표 토크를 설정할 수 있습니다. 이 값은 Torque Limit(30) 보다 큰 값을 쓸 수 없습니다.  
`동작모드`가 토크 제어 모드가 아닐 경우 토크 제한값으로 사용됩니다.  
예외적으로 Goal Torque(604)가 '0'일 경우에는 Torque Limit(30)이 토크 제한값으로 사용됩니다. (Position Gain 또는 Velocity Gain의 블록 다이어그램 참고)  
토크, 전류, Goal torque와의 관계는 아래 식을 참고하십시오.

|모델명|변환 수식|
| :---: | :---: |
|PRO 54 | A = V * 33,000 / 2,048<br />A : 전류[mA]<br />V : Present Current/Goal Torque |
|PRO 42 | A = V * 8,250 / 2,048<br />A : 전류[mA]<br />V : Present Current/Goal Torque |
