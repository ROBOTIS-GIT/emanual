
| 항목             | 내용                                                    |
|:-----------------|:--------------------------------------------------------|
| MCU              | {{ site.data.dxl_x_info[page.ref].mcu }}                |
| 위치 센서        | {{ site.data.dxl_x_info[page.ref].encoder }}            |
| 모터             | {{ site.data.dxl_x_info[page.ref].motor }}              |
| 통신속도         | {{ site.data.dxl_x_info[page.ref].baudrate }}           |
| 제어 알고리즘    | {{ site.data.dxl_x_info[page.ref].control }}            |
| 해상도           | {{ site.data.dxl_x_info[page.ref].resolution }}              |{% if site.data.dxl_x_info[page.ref].backlash != 'N/A' %}
| 백래쉬           | {{ site.data.dxl_x_info[page.ref].backlash }}           |{% else %}{% endif %}
| 동작 모드        | {{ site.data.dxl_x_info[page.ref].mode }}               |
| 무게             | {{ site.data.dxl_x_info[page.ref].weight }}             |
| 크기 (W x H x D) | {{ site.data.dxl_x_info[page.ref].dimensions }}         |
| 기어비           | {{ site.data.dxl_x_info[page.ref].gearratio }}          |
| Stall Torque   | {{ site.data.dxl_x_info[page.ref].stalltorque }}        |
| 무부하 속도      | {{ site.data.dxl_x_info[page.ref].noloadspeed }}        |{% if site.data.dxl_x_info[page.ref].radialload != 'N/A' %}
| [반경방향 하중]{: .popup}| {{ site.data.dxl_x_info[page.ref].radialload }}         |{% else %}{% endif %}{% if site.data.dxl_x_info[page.ref].axialload != 'N/A' %}
| [축방향 하중]{: .popup}  | {{ site.data.dxl_x_info[page.ref].axialload }}          |{% else %}{% endif %}
| 동작 온도        | {{ site.data.dxl_x_info[page.ref].temperature }}        |{% if page.product_group=='dxl_xw540' %}
| **방진/방수 등급**|             **IP 68 (1 m, 24 hr)**                                   |{% else %}{% endif %}
| 사용 전압        | {{ site.data.dxl_x_info[page.ref].voltage }}            |
| 제어 명령        | {{ site.data.dxl_x_info[page.ref].command }}            |
| 프로토콜 타입    | {{ site.data.dxl_x_info[page.ref].protocoltype }}       |
| 통신 연결        | {{ site.data.dxl_x_info[page.ref].physicalconnection }} |
| ID               | {{ site.data.dxl_x_info[page.ref].id }}                 |
| 피드백           | {{ site.data.dxl_x_info[page.ref].feedback }}           |
| 재질             | {{ site.data.dxl_x_info[page.ref].material }}           |
| 대기 전류        | {{ site.data.dxl_x_info[page.ref].standbycurrent }}     |

[반경방향 하중]: /assets/images/dxl/axial_radial_load.png
[축방향 하중]: /assets/images/dxl/axial_radial_load.png
