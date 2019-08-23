---
layout: archive
lang: en
ref: op3_getting_started
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/getting_started/
sidebar:
  title: ROBOTIS OP3
  nav: "op3"
product_group: op3
page_number: 3
---

<div style="counter-reset: h1 2"></div>

# [Getting Started](#getting-started)

## [How to Connect](#how-to-connect)

### Direct Connection  
Keyboard and monitor are directly connected to ROBOTIS-OP3.  


### Remote Connection

![](/assets/images/platform/op3/op3_connection.png)   

   **Connect to ROBOTIS-OP3 over the network.**  


#### Connection Type  
 - Via Wireless(WLAN)  
 IP address will be automatically assigned when connecting to ROBOTIS-OP3-Share.  
 After establishing Wi-Fi connection, use one of the connection methods described in the next section.
 (_password : 111111_)  

 - Via Wired(Ethernet)   
 When using wired connection, connect ROBOTIS OP3 to the same Router with PC so that OP3 can be connected as a DHCP client.  

#### How to connect
 - SSH
    1. Execute SSH client program (ex: PuTTY)
    2. Input ROBOTIS-OP3’s IP address : 10.42.0.1
    3. Select SSH as a connection type and then open it.
    4. Input ROBOTIS-OP3’s user name : robotis
    5. Input ROBOTIS-OP3’s password : 111111  

    ![](/assets/images/platform/op3/op3_connection_ssh.png)
 - VNC
    1. Execute VNC client program (ex: Ultra VNC Viewer)
    2. Input ROBOTIS-OP3’s IP address : 10.42.0.1
    3. Input ROBOTIS-OP3’s password : 111111
    4. Accessing ROBOTIS-OP3 via remote desktop may result in slower performance.

    ![](/assets/images/platform/op3/op3_connection_vnc.png)
    
## [How to kill the demo program](#how-to-kill-the-demo-program)

### Kill demo program
In order to terminate automatically executed demo program, enter below command in the terminal window.  
```
$ sudo service OP3-demo stop
```

### Running demo on startup
This chapter describes settings for automatically executing demo on startup.  
Autorun feature requires robot_upstart package from ROS.  
> Reference : [robot_upstart]

#### Start demo program on start  
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


#### Stop demo program on start
Open a new terminal window and execute following commands.   
```
$ rosrun robot_upstart uninstall JOB_NAME
```

## [How to restart the demo program](#how-to-restart-the-demo-program)

### When to restart the demo
- When camera has lost its connection due to electrical or mechanical issue.  
- When USB2Dynamixel has lost its connection due to electrical or mechanical issue.  
- When resetting Dynamixel with Reset button due to Dynamixel error.  


### How to restart the demo  
In order to restart autorun demo, execute following command in the terminal window.  
_(password : 111111)_  

```
$ sudo service OP3-demo restart
```



[robot_upstart]: http://wiki.ros.org/robot_upstart
