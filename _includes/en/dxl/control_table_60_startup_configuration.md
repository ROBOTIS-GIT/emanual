{% if page.product_group == 'xl330' or page.product_group == 'xc330' %}
{% assign firmware_version_startup_configuration = "firmware **V46**" %}
{% else %}
{% assign firmware_version_startup_configuration = "firmware **V45**" %}
{% endif %}

The Startup Configuration(60) determines a status of DYNAMIXEL upon powering. 

|     Bit     |       Item        | Description                                                                                                                                                                             |
|:-----------:|:-----------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Bit 7(0x80) |         -         | Unused, always ‘0’                                                                                                                                                                      |
| Bit 6(0x40) |         -         | Unused, always ‘0’                                                                                                                                                                      |
| Bit 5(0x20) |         -         | Unused, always ‘0’                                                                                                                                                                      |
| Bit 4(0x10) |         -         | Unused, always ‘0’                                                                                                                                                                      |
| Bit 3(0x08) |         -         | Unused, always ‘0’                                                                                                                                                                      |
| Bit 2(0x04) |         -         | Unused, always ‘0’                                                                                                                                                                      |
| Bit 1(0x02) |    RAM Restore    | **[0]** On boot, data in RAM area are restored to default.  <br>**[1]** On boot, data in RAM area are restored to your backup data.                                                     |
| Bit 0(0x01) | Startup Torque On | **[0]** On boot, DYNAMIXEL is on a status of Torque On (Value of Torque Enable(64) is '0') <br>**[1]**On boot, DYNAMIXEL is on a status of Torque Off (Value Torque Enable(64) is '1'). |

**NOTE**: Startup Configuration is available from {{ firmware_version_startup_configuration }}. 
{: .notice}

**NOTE**: For more details about RAM Restore, see [How to Restore RAM Data](/docs/en/software/dynamixel/dynamixel_wizard2/#how-to-restore-ram-data).
{: .notice}
