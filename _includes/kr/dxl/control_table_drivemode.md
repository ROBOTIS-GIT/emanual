{% if page.product_group=='dxl_x430' %}다이나믹셀의 드라이브 모드를 설정합니다. 펌웨어 V38부터 지원합니다.  
{% else %}다이나믹셀의 드라이브 모드를 설정합니다.
{% endif %}

|         Bit         |                     명칭            | 설명                                                                                                                                                                                                       |
|:-------------------:|:-----------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|     Bit 7(0x80)     |                      -              | 미사용, 항상 '0'                                                                                                                                                                                           |
|     Bit 6(0x40)     |                      -              | 미사용, 항상 '0'                                                                                                                                                                                           |
|     Bit 5(0x20)     |                      -              | 미사용, 항상 '0'                                                                                                                                                                                           |
|     Bit 4(0x10)     |                      -              | 미사용, 항상 '0'                                                                                                                                                                                           |
|     Bit 3(0x08)     |                      -              | 미사용, 항상 '0'                                                                                                                                                                                           |{% if page.product_group=='dxl_x430' or page.product_group=='dxl_x540' or page.product_group=='dxl_xl430' or page.ref=='mx-106-2' %}
|     Bit 2(0x04)     |           Profile Configuration     | **[0]** Velocity-based Profile: 속도를 기준으로 Profile 생성<br />**[1]** Time-based Profile: 시간을 기준으로 Profile 생성<br />※ 자세한 사항은 [Profile Velocity(112)](#profile-velocity112)를 참고하세요. |{% else %}
|     Bit 2(0x04)     |                      -              | 미사용, 항상 '0'                                                                                                                                                                                           |{% endif %}{% if page.product_group=='dxl_x540' or page.product_group=='dxl_ex' or page.ref=='mx-106-2' or page.ref=='mx-106' %}
|     Bit 1(0x02)     | Master/Slave Mode<br />(Dual Joint) | **[0]** Master Mode: 마스터 다이나믹셀로 동작합니다.<br />**[1]** Slave Mode: 슬레이브 다이나믹셀로 동작합니다.                                                                                                          |{% else %}
|     Bit 1(0x02)     |                      -              | 미사용, 항상 '0'                                                                                                                                                                                           |{% endif %}
|     Bit 0(0x01)     |        Normal/Reverse Mode          | **[0]** Normal Mode: 반시계방향(CCW)이 양수값, 시계방향(CW)이 음수값<br />**[1]** Reverse Mode: 시계방향(CW)이 양수값, 반시계방향(CCW)이 음수값                                                                           |

{% if page.product_group=='dxl_mx2' or page.product_group=='dxl_x540' or page.product_group=='dxl_x430' or page.product_group=='dxl_xl430' %}
**참고** : Time-based Profile은 펌웨어 V42 이상에서 지원합니다.
{: .notice}
{% else %}{% endif %}

**참고** : Normal/Reverse Mode에서 방향 모드(Normal('0')/Reverse('1'))를 설정하면, 장치의 회전 방향이 변경됩니다.  
따라서 다이나믹셀의 {% if page.product_group=='dxl_mx2' or page.product_group=='dxl_x540' %}Position, Velocity, Current, PWM{% elsif page.ref=='mx-106' %} Position {% else %} Position, Speed, Load{% endif %}의 방향이 변경됩니다.  
대칭구조의 관절이나 바퀴 구동 시스템을 구성할 때 편리하게 사용할 수 있습니다.
{: .notice}

{% if page.ref=='mx-106' %}
**참고** : MX-106에서는 Present Position의 방향만 변경됩니다. Present Speed와 Present Load 의 방향은 그대로 유지됩니다. 
{: .notice}

{% capture drivemode %}
**주의** : MX-106의 바퀴모드에서는 Normal/Reverse Mode를 변경할수없습니다. 따라서, MX-106에서 Normal/Reverse Mode는 관절모드와 다중회전 모드에서만 사용가능합니다. [CW/CCW Angle Limit](#cwccw-angle-limit6-8)을 참고해주세요.
{% endcapture %}
<div class="notice--warning">{{ drivemode | markdownify }}</div>
{% else %}{% endif %}


{% if page.product_group=='dxl_x540' or page.product_group=='dxl_ex' or page.ref=='mx-106-2' or page.ref=='mx-106' %}
#### 듀얼 모드
2개의 다이나믹셀을 결합해서 더욱 강력한 1개의 관절로 제어하기 위한 방법입니다.  
동기화된 관절을 사용하려면 마스터 모드로 설정된 다이나믹셀과 슬레이브 모드로 설정된 다이나믹셀이 동기화 케이블로 연결되어야 합니다.  

슬레이브 다이나믹셀은 동기화 케이블을 통해 전달된 마스터 다이나믹셀의 PWM 신호에 의해서만 제어됩니다.  
따라서 슬레이브 장치의 {% if page.product_group=='dxl_ex' or page.ref=='mx-106' %}Goal Position, Moving Speed는{% else %}Goal Position, Goal Velocity, Goal Current, Goal PWM은{% endif %} 무시됩니다.

슬레이브 모드로 설정된 다이나믹셀의 회전 방향은 Drive Mode(10)의 Normal/Reverse 설정이 아닌 **동기화 케이블의 꼬임** 여부에 의해 결정됩니다.  
기본형 동기화 케이블을 사용하면 마스터와 같은 방향으로 회전하고, 꼬임형 동기화 케이블을 사용하면 마스터와 반대 방향으로 회전합니다.
{: .notice}

{% if page.product_group=='dxl_x540' %}
![](/assets/images/dxl/x/x-series_dual_joint.png)
{% else %}
![](/assets/images/dxl/ex/ex-106_dual.png)
{% endif %}

|   동기화 케이블     |                                                          설명                                                        |
|:----------------:|:--------------------------------------------------------------------------------------------------------------------|
| 기본형 동기화 케이블 |      슬레이브 다이나믹셀은 마스터 다이나믹셀의 `PWM 신호`에 의해서 제어됩니다.<br>마스터와 슬레이브 다이나믹셀은 **같은 방향**으로 회전합니다.|
| 꼬임형 동기화 케이블 | 슬레이브 다이나믹셀은 마스터 다이나믹셀의 `반전된 PWM 신호`에 의해서 제어됩니다.<br>마스터와 슬레이브 다이나믹셀은 **반대 방향**으로 회전합니다.|


{% capture dual_frame %}
**주의** : 마스터와 슬레이브가 프레임으로 연결되어있지 않으면 부하에 따라 조금씩 다르게 구동될 수 있습니다. 아래와 같이 프레임으로 연결하신 후 듀얼모드를 사용해주세요.

{% if page.product_group=='dxl_x540' %}
![](/assets/images/dxl/x/x-series_dual_joint_frame.png)
{% else %}
![](/assets/images/dxl/ex/ex-106+_fr08-h110_fr08-d101.png)
{% endif %}
{% endcapture %}
<div class="notice--warning">{{ dual_frame | markdownify }}</div>

{% else %}{% endif %}
