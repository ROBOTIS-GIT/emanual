### 1. Overview  
`op3_localization` is ros node for localization.  
This node publish TF data from /world to /body_link.  

### 2. ROS API
#### 2.1 Subscribed Topics
`/robotis/pelvis_pose`([geometry_msgs::PoseStamped]{: .popup})  
&emsp;&emsp; This message will set the body_link pose from /world.  

`/robotis/pelvis_pose_reset`([std_msgs::String]{: .popup})  
&emsp;&emsp; This message will reset the body_link pose to default value.  

<br>[&lt;&lt; Back]

[geometry_msgs::PoseStamped]: /docs/en/popup/geometry_msgs_PoseStamped_msg/
[std_msgs::String]: /docs/en/popup/std_msgs_string/
[&lt;&lt; Back]:robotis_op3.md
