---
layout: archive
lang: en
ref: op3_getting_started
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/getting_started/
tabs: "Revision"
tab_title1: "2025 ~"
tab_title2: "~ 2023"
sidebar:
  title: ROBOTIS OP3
  nav: "op3"
product_group: op3
page_number: 3
---

<style>body {counter-reset: h1 2 !important;}</style>

{::options parse_block_html="true" /}

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

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

    ![](/assets/images/platform/op3/op3_connection_ssh2.png)

 - VNC  
   
   **CAUTION** : The robot must be booted with a physical monitor connected for VNC connection to work.
   {: .notice--warning}

    1. Execute VNC client program (ex: Ultra VNC Viewer)
    2. Input ROBOTIS-OP3’s IP address : 10.42.0.1
    3. Input ROBOTIS-OP3’s password : 111111
    4. Accessing ROBOTIS-OP3 via remote desktop may result in slower performance.

    ![](/assets/images/platform/op3/op3_025_rev3.png)
    
## [How to stop the demo program](#how-to-stop-the-demo-program)

### Stop the demo program
In order to terminate automatically executed demo program, enter below command in the terminal window.  
```bash
$ sudo systemctl stop op3_demo.service
```

### Running the demo at startup
This chapter explains how to set up the system to automatically run a demo at startup.  

#### Automatically run the demo program at startup  
1. Create the systemd service file  
   Create a new systemd service file at `/etc/systemd/system/op3_demo.service` using a text editor:  
   ```bash
   $ sudo nano /etc/systemd/system/op3_demo.service
   ```

   Copy and paste the following content into the file:
   ```ini
   [Unit]
   Description=Starts the op3_demo launch file
   After=network.target systemd-user-sessions.service

   [Service]
   Type=simple
   User=robotis
   Group=robotis
   WorkingDirectory=/home/robotis/robotis_ws
   ExecStartPre=/bin/sleep 3
   ExecStart=/bin/bash -ic 'ros2 launch op3_demo demo.launch.xml'
   Restart=always
   RestartSec=1
   KillMode=control-group
   LimitRTPRIO=99
   LimitNICE=-20

   [Install]
   WantedBy=multi-user.target
   ```
   Save and exit (`Ctrl + X`, then `Y` and `Enter`).

2. Reload systemd daemon  
   After creating the service file, reload the systemd daemon to recognize the new service:
    ```bash
    $ sudo systemctl daemon-reload
    ```
    
3. Enable the service at boot  
   Enable the service so that it starts automatically when the system boots:
   ```bash
   $  sudo systemctl enable op3_demo
   ```

#### Disable automatic startup of the demo program
1. Disable the service   
   This prevents the service from starting automatically at boot:
   ```bash
   $ sudo systemctl disable op3_demo 
   ```
2. Stop the running service (if active)  
   If the service is currently running, stop it with:
   ```bash
   $ sudo systemctl stop op3_demo 
   ```
3. Remove the service file (optional)  
   If you no longer need the service, you can delete the service file:
   ```bash
   $ sudo rm /etc/systemd/system/op3_demo.service 
   ```
   Then, reload the systemd daemon to apply the changes:
   ```bash
   $ sudo systemctl daemon-reload
   ```

## [How to restart the demo program](#how-to-restart-the-demo-program)

### When to restart the demo
- When camera has lost its connection due to electrical or mechanical issue.  
- When USB2DYNAMIXEL has lost its connection due to electrical or mechanical issue.  
- When resetting DYNAMIXEL with Reset button due to DYNAMIXEL error.  


### How to restart the demo  
In order to restart autorun demo, execute following command in the terminal window.  
_(password : 111111)_  

```bash
$ sudo systemctl restart op3_demo
```



[robot_upstart]: http://wiki.ros.org/robot_upstart
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/op3/getting_started_rev2.md %}
</section>
