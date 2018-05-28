---
layout: popup
---

- File: `robotis_controller_msgs/WriteControlTable.msg`

- Message Definition
 ```c
 string joint_name
 string start_item_name
 uint16 data_length
 uint8[] data
 ```

- Description
This message writes control values on multiple items of a specific joint with the Sync Write command.

    * `joint_name`
&emsp;&emsp; Name of a joint to be used for Sync Write

    * `start_item_name`
&emsp;&emsp; The starting item name of the data

    * `data_length`
&emsp;&emsp; The length of the data

    * `data`
&emsp;&emsp; Data array to write on the control table of a specific joint
