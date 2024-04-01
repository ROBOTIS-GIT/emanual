Position Limit Reached Error의 판단 기준치입니다.  
[Present Position(552)]의 값이 ([Max Position Limit(76)] + Position Limit Threshold(38)) ~ ([Min Position Limit(84)] - Position Limit Threshold(38)) 범위를 벗어나는 경우 Position Limit Reached Error가 발생합니다. 이 값이 ‘0’인 경우 Position Limit Reached Error가 비활성화 됩니다.

|   값      |    설명                                                 |
|:---------:|:-------------------------------------------------------:|
| 0(기본값)  | Position Limit Reached Error 비활성화                   |
| 1 ~ 32767 | Position Limit Reached Error 활성화<br />단위: 1 [Pulse] |


