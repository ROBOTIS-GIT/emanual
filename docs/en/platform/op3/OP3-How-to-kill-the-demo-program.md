### 1. Overview
This chapter explains how to kill the demo program of ROBOTIS-OP3.  

### 2. Kill demo program
In order to terminate automatically executed demo program, enter below command in the terminal window.  
```
$ sudo service OP3-demo stop
```




### 3. Running demo on startup
This chapter describes settings for automatically executing demo on startup.  
Autorun feature requires robot_upstart package from ROS.  
> Reference : [robot_upstart](http://wiki.ros.org/robot_upstart)  

#### 3.1 Start demo program on start  
1. Make a script for auto-run
Open a new terminal window and execute below commands.  
_(password : 111111)_  
   ```
   $ rosrun robot_upstart install --job JOB_NAME --user root --master http://10.42.0.1 op3_demo/launch/demo.launch
   ```
   - JOB_NAME : This item specifies job name to autorun. The job name will be registered on the service.  
     **ex : OP3-demo**
      ```
      rosrun robot_upstart install --job OP3-demo --user root --master http://10.42.0.1:11311 op3_demo/launch/demo.launch
      ```
   - NOTE : Autorun program will be generated based on `op3_demo/launch/demo.launch`.  
2. Modify the script  
  - open service file and modify the contents
    ```
    $ sudo xed /usr/sbin/OP3-demo-start
    ```
    - from : ```export ROS_HOSTNAME=$(hostname)```
    - to : ```export ROS_HOSTNAME=10.42.0.1```
3. Run the service
   ```
   $  sudo systemctl daemon-reload && sudo systemctl start JOB_NAME
   ```
   - `daemontools` Installation : If `daemontools` is not installed on the system, execute below command.  
     ```
     $ sudo apt install daemontools
     ```


#### 3.2 Stop demo program on start
Open a new terminal window and execute following commands.   
```
$ rosrun robot_upstart uninstall JOB_NAME
```



[&lt;&lt; Back](OP3-User's-Guide.md)
