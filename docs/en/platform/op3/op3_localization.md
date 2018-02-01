### 1. Overview  
`op3_localization` is ros node for localization.  
This node publish TF data from /world to /body_link.  

### 2. ROS API
#### 2.1 Subscribed Topics
`/robotis/pelvis_pose`([geometry_msgs::PoseStamped])  
&emsp;&emsp; This message will set the body_link pose from /world.  

`/robotis/pelvis_pose_reset`([std_msgs::String])  
&emsp;&emsp; This message will reset the body_link pose to default value.  

<br>[&lt;&lt; Back]

[geometry_msgs::PoseStamped]:(http://docs.ros.org/api/geometry_msgs/html/msg/PoseStamped.html)
[std_msgs::String]:(http://docs.ros.org/api/std_msgs/html/msg/String.html)
[&lt;&lt; Back]:[ROBOTIS-OP3.md]
