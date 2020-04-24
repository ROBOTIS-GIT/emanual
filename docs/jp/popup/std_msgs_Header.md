---
layout: popup
---

- File : `std_msgs/Header.msg`
- Raw Message Definition

  ```c
  # Standard metadata for higher-level stamped data types.
  # This is generally used to communicate timestamped data
  # in a particular coordinate frame.
  #
  # sequence ID: consecutively increasing ID
  uint32 seq
  #Two-integer timestamp that is expressed as:
  # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
  # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
  # time-handling sugar is provided by the client library
  time stamp
  #Frame this data is associated with
  # 0: no frame
  # 1: global frame
  string frame_id
  ```

- Compact Message Definition

  ```c
  uint32 seq
  time stamp
  string frame_id
  ```
