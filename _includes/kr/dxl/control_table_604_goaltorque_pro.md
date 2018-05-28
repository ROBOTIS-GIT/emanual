Goal Torque(604)를 이용해, 목표 토크를 설정할 수 있습니다. 이 값은 Torque Limit(30) 보다 큰 값을 쓸 수 없습니다.  
`동작모드`가 토크 제어 모드가 아닐 경우 토크 제한값으로 사용됩니다.  
예외적으로 Goal Torque(604)가 '0'일 경우에는 Torque Limit(30)이 토크 제한값으로 사용됩니다. (Position Gain 또는 Velocity Gain의 블록 다이어그램 참고)  
토크, 전류, Goal torque와의 관계는 아래 식을 참고하십시오.

|모델명|변환 수식|
| :---: | :---: |
|PRO 54 | A = C x 33,000 &divide; 2,048<br />A = 권선전류 [mA]<br />C = Present Current(621) or Goal Torque(604) |
|PRO 42 | A = C x 8,250 &divide; 2,048<br />A = 권선전류 [mA]<br />C = Present Current(621) or Goal Torque(604) |
