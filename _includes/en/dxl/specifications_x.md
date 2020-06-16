
| Item                          | Specifications                                                                                                                           |
|:------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------|
| MCU                           | {{ site.data.dxl_x_info[page.ref].mcu }}                                                                                                 |
| Position Sensor               | {{ site.data.dxl_x_info[page.ref].encoder }}                                                                                             |
| Motor                         | {{ site.data.dxl_x_info[page.ref].motor }}                                                                                               |
| Baud Rate                     | {{ site.data.dxl_x_info[page.ref].baudrate }}                                                                                            |
| Control Algorithm             | {{ site.data.dxl_x_info[page.ref].control }}                                                                                             |
| Resolution                    | {{ site.data.dxl_x_info[page.ref].resolution }}         |{% if site.data.dxl_x_info[page.ref].backlash != 'N/A' %}                       |
| Backlash                      | {{ site.data.dxl_x_info[page.ref].backlash }}           |{% else %}{% endif %}                                                           |
| Operating Modes               | {{ site.data.dxl_x_info[page.ref].mode_en }}                                                                                             |
| Weight                        | {{ site.data.dxl_x_info[page.ref].weight }}                                                                                              |
| Dimensions (W x H x D)        | {{ site.data.dxl_x_info[page.ref].dimensions }}                                                                                          |
| Gear Ratio                    | {{ site.data.dxl_x_info[page.ref].gearratio }}                                                                                           |
| Stall Torque                  | {{ site.data.dxl_x_info[page.ref].stalltorque }}                                                                                         |
| No Load Speed                 | {{ site.data.dxl_x_info[page.ref].noloadspeed }}        |{% if site.data.dxl_x_info[page.ref].radialload_en != 'N/A' %}                  |
| [Radial Load]{: .popup}       | {{ site.data.dxl_x_info[page.ref].radialload_en }}      |{% else %}{% endif %}{% if site.data.dxl_x_info[page.ref].axialload != 'N/A' %} |
| [Axial Load]{: .popup}        | {{ site.data.dxl_x_info[page.ref].axialload }}          |{% else %}{% endif %}                                                           |
| Operating Temperature         | {{ site.data.dxl_x_info[page.ref].temperature }}        |{% if page.product_group=='dxl_xw540' %}                                        |
| **Ingress Protection rating** | **IP 68 (1 m, 24 hr)**                        |{% else %}{% endif %}                                                                     |
| Input Voltage                 | {{ site.data.dxl_x_info[page.ref].voltage_en }}                                                                                          |
| Command Signal                | {{ site.data.dxl_x_info[page.ref].command }}                                                                                             |
| Protocol Type                 | {{ site.data.dxl_x_info[page.ref].protocoltype }}                                                                                        |
| Physical Connection           | {{ site.data.dxl_x_info[page.ref].physicalconnection }}                                                                                  |
| ID                            | {{ site.data.dxl_x_info[page.ref].id }}                                                                                                  |
| Feedback                      | {{ site.data.dxl_x_info[page.ref].feedback }}                                                                                            |
| Part Material                 | {{ site.data.dxl_x_info[page.ref].material }}                                                                                            |
| Standby Current               | {{ site.data.dxl_x_info[page.ref].standbycurrent }}                                                                                      |

[Radial Load]: /assets/images/dxl/axial_radial_load.png
[Axial Load]: /assets/images/dxl/axial_radial_load.png
