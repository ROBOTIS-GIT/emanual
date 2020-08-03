
Goal Position(116)을 통해 목표위치를 설정할 수 있습니다. 모든 장치는 Horn을 정면에서 바라봤을 때 CCW(Counter Clockwise) 방향이 증가 방향이고, CW(Clockwise) 방향이 감소 방향입니다. Goal Position(116)에 도달하는 방식은 장치가 제공하는 4가지 형태의 Profile에 따라 달라집니다. Profile에 대한 자세한 내용은 [Profile Velocity(112)](#goal-velocity112)를 참고하세요.

![](/assets/images/dxl/x/dxl_goal_position.jpg)

|        동작모드        |                      범위                       |         상세         |
|:----------------------:|:-----------------------------------------------:|:--------------------:|
|     위치제어 모드      | Min Position Limit(52) ~ Max Position Limit(48) |  초기값 : 0 ~ 4,095  |
|   확장 위치제어 모드   |             -1,048,575 ~ 1,048,575              | -256 ~ 256 [rev] |{% if page.product_group!='dxl_xl430' and page.ref!='mx-28-2' %}
| 전류기반 위치제어 모드 |             -1,048,575 ~ 1,048,575              | -256 ~ 256 [rev] |{% else %}{% endif %}

|각도 환산 계수|설명|
| :---: | :---: |
|0.088 [&deg;]/각도값 1| 1 [rev] : 0 ~ 4,095 |

**참고** : Profile Velocity(112)와 [Profile Acceleration(108)]은 새로운 명령값이 업데이트 되는 시점에 적용됩니다.  
위치 제어 모드의 경우, Goal Position(116)이 업데이트되면 Profile Velocity(112)와 [Profile Acceleration(108)]에 의해서 프로파일이 생성됩니다.  
속도 제어 모드의 경우, Goal Velocity(104)가 업데이트되면, [Profile Acceleration(108)]에 의해서 프로파일이 생성됩니다.
{: .notice}

{% include kr/dxl/control_table_opmode_note.md %}
