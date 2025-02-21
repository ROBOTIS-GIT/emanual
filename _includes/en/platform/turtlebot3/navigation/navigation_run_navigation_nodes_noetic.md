
1. Run `roscore` on the remote PC. **Skip this step if roscore is already running**.  
**[Remote PC]**  
  ```bash
$ roscore
  ```

2. Run `Bringup` on the TurtleBot3 SBC. **Skip this step if bringup is already running**.  
  - Open a new terminal from Remote PC with `Ctrl` + `Alt` + `T` and connect to the Raspberry Pi with its IP address.
The default password is **turtlebot**, and you will be required to specify your TurtleBot3 model (`burger`, `waffle`, `waffle_pi`) using the `TURTLEBOT3_MODEL` parameter.  
**[Remote PC]**  
  ```bash
$ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
  ```

3. Launch Navigation.  
**[Remote PC]**  
  ```bash
$ roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=$HOME/map.yaml
  ```

<details>
<summary>
![](/assets/images/icon_unfold.png) **How to save the TURTLEBOT3_MODEL parameter?**
</summary>
The `$ export TURTLEBOT3_MODEL=${TB3_MODEL}` command can be omitted if the **TURTLEBOT3_MODEL** parameter is predefined in your `.bashrc` file.  
The `.bashrc` file is automatically loaded when a terminal window is created.  

- Example defining `TurtlBot3 Burger` as the default model.  
```bash
$ echo 'export TURTLEBOT3_MODEL=burger' >> ~/.bashrc
$ source ~/.bashrc
```

- Example defining `TurtlBot3 Waffle Pi` as the default model.  
```bash
$ echo 'export TURTLEBOT3_MODEL=waffle_pi' >> ~/.bashrc
$ source ~/.bashrc
```
</details>
