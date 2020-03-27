---
layout: archive
lang: en
ref: msgs_std_msgs_header
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/msgs/std_msgs_header/
sidebar:
  title: MSGS
  nav: "msgs"
---

# [std_msgs_header](#std-msgs-header)

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
