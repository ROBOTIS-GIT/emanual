### 1. Overview   
This Node tunes walking parameters of ROBOTIS-OP3.  
Walking tuner function is included in the [op3_gui_demo].  
`op3_walking_tuner` runs on a terminal window while [op3_gui_demo] creates its own GUI window.    




### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages.md)  

 > Reference : `libncurses5-dev` must be pre-installed in order to build `op3_walking_tuner`.  
    ```
    $ sudo apt install libncurses5-dev
    ```  

#### 2.2 Run
Execute the launch file.  
`op3_walking_tuner` has a direct control over ROBOTIS-OP3, therefore other control programs such as `op3_manager`, `op3_action_editor` and `op3_offset_tuner_server` should not be running.  
Before executing the `op3_walking_tuner` launch file, other programs should be terminated.  
```
$ roslaunch op3_walking_tuner op3_walking_tuner.launch
```  


#### 2.3 UI
<img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_walk_tuner.png?raw=true" align="bottom"/>


#### 2.4 Usage
Please refer to [How to use walking tuner].

<br>[&lt;&lt; Back](ROBOTIS-OP3-Tools.md)

[op3_gui_demo]:[OP3-How-to-use-walking-tuner.md]
[op3_gui_demo]:[op3_gui_demo.md]
[How to use walking tuner]:[OP3-How-to-use-walking-tuner.md]
