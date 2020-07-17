
{% if page.ref=='opencm485exp' %}

|        항목         |                                TTL                                 |                               RS-485                               |                               Power                                |
|:-------------------:|:------------------------------------------------------------------:|:------------------------------------------------------------------:|:------------------------------------------------------------------:|
|       핀 번호       |                   `1` GND<br>`2` VDD<br>`3` DATA                   |            `1` GND<br>`2` VDD<br>`3` DATA+<br>`4` DATA-            |                        `1` GND<br> `2` VDD                         |
|     다이어그램      |         ![](/assets/images/dxl/molex_22035035_diagram.png)         |         ![](/assets/images/dxl/molex_22035045_diagram.png)         |         ![](/assets/images/dxl/molex_39281023_diagram.png)         |
|       하우징        | ![](/assets/images/dxl/molex_50375033.png)<br />[MOLEX 50-37-5033] | ![](/assets/images/dxl/molex_50375043.png)<br />[MOLEX 50-37-5043] | ![](/assets/images/dxl/molex_39012020.png)<br />[MOLEX 39-01-2020] |
|      PCB 헤더       | ![](/assets/images/dxl/molex_22035035.png)<br />[MOLEX 22-03-5035] | ![](/assets/images/dxl/molex_22035045.png)<br />[MOLEX 22-03-5045] | ![](/assets/images/dxl/molex_39281023.png)<br />[MOLEX 39-28-1023] |
|    Crimp 터미널     |                         [MOLEX 08-70-1039]                         |                         [MOLEX 08-70-1039]                         |                         [MOLEX 39-00-0038]                         |
| 다이나믹셀 전선규격 |                               21 AWG                               |                               21 AWG                               |                               20 AWG                               |

{% else %}

|        항목         |                                TTL                                 |                               RS-485                               |
|:-------------------:|:------------------------------------------------------------------:|:------------------------------------------------------------------:|
|       핀 번호       |                   `1` GND<br>`2` VDD<br>`3` DATA                   |            `1` GND<br>`2` VDD<br>`3` DATA+<br>`4` DATA-            |
|     다이어그램      |         ![](/assets/images/dxl/molex_22035035_diagram.png)         |         ![](/assets/images/dxl/molex_22035045_diagram.png)         |
|       하우징        | ![](/assets/images/dxl/molex_50375033.png)<br />[MOLEX 50-37-5033] | ![](/assets/images/dxl/molex_50375043.png)<br />[MOLEX 50-37-5043] |
|      PCB 헤더       | ![](/assets/images/dxl/molex_22035035.png)<br />[MOLEX 22-03-5035] | ![](/assets/images/dxl/molex_22035045.png)<br />[MOLEX 22-03-5045] |
|    Crimp 터미널     |                         [MOLEX 80-70-1039]                         |                         [MOLEX 80-70-1039]                         |
| 다이나믹셀 전선규격 |                               21 AWG                               |                               21 AWG                               |

{% endif %}

{% include kr/dxl/pinout_warning.md %}

[MOLEX 50-37-5033]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0050375033_CRIMP_HOUSINGS.xml
[MOLEX 22-03-5035]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0022035035_PCB_HEADERS.xml
[MOLEX 50-37-5043]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0050375043_CRIMP_HOUSINGS.xml
[MOLEX 22-03-5045]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0022035045_PCB_HEADERS.xml
[MOLEX 08-70-1039]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0008701039_CRIMP_TERMINALS.xml
[MOLEX 39-01-2020]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0039012020_CRIMP_HOUSINGS.xml
[MOLEX 39-28-1023]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0039281023_PCB_HEADERS.xml
[MOLEX 39-00-0038]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0039000038_CRIMP_TERMINALS.xml
