### 1. Overview
How to execute Gazebo simulation

### 2. Additional installation for Gazebo
[[Gazebo installation|Gazebo installation]]

### 3. How to execute Gazebo
* Load Robotis Manipulator in Gazebo
```   
$ roslaunch manipulator_h_gazebo manipulator_h_gazebo.launch   
```   

### 4. [[manipulator_manager]] for Gazebo
* Set up the `manipulator_h_manager.launch` for Gazebo simulation      
```   
    <param name="gazebo"                   value="false"     type="bool"/>
    <param name="gazebo_robot_name"        value="robotis_manipulator_h" />
```

* manipulator_h_manager execution   
```
$ roslaunch manipulator_h_manager manipulator_h_manager.launch
```

* The other execution for operating manipulator using GUI   
[[How to operate GUI program]]   

<br>
[&lt;&lt; Back](ROBOTIS MANIPULATOR User's Guide)