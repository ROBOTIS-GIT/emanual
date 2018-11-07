
| 항목                      | 내용                                                       |
|:--------------------------|:--------------------------------------------------------|
| 모터                      | {{ site.data.dxl_pro_plus_info[page.ref].motor }}            |
| 통신속도                  | {{ site.data.dxl_pro_plus_info[page.ref].baudrate }}          |
| 동작모드                  | {{ site.data.dxl_pro_plus_info[page.ref].opmode }}            |
| 무게                      | {{ site.data.dxl_pro_plus_info[page.ref].weight }}           |
| 크기 (W x H x D)          | {{ site.data.dxl_pro_plus_info[page.ref].dimensions }}       |
| 해상도                    | {{ site.data.dxl_pro_plus_info[page.ref].resolution }}        |
| 감속비                    | {{ site.data.dxl_pro_plus_info[page.ref].gearratio }}         |
| 백래쉬                    | {{ site.data.dxl_pro_plus_info[page.ref].backlash }}          |{% if site.data.dxl_pro_plus_info[page.ref].radialload != 'N/A' %}
| [반경방향 하중]{: .popup} | {{ site.data.dxl_pro_plus_info[page.ref].radialload }}         |{% else %}{% endif %}{% if site.data.dxl_pro_plus_info[page.ref].axialload != 'N/A' %}
| [축방향 하중]{: .popup}   | {{ site.data.dxl_pro_plus_info[page.ref].axialload }}          |{% else %}{% endif %}
| No Load Speed             | {{ site.data.dxl_pro_plus_info[page.ref].noloadspeed }}      |
| No Load Current           | {{ site.data.dxl_pro_plus_info[page.ref].noloadcurrent }}    |
| Continuous Speed          | {{ site.data.dxl_pro_plus_info[page.ref].contspeed }}        |
| Continuous Torque         | {{ site.data.dxl_pro_plus_info[page.ref].conttorque }}       |
| Continuous Current        | {{ site.data.dxl_pro_plus_info[page.ref].contcurrent }}      |
| 출력                      | {{ site.data.dxl_pro_plus_info[page.ref].output }}            |
| 동작 온도                 | {{ site.data.dxl_pro_plus_info[page.ref].temperature }}        |
| 사용 전압                 | {{ site.data.dxl_pro_plus_info[page.ref].opvoltage }}          |
| Command Signal            | {{ site.data.dxl_pro_plus_info[page.ref].commandsignalkr }}  |
| Protocol Type             | {{ site.data.dxl_pro_plus_info[page.ref].protocoltypekr }}   |
| Physical Connection       | {{ site.data.dxl_pro_plus_info[page.ref].physicalconnection }}|
| ID                        | {{ site.data.dxl_pro_plus_info[page.ref].id }}                |
| 대기 전류                 | {{ site.data.dxl_pro_plus_info[page.ref].standbycurrent }}      |

[반경방향 하중]: /assets/images/dxl/axial_radial_load_pro.png
[축방향 하중]: /assets/images/dxl/axial_radial_load_pro.png
