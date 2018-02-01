### 1. Overview
This chapter explains one of basic OP3 demos; vision.  
OP3 will use its camera to find and keep looking at the detected face.

### 2. Getting started
#### 2.1 Usage
 > Reference : [How to execute Default Demo]


### 3. ROS API
The followings are ROS APIs used only in vision demo.

#### 3.1 Subscribed Topics
`/face_tracker/command"`([std_msgs/String])  
&emsp;&emsp; This message controls vision demo

`/robotis/open_cr/button"`([std_msgs/String])  
&emsp;&emsp; This message processes button maneuver

`/faceCoord"`([std_msgs/Int32MultiArray])  
&emsp;&emsp; This message contains face information that ROBOTIS-OP3 will be looking at
- faceCoord[0] : fps
- faceCoord[1] : face size
- faceCoord[2] : image width
- faceCoord[3] : image height
- faceCoord[4] : face id
- faceCoord[5] : face detection length
- faceCoord[6] : face x position(top-left)
- faceCoord[7] : face y position(top-left)
- faceCoord[8] : face width
- faceCoord[9] : face height
- faceCoord[10~15] : information of the second face
- ...


#### 3.2 Published Topics
`/robotis/enable_ctrl_module`([std_msgs/String])  
&emsp;&emsp; This message configures control modules to operate ROBOTIS-OP3.  

`/robotis/action/page_num`([std_msgs/Int32])  
&emsp;&emsp; This message transfers page number to action_module to play specific actions.

`/robotis/sync_write_item`([std_msgs/String])  
&emsp;&emsp; This topic has a message to sync write data on ROBOTIS-OP3  
&emsp;&emsp; ex) LED controls  

`/robotis/head_control/set_joint_states_offset`([sensor_msgs/JointState])  
&emsp;&emsp; This message informs head_control_module about joint state offset to look at the face that is detected in the image.


<br>[&lt;&lt; Back](op3_demo.md)

[How to execute Default Demo]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/OP3-How-to-execute-Default-Demo
[std_msgs/String]:http://docs.ros.org/api/std_msgs/html/msg/String.html
[std_msgs/Int32]:http://docs.ros.org/api/std_msgs/html/msg/Int32.html
[std_msgs/Int32MultiArray]:http://docs.ros.org/api/std_msgs/html/msg/Int32MultiArray.html
[sensor_msgs/JointState]:http://docs.ros.org/api/sensor_msgs/html/msg/JointState.html
