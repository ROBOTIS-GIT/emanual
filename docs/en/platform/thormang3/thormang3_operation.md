---
layout: archive
lang: en
ref: thormang3_operation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/thormang3/thormang3_operation/
sidebar:
  title: THORMANG3
  nav: "thormang3"
---

<div style="counter-reset: h1 4">
</div>

# [THORMANG3 Operation](#thormang3-operation)

## [Preparation](#preparation)

### Time Synchronization (MPC)
> Reference : [ROS network Setup, 5. Timing issues](http://wiki.ros.org/ROS/NetworkSetup#Timing_issues.2C_TF_complaining_about_extrapolation_into_the_future.3F)

1. Connect to the **MPC(Motion PC)**
   - via ssh  
      1. Run below command on the terminal.  
         ```
         ssh robotis@10.17.3.35
         ```
  
      2. Input password  
         `111111`  
 	
   - via VNC  
   
2. Synchronize time with the PPC(Perception PC)  
   1. If this is the first synchronization, create the script file.   
      1. Create the script file with an editor.  
         ```
         $ gedit ~/timesync
         ```
        
      2. Copy below contents in the script file.  
         ```bash
         #! /bin/sh
         sudo date --set='-2 secs'
         sudo ntpdate 10.17.3.35
         sudo hwclock -w
         ```
      3. Modify the script file permission(Add execute permission)  
         ```
         $ sudo chmod +x timesync
         ```
         
      4. Execute the script file to synchronize time.  
         ```
          $ ~/timesync
         ```
          
   2. If this is not the first synchronization, execute the script file.  
      ```
      $ ~/timesync
      ```

### roscore (PPC)
1. Connect to the **PPC**
   - via ssh  
      1. Run below command on the terminal.  
         ```
         ssh robotis@10.17.3.35
         ```
         
      2. Input password.  
        `111111`  
      
   - via VNC  
   
2. Launch [roscore](http://wiki.ros.org/roscore)  
	Execute below command on the Terminal  
    
   ```
   $ roscore
   ```
    
   - If `roscore` is terminated while it is running, relaunch `roscore`,   
      `thormang3 sensors` and `thormang3 manager`.

### thormang3 sensors (PPC)
1. Connect to the **PPC**  
2. Execute [thormang3_sensors.launch](https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-PPC/blob/master/thormang3_sensors/launch/thormang3_sensors.launch) file  
   ```
   $ roslaunch thormang3_sensors thormang3_sensors.launch
   ```
	
  > Reference :: [[thormang3_sensors]]

### THORMANG3 Manager (MPC)
Turn on the actuator power before executing THORMANG3 Manager.  

1. Connect to the **MPC**  
2. Get superuser permission  
   ```
   $ sudo bash
   ```
   
3. Execute [thormang3_manager.launch](https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/thormang3_manager/launch/thormang3_manager.launch) file  
   ```
   # roslaunch thormang3_manager thormang3_manager.launch
   ```
	
   > Reference :: [[thormang3_manager]]  
4. If program is loaded, torque of the actuator will be turned on.  

- How to check thormang3 working
  > Reference 1 : [[How to execute Simple Demonstration]]  
  > Reference 2 : [[How to execute OPC's GUI program]] 
