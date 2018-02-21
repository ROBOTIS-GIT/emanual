---
layout: popup
---

- File: `robotis_controller_msgs/StatusMsg.msg`

- Message Definition
  ```c
  # Status Constants
  uint8 STATUS_UNKNOWN = 0
  uint8 STATUS_INFO = 1
  uint8 STATUS_WARN = 2
  uint8 STATUS_ERROR = 3

  std_msgs/Header header
  uint8 type
  string module_name
  string status_msg
  ```

- Description
This message is used to identify the status of each module.

    * `header` ([`std_msgs/Header`])
&emsp;&emsp; This field specifies recorded time of the status message.

    * `type`
&emsp;&emsp; This field specifies the type of status message.
&emsp;&emsp; - STATUS_UNKNOWN : Unknown type of status message.
&emsp;&emsp; - STATUS_INFO : Status message includes information.
&emsp;&emsp; - STATUS_WARN : Status message includes warnings.
&emsp;&emsp; - STATUS_ERROR : Status message includes errors.

    * `module_name`
&emsp;&emsp; This field specifies the module name that transmits the status message.

    * `status_msg`
&emsp;&emsp; This field contains contents of the status message.

[`std_msgs/Header`]: /docs/en/popup/std_msgs_header/
