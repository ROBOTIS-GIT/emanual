### 1. Overview  
How to set up & execute gazebo simulation

### 2. Recommendation  
If Gazebo is running on the OPC, realtime factor can be decreased, therefore, it is recommended to use a separate PC for Gazebo.

### 3. How to execute  
* The command to call ROBOTIS-OP3 in Gazebo
```
$ roslaunch robotis_op3_gazebo robotis_world.launch
```
![op3_gazebo](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_gazebo.png?raw=true)

### 4. [op3_manager](op3_manager) for Gazebo  

* Launch op3_manager for gazebo   
```
$ roslaunch op3_manager op3_gazebo.launch
```

* Please refer to below tutorials for the rest procedures.   
[OP3 Tutorials](OP3_Tutorials)

### 5. To improve gazebo simulation

* Change joint gain   
[Controller File](https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Common/blob/master/robotis_op3_gazebo/config/position_controller.yaml)

* Edit physics engine   
[World File](https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Common/blob/master/robotis_op3_gazebo/worlds/empty.world)


[&lt;&lt; Back](OP3 User's Guide)
