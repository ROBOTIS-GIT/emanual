{% if page.product_group == 'dxl_p' %}
{% assign firmware_version_backup = "firmware **V12**" %}
{% elsif page.product_group == 'xl330' or page.product_group == 'xc330' %}
{% assign firmware_version_backup = "firmware **V46**" %}
{% else %}
{% assign firmware_version_backup = "firmware **V45**" %}
{% endif %}

The value in this address indicates whether a saved backup of the control table exists in the actuator's memory. For more information see [Control Table Backup Packet](/docs/en/dxl/protocol2/#control-table-backup-0x20).

| Value | Description                    |
|:-----:|:-------------------------------|
|   0   | There is no saved backup data  |
|   1   |   Saved backup data exists.    |

**NOTE**  
Backup Ready is available starting from {{ firmware_version_backup }}.  
See [Backup and Restore](/docs/en/software/dynamixel/dynamixel_wizard2/#backup-and-restore) for more details.
{: .notice}
