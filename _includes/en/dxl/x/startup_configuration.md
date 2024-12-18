{% if page.product_group == 'dxl_p' %}
{% assign firmware_version_startup_configuration = "firmware **V12**" %}
{% elsif page.product_group == 'xl330' or page.product_group == 'xc330' %}
{% assign firmware_version_startup_configuration = "firmware **V46**" %}
{% else %}
{% assign firmware_version_startup_configuration = "firmware **V45**" %}
{% endif %}

Startup Configuration(60) allows users to configure several settings to apply on actuator startup. See the following table for information on available settings.

|     Bit     |       Item        | Description                                                                                                                            |
|:-----------:|:-----------------:|:---------------------------------------------------------------------------------------------------------------------------------------|
| Bit 7(0x80) |         -         | Unused, always ‘0’                                                                                                                     |
| Bit 6(0x40) |         -         | Unused, always ‘0’                                                                                                                     |
| Bit 5(0x20) |         -         | Unused, always ‘0’                                                                                                                     |
| Bit 4(0x10) |         -         | Unused, always ‘0’                                                                                                                     |
| Bit 3(0x08) |         -         | Unused, always ‘0’                                                                                                                     |
| Bit 2(0x04) |         -         | Unused, always ‘0’                                                                                                                     |
| Bit 1(0x02) |    RAM Restore    | **[0]** Deactivate RAM restoration on startup.<br>**[1]** On startup, use saved backup data to restore RAM configuration.            |
| Bit 0(0x01) | Startup Torque On | **[0]** Torque Off on startup (`Torque Enable(64)` is set to `0`)<br>**[1]** Torque On on startup (`Torque Enable(64)` is set to `1`). |

**NOTE**: Startup Configuration is available from {{ firmware_version_startup_configuration }}. 
{: .notice}

**NOTE**: For more details about restoring the RAM area, see [Restoring RAM Area](/docs/en/software/dynamixel/dynamixel_wizard2/#restoring-ram-area).
{: .notice}
