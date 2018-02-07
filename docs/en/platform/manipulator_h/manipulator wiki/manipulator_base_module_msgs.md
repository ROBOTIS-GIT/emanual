###1. Overview
[[manipulator_base_module]]'s Message & Service  

###2. ROS Message Type
* JointPose.msg   
  * `name` : target joint name ([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))    
  * `value` : target joint value ([std_msgs/Float64](http://docs.ros.org/api/std_msgs/html/msg/Float64.html))    
* KinematicsPose.msg    
  * `name` : target kinematics group ([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))    
  * `pose` : target Pose ([geometry_msgs/Pose](http://docs.ros.org/api/geometry_msgs/html/msg/Pose.html))   

###3. ROS Service Type   
* GetJointPose.srv   
  * Request : `joint_name` : joint name ([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))   
  * Response : `joint_value` : joint value ([std_msgs/Float64](http://docs.ros.org/api/std_msgs/html/msg/Float64.html))   
* GetKinematicsPose.srv     
  * Request : `group_name` : kinematics group ([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))   
  * Response : `group_pose` : kinematics pose ([geometry_msgs/Pose](http://docs.ros.org/jade/api/geometry_msgs))   

<br>
[&lt;&lt; Back](ROBOTIS MANIPULATOR Module)