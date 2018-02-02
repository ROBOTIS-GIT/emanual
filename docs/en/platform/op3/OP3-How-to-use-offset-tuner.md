### 1. Overview   
This chapter explains how to run the ROBOTIS-OP3 offset tuner program.  
`op3_offset_tuner_server` and `op3_offset_tuner_client` are used to adjust offsets of ROBOTIS-OP3.  

> Reference : [op3_offset_tuner_server]  
> Reference2 : [op3_offset_tuner_client]

<img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_offset_tuner_diagram.png?raw=true" align="bottom" width="100%"/>  

### 2. Run Offset Tuner Program   

### 2.1. How to launch programs  
#### 2.1.1 Launching server and client program separately
Offset Tuner is consisted of server and client programs so that other PC in the same ROS network can tune offsets.  

Execute the offset tuner server program first.  
(Other programs such as `op3_manager`, `op3_action_editor` and `op3_walking_tuner` should be terminated to run the offset tuner server).  

```
$ roslaunch op3_offset_tuner_server op3_offset_tuner_server.launch
```

After starting the offset tuner server, execute client GUI program from the identical PC or any PCs in the same ROS network.  

```
$ rosrun op3_offset_tuner_client op3_offset_tuner_client
```

#### 2.1.2 Launching server and client program at once
Enter the following commands in the terminal window.
(Other programs such as `op3_manager`, `op3_action_editor` and `op3_walking_tuner` should be terminated to run the offset tuner.)
```
$ roslaunch op3_offset_tuner_client op3_offset_tuner.launch
```



### 2.2 Configuration Files
#### 2.2.1 `op3_offset_tuner_server` configuration files  
 - `offset.yaml` : Offset data and offset adjusting posture information are saved  
 - `OP3.robot` : Description of ROBOTIS-OP3 is saved  
 - `dxl_init_OP3.yaml` : Dynamixel configurations are saved and used for joint initialization  

#### 2.2.2 `op3_offset_tuner_client` configuration file  
 - `joint_data.yaml` : GUI menu configuration file  

### 3. How to use Offset tuner client GUI program  
<img
src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-THORMANG3/How%20to%20use%20offset%20tuner_2.png?raw=true" align="bottom" width="100%"/>


[&lt;&lt; Back](OP3-User's-Guide.md)

[op3_offset_tuner_server]:[op3_offset_tuner_server.md]
[op3_offset_tuner_client]:[op3_offset_tuner_client.md]
