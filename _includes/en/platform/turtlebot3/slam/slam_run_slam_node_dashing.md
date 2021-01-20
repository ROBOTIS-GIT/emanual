
1. If the `Bringup` is not running on the TurtleBot3 SBC, launch the Bringup first. **Skip this step if you have launched bringup previously**.  
  - Open a new terminal from Remote PC with `Ctrl` + `Alt` + `T` and connect to Raspberry Pi with its IP address.
The default password is **ubuntu**.  
  ```bash
$ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_bringup robot.launch.py
  ```
2. Open a new terminal from Remote PC with `Ctrl` + `Alt` + `T` and launch the SLAM node. The Cartographer is used as a default SLAM method.
  ```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_cartographer cartographer.launch.py
  ```  
  ![](/assets/images/platform/turtlebot3/ros2/platform_cartographer.png)

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) **How to save the TURTLEBOT3_MODEL parameter?**
{: .notice--success}
</summary>
The `$ export TURTLEBOT3_MODEL=${TB3_MODEL}` command can be omitted if the **TURTLEBOT3_MODEL** parameter is predefined in the `.bashrc` file.  
The `.bashrc` file is automatically loaded when a terminal window is created.  

- Example of defining `TurtlBot3 Burger` as a default model.  
```bash
$ echo 'export TURTLEBOT3_MODEL=burger' >> ~/.bashrc
$ source ~/.bashrc
```

- Example of defining `TurtlBot3 Waffle Pi` as a default model.  
```bash
$ echo 'export TURTLEBOT3_MODEL=waffle_pi' >> ~/.bashrc
$ source ~/.bashrc
```
</details>
