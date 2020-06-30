
| Item                    | Specifications                                                 |
|:------------------------|:---------------------------------------------------------------|
| MCU                     | {{ site.data.dxl_p_info[page.ref].mcu }}                 |
| Motor                   | {{ site.data.dxl_p_info[page.ref].motor }}              |
| Baud Rate               | {{ site.data.dxl_p_info[page.ref].baudrate }}           |
| Operating Modes         | {{ site.data.dxl_p_info[page.ref].opmode_en }}          |
| Weight                  | {{ site.data.dxl_p_info[page.ref].weight }}             |
| Dimensions (W x H x D)  | {{ site.data.dxl_p_info[page.ref].dimensions }}         |
| Resolution              | {{ site.data.dxl_p_info[page.ref].resolution }}         |
| Gear Ratio              | {{ site.data.dxl_p_info[page.ref].gearratio }}          |
| Backlash                | {{ site.data.dxl_p_info[page.ref].backlash }}           |{% if site.data.dxl_p_info[page.ref].radialload_en != 'N/A' %}
| [Radial Load]{: .popup} | {{ site.data.dxl_p_info[page.ref].radialload_en }}      |{% else %}{% endif %}{% if site.data.dxl_p_info[page.ref].axialload != 'N/A' %}
| [Axial Load]{: .popup}  | {{ site.data.dxl_p_info[page.ref].axialload }}          |{% else %}{% endif %}
| No Load Speed           | {{ site.data.dxl_p_info[page.ref].noloadspeed }}        |
| No Load Current         | {{ site.data.dxl_p_info[page.ref].noloadcurrent }}      |
| `1` Continuous Speed    | {{ site.data.dxl_p_info[page.ref].contspeed }}          |
| `1` Continuous Torque   | {{ site.data.dxl_p_info[page.ref].conttorque }}         |
| `1` Continuous Current  | {{ site.data.dxl_p_info[page.ref].contcurrent }}        |
| Output                  | {{ site.data.dxl_p_info[page.ref].output }}             |
| Operating Temperature   | {{ site.data.dxl_p_info[page.ref].temperature }}        |
| Input Voltage           | {{ site.data.dxl_p_info[page.ref].opvoltage }}          |
| Command Signal          | {{ site.data.dxl_p_info[page.ref].commandsignal }}      |
| Protocol Type           | {{ site.data.dxl_p_info[page.ref].protocoltype }}       |
| Physical Connection     | {{ site.data.dxl_p_info[page.ref].physicalconnection }} |
| ID                      | {{ site.data.dxl_p_info[page.ref].id }}                 |
| Standby Current         | {{ site.data.dxl_p_info[page.ref].standbycurrent }}     |

`1` These specifications are calculated based on the specifications of the core motor.  
Please consult ROBOTIS for the long term use or special use, or else refer to the Performance Graph for general use.
{: .notice}

[Radial Load]: /assets/images/dxl/axial_radial_load_pro.png
[Axial Load]: /assets/images/dxl/axial_radial_load_pro.png
