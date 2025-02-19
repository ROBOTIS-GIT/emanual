
**NOTE**: This feature is available for ROS2 `Humble`.  
{: .notice--info}  


### Description  
<iframe width="640" height="360" src="https://www.youtube.com/embed/IVut8qZOrEk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  - **What is Load Multiple TurtleBot3s example?**  
    - This example shows how to operate multiple TurtleBot3s in one Remote PC.  
    - If you operate multiple TurtleBots as if you were operating just one, you won’t be able to distinguish which topic belongs to which robot.  
    ![](/assets/images/platform/turtlebot3/basic_examples/load_multiple_turtlebot3s/explain1.png)  
    - You can assign namespace to each TurtleBot3's `node`, `topic`, `frame` as so you can identify each of TurtleBot3.  
    ![](/assets/images/platform/turtlebot3/basic_examples/load_multiple_turtlebot3s/explain2.png)  

  - **Function of launch files**  
    1. multi_robot.launch.py  
      - Launch sub launch files(gzsever, gzclient, robot_state_publisher, multi_spawn_turtlebot3) with parameter.  
      - Modifying model SDF temporarily for changing odom frame_id and base scan's target frame_id.  
    2. robot_state_publisher.launch.py → robot_state_publisher node  
      - Read model urdf and make `/tf` of hardware of robot.  
    3. multi_spawn_turtlebot3.launch.py → spawn_entity.py  
      - Read model.sdf and spawn TurtleBot3 model in gazebo world.  
      - Sensor data is made by plugin that is written in model.sdf.  

### [Multi Robot launch in Gazebo](#multi-robot-launch-in-gazebo)  

<div class="notice">  
  **In this chapter, we show how to launch multi robot in gazebo and result of that**  
</div>  

- Launch the multi_robot.launch in gazebo package.  
```bash
  $ ros2 launch turtlebot3_gazebo multi_robot.launch.py  
```  
<br>

- You can see three TurtleBot3s as below picture.  
   ![](/assets/images/platform/turtlebot3/basic_examples/load_multiple_turtlebot3s/multi_robot_gazebo.png)  
<br>

- Nodes and topics are completely saparated by namespace.  
  ![](/assets/images/platform/turtlebot3/basic_examples/load_multiple_turtlebot3s/node_graph_gazebo.png)  

<div class="notice--info">
**NOTE**  
  - Namespace is not necessary for `/tf` and `/tf_static`.  
  - tf2_ros package manages `/tf` & `/tf_static`, allowing multiple nodes to publish `/tf` & `/tf_static`.  
  - Instead, frame_ids in `/tf` & `/tf_static` must be unique.  
</div>
<br>

- Frames are completely saparated by namespace.  
  ![](/assets/images/platform/turtlebot3/basic_examples/load_multiple_turtlebot3s/frames_graph_gazebo.png)  

### [Modifing Multi Robot launch in Gazebo](#modifing-multi-robot-launch)  

<div class="notice">
  **In this chapter, we will learn how to modify the launch files to fit Gazebo simulation for your own project**  
</div>

- **Change robot number.**  
  - multi_robot.launch → Change value of `number_of_robot` variable.  
- **Change world model.**  
  - multi_robot.launch → Change value of `world` varible to your world file path.  
- **Change robot spawn location.**  
  - multi_robot.launch → Change value of `pose` list. Row means robot number, column[0] is `x_pose`, column[1] is `y_pose`  
- **Change robot namespace.**  
  - multi_robot.launch → Change value of `namespace` variable.  

  ![](/assets/images/platform/turtlebot3/basic_examples/load_multiple_turtlebot3s/multi_robot_code.png)  
<br>

**TurtleBot3 World Example**  
- You can see three TurtleBot3s as below picture.  
<div class="notice--info">
  `number_of_robot` = 4  
  `pose` = [[-2,-0.5], [0.5,-2], [2,0.5], [-0.5,2]]  
  `world` = turtlebot3_world.world  
</div>
  ![](/assets/images/platform/turtlebot3/basic_examples/load_multiple_turtlebot3s/multi_robot_turtlebot3_world.png)  


### [Multi Robot launch in reality](#multi-robot-launch-in-reality)  

<div class="notice">
  **In this chapter, we show how to launch multi robot in reality and result of that**  
</div>

- Modify the frame_id of the topic header. This allows sensor data to be viewed separately in RViz2.  
<div class="notice--danger">
  **This task should be performed on the files located on the TurtleBot SBC where bringup is operated.**  
</div>

```bash
$ nano ~/turtlebot3_ws/src/turtlebot3/turtlebot3_node/include/turtlebot3_node/sensors/imu.hpp  
```
  ![](/assets/images/platform/turtlebot3/basic_examples/load_multiple_turtlebot3s/imu_hpp.png)  

```bash
$ nano ~/turtlebot3_ws/src/ld08_driver/src/lipkg.cpp  
```
  ![](/assets/images/platform/turtlebot3/basic_examples/load_multiple_turtlebot3s/lipkg_cpp.png)  
<br>

- Launch bringup with argument namespace.  
```bash
$ ros2 launch turtlebot3_bringup robot.launch.py namespace:=tb3_1 # Insert what you want to use as namespace
```
<br>

- Nodes and topics are completely saparated by namespace.  
  ![](/assets/images/platform/turtlebot3/basic_examples/load_multiple_turtlebot3s/node_graph_reality.png)  



### [Multi Robot Teleop](#multi-robot-teleop)
<div class="notice">
  **In this chapter, we will control multi robot with teleop in Gazebo simulation.**  
</div>

```bash
$ ros2 run turtlebot3_teleop teleop_keyboard --ros-args -r __ns:=/tb3_1 # Change the number to the robot you want to control  
```  
```bash
$ ros2 run turtlebot3_teleop teleop_keyboard Change --ros-args -r __ns:=/tb3_1

Control Your TurtleBot3!
---------------------------
Moving around:
        w
   a    s    d
        x

w/x : increase/decrease linear velocity (Burger : ~ 0.22, Waffle and Waffle Pi : ~ 0.26)
a/d : increase/decrease angular velocity (Burger : ~ 2.84, Waffle and Waffle Pi : ~ 1.82)

space key, s : force stop

CTRL-C to quit
```



[Multi Robot launch in Gazebo]: #multi-robot-launch-in-gazebo 
[Modifing Multi Robot launch in Gazebo]: #modifing-multi-robot-launch  
[Multi Robot launch in reality]: #multi-robot-launch-in-reality  
[Multi Robot Teleop]: #multi-robot-teleop
