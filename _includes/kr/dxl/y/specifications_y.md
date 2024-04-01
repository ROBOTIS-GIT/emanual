
| 항목                      | 내용                                                           |
|:--------------------------|:---------------------------------------------------------------|
| MCU                       | {{ site.data.dxl_y_info[page.ref].mcu }}                |
| 모터                      | {{ site.data.dxl_y_info[page.ref].motor }}              |
| 통신속도                  | {{ site.data.dxl_y_info[page.ref].baudrate }}            |
| 동작모드                  | {{ site.data.dxl_y_info[page.ref].opmode }}              |
| 무게                      | {{ site.data.dxl_y_info[page.ref].weight }}             |
| 크기 (W x H x D)          | {{ site.data.dxl_y_info[page.ref].dimensions }}         |
| 중공 크기                 | {{ site.data.dxl_y_info[page.ref].holesize }}         |
| 해상도                    | {{ site.data.dxl_y_info[page.ref].resolution }}          |
| 엔코더 사양               | {{ site.data.dxl_y_info[page.ref].encoderspec }}         |
| 감속비                    | {{ site.data.dxl_y_info[page.ref].gearratio }}          |
| 백래쉬                    | {{ site.data.dxl_y_info[page.ref].backlash }}           |
| 반경방향 하중              | {{ site.data.dxl_y_info[page.ref].radialload }}         |
| No Load Speed            | {{ site.data.dxl_y_info[page.ref].noloadspeed }}        |
| Continuous Speed         | {{ site.data.dxl_y_info[page.ref].contspeed }}          |
| Continuous Torque        | {{ site.data.dxl_y_info[page.ref].conttorque }}         |
| Continuous Current<sup>1)<sup>  | {{ site.data.dxl_y_info[page.ref].contcurrent }}        |
| Maximum Torque<sup>2)<sup>       | {{ site.data.dxl_y_info[page.ref].maximumtorque }}       |
| Maximum Current<sup>1) 2)<sup>  | {{ site.data.dxl_y_info[page.ref].maximumcurrent }}      |
| 출력                      | {{ site.data.dxl_y_info[page.ref].output }}             |
| 동작 온도                 | {{ site.data.dxl_y_info[page.ref].temperature }}         |
| 사용 전압                 | {{ site.data.dxl_y_info[page.ref].opvoltage }}             |
| Command Signal           | {{ site.data.dxl_y_info[page.ref].commandsignal }}      |
| Physical Connection      | {{ site.data.dxl_y_info[page.ref].connection_kr }}       |
| ID                       | {{ site.data.dxl_y_info[page.ref].id }}                 |
| 대기 전류                 | {{ site.data.dxl_y_info[page.ref].standbycurrent }}      |

{% capture spec_notice %}
1&#41; 전류 값은 모터의 상전류 값 입니다.  
2&#41; Maximum Torque, Current는 순간적으로 사용 가능한 값입니다. 정격 이상의 토크, 전류를 지속 사용시 장치 보호를 위해 과부하 에러(Overload Error)가 발생합니다.
{% endcapture %}
<div class="notice">{{ spec_notice | markdownify }}</div>

