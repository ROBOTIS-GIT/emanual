### 1. Overview   
This chapter explains upgraded walking and footstep planner.

> Reference : [OP3-How-to-control-upgraded-walking]

### 2. Getting started  
#### 2.1 Installation
 - [humanoid_navigation] for footstep planner  
     follow link and install the packages  

 - [op3_navigation]
    - Download source
        ```
        $ cd ~/catkin_ws/src
        $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Tools.git
        ```  
    - Build source
        ```
        $ cd ~/catkin_ws
        $ catkin_make
        ```  


#### 2.2 Run the program  
1. op3_manager
   ```
   $ roslaunch op3_manager op3_manager.launch
   ```  

2. op3_gui_demo and footstep planner
   ```
   $ roslaunch op3_gui_demo op3_demo_walking.launch
   ```  

3. rviz for upgraded walking with footstep planner  
  If user want to launch a rviz in ROBOTIS-OP3, a monitor is connected to ROBOTIS-OP3.  
   ```
   $ roslaunch robotis_op3_description robotis_op3_walking.launch
   ```  

#### 2.3 Walking with footstep planner
- Preparation : Set the module and move to the tab
  1. Setting the module : Click `online_walking_module` button

  2. Select `Online Walking` tab of the gui demo program.

 <img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_online_walking_01.png?raw=true" align="bottom"/>   


- Controlling walking of ROBOTIS-OP3
   1. Go to initial pose : click `Go to Initial Pose` button

   2. Balance On   

   3. Set the walking parameters     

  <img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_online_walking_footstep_01.png?raw=true" align="bottom"/>      

   ** **  
   4. Set a interactive marker in rviz 3d screen and Move the marker to the target pose of feet.   

  <img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_online_walking_footstep_02.png?raw=true" align="bottom"/>  

    <img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_online_walking_footstep_04.png?raw=true" align="bottom"/>    

   ** **  
   5. plan the path and send a walking message to ROBOTIS-OP3     

  <img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_online_walking_footstep_03.png?raw=true" align="bottom"/>   

   <img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_online_walking_footstep_05.png?raw=true" align="bottom"/>   



[&lt;&lt; Back](OP3-User's-Guide.md)

[OP3-How-to-control-upgraded-walking]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/OP3-How-to-control-upgraded-walking
[humanoid_navigation]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/humanoid_navigation
[op3_navigation]:https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Tools/tree/master/op3_navigation
