
움직임의 유무를 나타냅니다.  
Present Velocity(128)의 절대값이 Moving Threshold(24)보다 크면 Moving(122) 이 ‘1’이 되고, 적으면 ‘0’이 됩니다.  
단 Profile 진행 중, 즉 Goal Position(116) 명령을 수행하는 중에는 Present Velocity(128)와 무관하게 ‘1’로 설정됩니다.

| 값 | 설명     |
| :---: | :------------- |
| 0 | 움직임이 감지되지 않음 |
| 1 | 움직임이 감지 되었거나, Profile 진행 중인 경우(Goal Position(116) 명령을 수행하는 중) |
