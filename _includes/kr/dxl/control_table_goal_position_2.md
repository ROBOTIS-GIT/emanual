
Goal Position(116)을 통해 목표위치를 설정할 수 있습니다. 모든 다이나믹셀은 Horn을 정면에서 바라봤을 때 CCW(Counter Clockwise) 방향이 증가 방향이고, CW(Clockwise) 방향이 감소 방향입니다. Goal Position(116)에 도달하는 방식은 다이나믹셀이 제공하는 4가지 형태의 Profile에 따라 달라집니다. Profile에 대한 자세한 내용은 Profile Velocity(112)를 참고하세요.

![](/assets/images/dxl/x/dxl_goal_position.jpg)

|        동작모드        |                      범위                       |         상세         |
|:----------------------:|:-----------------------------------------------:|:--------------------:|
|     위치제어 모드      | Min Position Limit(52) ~ Max Position Limit(48) |  초기값 : 0 ~ 4,095  |
|   확장 위치제어 모드   |             -1,048,575 ~ 1,048,575              | -256[rev] ~ 256[rev] |
| 전류기반 위치제어 모드 |             -1,048,575 ~ 1,048,575              | -256[rev] ~ 256[rev] |

|각도 환산 계수|설명|
| :---: | :---: |
|0.088&deg;/각도값 1| 1[rev] : 0 ~ 4,095 |

`Note` Profile Acceleration(108), Profile Velocity(112)와 Goal Position(116)을 동시에 변경할 경우, 변경된 Profile Acceleration(108)과 Profile Velocity(112)가 적용되어 Goal Position(116)이 수행됩니다.
{: .notice}
