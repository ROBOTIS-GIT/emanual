
| Item                           | Specifications                                            |
|:-------------------------------|:----------------------------------------------------------|
| MCU                            | {{ site.data.dxl_y_info[page.ref].mcu }}                  |
| Motor                          | {{ site.data.dxl_y_info[page.ref].motor }}                |
| Baud Rate                      | {{ site.data.dxl_y_info[page.ref].baudrate }}             |
| Operating Modes                | {{ site.data.dxl_y_info[page.ref].opmode_en }}            |
| Weight                         | {{ site.data.dxl_y_info[page.ref].weight }}               |
| Dimensions (W x H x D)         | {{ site.data.dxl_y_info[page.ref].dimensions }}           |
| Hollow Shaft Size              | {{ site.data.dxl_y_info[page.ref].holesize }}             |
| Resolution                     | {{ site.data.dxl_y_info[page.ref].resolution }}           |
| Encoder Specifications         | {{ site.data.dxl_y_info[page.ref].encoderspec }}          |
| Gear Ratio                     | {{ site.data.dxl_y_info[page.ref].gearratio }}            |
| Backlash                       | {{ site.data.dxl_y_info[page.ref].backlash }}             |
| Radial Load                    | {{ site.data.dxl_y_info[page.ref].radialload_en }}        |
| Brake type                     | {{ site.data.dxl_y_info[page.ref].brake }}                |
| No Load Speed                  | {{ site.data.dxl_y_info[page.ref].noloadspeed }}          |
| Continuous Speed               | {{ site.data.dxl_y_info[page.ref].contspeed }}            |
| Continuous Torque              | {{ site.data.dxl_y_info[page.ref].conttorque }}           |
| Continuous Current<sup>1)<sup> | {{ site.data.dxl_y_info[page.ref].contcurrent }}          |
| Maximum Torque<sup>2)<sup>     | {{ site.data.dxl_y_info[page.ref].maximumtorque }}        |
| Maximum Current<sup>1) 2)<sup> | {{ site.data.dxl_y_info[page.ref].maximumcurrent }}       |
| Output                         | {{ site.data.dxl_y_info[page.ref].output }}               |
| Operating Temperature          | {{ site.data.dxl_y_info[page.ref].temperature }}          |
| Command Signal                 | {{ site.data.dxl_y_info[page.ref].commandsignal }}        |
| Physical Connection            | {{ site.data.dxl_y_info[page.ref].connection_en }}        |
| ID                             | {{ site.data.dxl_y_info[page.ref].id }}                   |
| Standby Current                | {{ site.data.dxl_y_info[page.ref].standbycurrent }}       |


{% capture spec_notice %}
1. Current values are based on the phase current of the internal motor.
2. The Maximum Torque and Current values represent the servo's maximum instantaneous output. Continuous operation at or near these values will initiate an overload error to protect the device from damage. 
{% endcapture %}
<div class="notice">{{ spec_notice | markdownify }}</div>

