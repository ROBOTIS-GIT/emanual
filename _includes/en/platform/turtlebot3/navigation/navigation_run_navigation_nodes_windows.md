
1. If the `Bringup` is not running on the TurtleBot3, launch the Bringup. **Skip this step if you have launched bringup previously**.  
  ```bash
> roslaunch turtlebot3_bringup turtlebot3_robot.launch
  ```

2. Launch the Navigation.  
    Please use the proper keyword among `burger`, `waffle`, `waffle_pi` for the `TURTLEBOT3_MODEL` parameter.  
  ```bash
> set TURTLEBOT3_MODEL=burger
> roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=%USERPROFILE%\map.yaml
  ```
