
1. If `roscore` is not running on the Remote PC, run roscore. **Skip this step if roscore is already running**.
  ```bash
$ roscore
  ```

2. If the `Bringup` is not running on the TurtleBot3 SBC, launch the Bringup. **Skip this step if you have launched bringup previously**.  
  - Open a new terminal from Remote PC with `Ctrl` + `Alt` + `T` and connect to Raspberry Pi with its IP address.
The default password is **turtlebot**.  
  ```bash
$ ssh pi@{IP_ADDRESS_OF_RASPBERRY_PI}
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
  ```

3. Launch the Navigation.  
  Please use the proper keyword among `burger`, `waffle`, `waffle_pi` for the `TURTLEBOT3_MODEL` parameter.  
  ```bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=$HOME/map.yaml
  ```

<details>
<summary>
![](/assets/images/icon_unfold.png) **How to save the TURTLEBOT3_MODEL parameter?**
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
