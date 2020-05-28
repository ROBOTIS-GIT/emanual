
{% if page.ref=='xw540-t150' or page.ref=='xw540-t270' %}
|     항목     |                            RS-485                            |
|:------------:|:------------------------------------------------------------:|
|   핀 번호    |         `1` GND<br>`2` VDD<br>`3` DATA+<br>`4` DATA-         |
|  다이어그램  |        ![](/assets/images/dxl/jst_b4beha_diagram.png)        |
|    하우징    |   ![](/assets/images/dxl/JST_EHR-4.png)<br />[JST EHR-04]    |
|   PCB 헤더   | ![](/assets/images/dxl/JST_B4B-EH-A.png)<br />[JST B4B-EH-A] |
| Crimp 터미널 |                     [JST SEH-001T-P0.6]                      |
|  Wire Gauge  |                            21 AWG                            |
{% else %}
|     항목     |                             TTL                              |                            RS-485                            |                              외부포트                               |                             Dual Joint                              |
|:------------:|:------------------------------------------------------------:|:------------------------------------------------------------:|:-------------------------------------------------------------------:|:-------------------------------------------------------------------:|
|   핀 번호    |                `1` GND<br>`2` VDD<br>`3` DATA                |         `1` GND<br>`2` VDD<br>`3` DATA+<br>`4` DATA-         |    `1` GND<br>`2` VDD<br>`3` PORT 1<br>`4` PORT 2<br>`5` PORT 3     |                 `1` PWM1<br>`2` PWM2<br>`3` ENABLE                  |
|  다이어그램  |        ![](/assets/images/dxl/jst_b3beha_diagram.png)        |        ![](/assets/images/dxl/jst_b4beha_diagram.png)        |          ![](/assets/images/dxl/molex_5304705_diagram.png)          |         ![](/assets/images/dxl/molex_588988000_diagram.png)         |
|    하우징    |   ![](/assets/images/dxl/JST_EHR-3.png)<br />[JST EHR-03]    |   ![](/assets/images/dxl/JST_EHR-4.png)<br />[JST EHR-04]    | ![](/assets/images/dxl/molex_510210500.png)<br />[MOLEX 51021-0500] | ![](/assets/images/dxl/molex_510210300.png)<br />[MOLEX 51021-0300] |
|   PCB 헤더   | ![](/assets/images/dxl/JST_B3B_EH-A.png)<br />[JST B3B-EH-A] | ![](/assets/images/dxl/JST_B4B-EH-A.png)<br />[JST B4B-EH-A] | ![](/assets/images/dxl/molex_530470510.png)<br />[MOLEX 53047-0510] | ![](/assets/images/dxl/molex_533980371.png)<br />[MOLEX 53398-0371] |
| Crimp 터미널 |                     [JST SEH-001T-P0.6]                      |                     [JST SEH-001T-P0.6]                      |                         [MOLEX 50079-8100]                          |                         [MOLEX 50058-8000]                          |
|  Wire Gauge  |                            21 AWG                            |                            21 AWG                            |                               26 AWG                                |                               26 AWG                                |
{% endif %}

{% include kr/dxl/pinout_warning.md %}

[JST EHR-03]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST EHR-04]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST B3B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST B4B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST SEH-001T-P0.6]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[MOLEX 51021-0500]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0510210500_CRIMP_HOUSINGS.xml
[MOLEX 53047-0510]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0530470510_PCB_HEADERS.xml
[MOLEX 50079-8100]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0500798100_CRIMP_TERMINALS.xml
[MOLEX 53398-0371]: https://uk.farnell.com/molex/53398-0371/header-smt-vertical-1-25mm-3way/dp/1125353
[MOLEX 51021-0300]: https://www.korean.molex.com/molex/products/datasheet.jsp?part=active/0510210300_CRIMP_HOUSINGS.xml
[MOLEX 50058-8000]: https://www.korean.molex.com/molex/products/datasheet.jsp?part=active/0500588000_CRIMP_TERMINALS.xml
