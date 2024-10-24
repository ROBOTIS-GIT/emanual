
|     항목     |                            RS-485                   |         |                                           Power                                            | |
|:------------:|:-----------------------------------------------------:|:-------:|:------------------------------------------------------------------------------------------:|:--:|
|   핀 번호    |                   `1` DATA+<br />`2` DATA-              |    |                                    `1` GND<br /> `2` VDD                                     | 
|  다이어그램  | ![](/assets/images/dxl/y/molex_505565-0200_diagram.jpg) | ![](/assets/images/dxl/y/molex_39500-0002_diagram.jpg) | ![](/assets/images/dxl/y/molex_39503-2002_diagram.jpg) | ![](/assets/images/dxl/y/molex_39503-3002_diagram.jpg)  | 
|    하우징    | ![](/assets/images/dxl/y/molex_505565-0200.jpg)<br />Molex 505565-0200 |  S/T type<br />![](/assets/images/dxl/y/molex_39530-0002.jpg)<br />Molex 39530-0002       |  R/A type 1<br />![](/assets/images/dxl/y/molex_39533-2002.jpg)<br />Molex 39533-2002 | R/A type 2<br />![](/assets/images/dxl/y/molex_39533-3002.jpg)<br />Molex 39533-3002  | 
|   PCB 헤더   | ![](/assets/images/dxl/y/molex_505568-0381.jpg)<br />Molex 505568-0381 |       |  ![](/assets/images/dxl/y/molex_39531-1002.jpg)<br />Molex 39531-1002 |                                     |
| Crimp 터미널 | ![](/assets/images/dxl/y/molex_504185-1000.png)<br />Molex 504185-1000    |      |  ![](/assets/images/dxl/y/option_ce010010.png)<br />(Option) CE010010(1.0SQ, L16, P10) |                                     |    
|  전선 규격    |                            26 AWG                           |                       |                    20 AWG                                   |                                      |

**주의**: 구동 전에 반드시 전원포트를 통해 24V 전원을 공급해주세요. 배선 시에는 핀 배열이 틀리지 않도록 각별히 주의하십시오. 올바르게 연결되지 않을 경우 다이나믹셀의 심각한 손상을 초래할 수 있습니다.
{: .notice--warning}

**참고**: DYNAMIXEL-Y는 중공의 활용도를 높이고, 전류공급 및 통신의 안정성을 확보하기 위하여 새로운 커넥터를 사용합니다. 기존 DYNAMIXEL에서 사용하던 JST 커넥터만으로는 DYNAMIXEL-Y 구동에 필요한 전류를 안정적으로 공급할 수 없습니다. 반드시 지정된 커넥터를 사용하시기 바랍니다.
{: .notice}

**참고**: DYNAMIXEL-Y와 U2D2간 통신이 불안정한 경우 전원라인의 GND를 U2D2의 GND에 연결하여 사용하시기 바랍니다.
{: .notice}