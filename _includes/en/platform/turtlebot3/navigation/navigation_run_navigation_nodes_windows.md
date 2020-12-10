
1. If `roscore` is not running, run roscore. **Skip this step if roscore is already running**.
  ```bash
> roscore
  ```

2. If the `Bringup` is not running on the TurtleBot3 SBC, launch the Bringup. **Skip this step if you have launched bringup previously**.  
  ```bash
> roslaunch turtlebot3_bringup turtlebot3_robot.launch
  ```

3. Launch the Navigation. Depending on the platform, replace **${TB3_MODEL}** in the below command with `burger`, `waffle` or `waffle_pi`.
  ```bash
> set TURTLEBOT3_MODEL=${TB3_MODEL}
> roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=%USERPROFILE%\map.yaml
  ```
