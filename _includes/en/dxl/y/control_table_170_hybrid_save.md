Hybrid Save indicates whether or not the Hybrid memory area has been modified since it was last saved, and allows requesting saves of the hybrid memory area.
Writing '1' to this control table item will save the current values of the hybrid memory to storage.

| Value | Label              | Description                                                                                            |
| :---: | :----------------: | :------------------------------------------------------------------------------------------------------|
| 0     | Changed            | There are unsaved values in the Hybrid area.                                                           |
| 1     | Save Request       | Request to save values in the Hybrid area. This can only be requested when the [Torque Enable(512)] value is ‘0’. |
| 2     | Saved              | The values in the Hybrid area have been saved.                                                         |


**Note** : If the value of Hybrid Save is '0', changes to hybrid memory will not be saved if the device is rebooted or power is disconnected.
{: .notice}

