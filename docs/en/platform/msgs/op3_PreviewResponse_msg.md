---
layout: archive
lang: en
ref: msgs_op3_PreviewResponse_msg
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/msgs/op3_PreviewResponse_msg/
sidebar:
  title: MSGS
  nav: "msgs"
---

# [op3_PreviewResponse_msg](#op3-previewresponse-msg)

- File: `op3_online_walking_module_msgs/PreviewResponse.msg`

- Message Definition
 ```c
 int32 K_row
 int32 K_col
 float64[] K
 int32 P_row
 int32 P_col
 float64[] P
 ```

- Description

[Riccati Equation's solution](https://help.scilab.org/doc/5.5.2/en_US/riccati.html)

    * `K_row`   
&emsp;&emsp; Riccati Equation's solution K's row value      
    * `K_col`    
&emsp;&emsp; Riccati Equation's solution K's column value   
    * `K`   
&emsp;&emsp; Riccati Equation's solution K      
    * `P_row`    
&emsp;&emsp; Riccati Equation's solution P's row value   
    * `P_col`   
&emsp;&emsp; Riccati Equation's solution P's column value      
    * `P`   
&emsp;&emsp; Riccati Equation's solution P      
