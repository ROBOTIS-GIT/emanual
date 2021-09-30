{% if page.product_group == 'dxl_p' %}
{% assign firmware_version_backup = "firmware **V12**" %}
{% elsif page.product_group == 'xl330' or page.product_group == 'xc330' %}
{% assign firmware_version_backup = "firmware **V46**" %}
{% else %}
{% assign firmware_version_backup = "firmware **V45**" %}
{% endif %}

Indicates whether backup data of Control Table saved through [Control table Backup packet](/docs/en/dxl/protocol2/#control-table-backup-0x20) exist. 

| Value | Description                           |
|:-----:|:--------------------------------------|
|   0   | No Control Table's backup data        |
|   1   | Control Table's backup data is saved. |

**NOTE**: Backup Ready is available from {{ firmware_version_backup }}. See [Data Backup and Restore](/docs/en/software/dynamixel/dynamixel_wizard2/#data-backup-and-restore) for more details.
{: .notice}
