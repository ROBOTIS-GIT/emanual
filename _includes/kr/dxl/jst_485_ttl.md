{% if page.ref=='u2d2_power_hub' %}

|        Item         |                             TTL                              |                            RS-485                            |                               Power                                |
|:-------------------:|:------------------------------------------------------------:|:------------------------------------------------------------:|:------------------------------------------------------------------:|
|       핀번호        |                `1` GND<br>`2` VDD<br>`3` DATA                |         `1` GND<br>`2` VDD<br>`3` DATA+<br>`4` DATA-         |                        `1` GND<br> `2` VDD                         |
|     다이어그램      |        ![](/assets/images/dxl/jst_b3beha_diagram.png)        |        ![](/assets/images/dxl/jst_b4beha_diagram.png)        |         ![](/assets/images/dxl/molex_39281023_diagram.png)         |
|       하우징        |   ![](/assets/images/dxl/JST_EHR-3.png)<br />[JST EHR-03]    |   ![](/assets/images/dxl/JST_EHR-4.png)<br />[JST EHR-04]    | ![](/assets/images/dxl/molex_39012020.png)<br />[MOLEX 39-01-2020] |
|      PCB 헤더       | ![](/assets/images/dxl/JST_B3B_EH-A.png)<br />[JST B3B-EH-A] | ![](/assets/images/dxl/JST_B4B-EH-A.png)<br />[JST B4B-EH-A] | ![](/assets/images/dxl/molex_39281023.png)<br />[MOLEX 39-28-1023] |
|    Crimp 터미널     |                     [JST SEH-001T-P0.6]                      |                     [JST SEH-001T-P0.6]                      |                         [MOLEX 39-00-0038]                         |
| 다이나믹셀 전선규격 |                            21 AWG                            |                            21 AWG                            |                               20 AWG                               |

{% else %}

|        항목         |                             TTL                              |                            RS-485                            |
|:-------------------:|:------------------------------------------------------------:|:------------------------------------------------------------:|
|       핀번호        |                `1` GND<br>`2` VDD<br>`3` DATA                |         `1` GND<br>`2` VDD<br>`3` DATA+<br>`4` DATA-         |
|     다이어그램      |        ![](/assets/images/dxl/jst_b3beha_diagram.png)        |        ![](/assets/images/dxl/jst_b4beha_diagram.png)        |
|       하우징        |   ![](/assets/images/dxl/JST_EHR-3.png)<br />[JST EHR-03]    |   ![](/assets/images/dxl/JST_EHR-4.png)<br />[JST EHR-04]    |
|      PCB 헤더       | ![](/assets/images/dxl/JST_B3B_EH-A.png)<br />[JST B3B-EH-A] | ![](/assets/images/dxl/JST_B4B-EH-A.png)<br />[JST B4B-EH-A] |
|    Crimp 터미널     |                     [JST SEH-001T-P0.6]                      |                     [JST SEH-001T-P0.6]                      |
| 다이나믹셀 전선규격 |                            21 AWG                            |                            21 AWG                            |


{% endif %}

[JST EHR-03]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST EHR-04]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST B3B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST B4B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST SEH-001T-P0.6]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[MOLEX 39-01-2020]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0039012020_CRIMP_HOUSINGS.xml
[MOLEX 39-28-1023]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0039281023_PCB_HEADERS.xml
[MOLEX 39-00-0038]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0039000038_CRIMP_TERMINALS.xml
