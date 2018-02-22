---
layout: popup
---

- File: `robotis_controller_msgs/SyncWriteItem.msg`

- Message Definition
 ```c
 string item_name
 string[] joint_name
 uint32[] value
 ```

- Description
This message writes a control value on a specific item of multiple joints with the Sync Write command.

    * `item_name`
&emsp;&emsp; Item name to be used for Sync Write

    * `joint_name`
&emsp;&emsp; Name of each joint

    * `value`
&emsp;&emsp; Value to write on the item of each joint
