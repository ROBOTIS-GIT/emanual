
When SLAM in Gazebo simulator, you can select or create various environments and robot models in virtual world. Other than preparing simulation environment instead of bringing up the robot, SLAM Simulation is pretty similar to that of [SLAM][slam] with the actual TurtleBot3.  

The following instructions require prerequisites from the previous sections, so please review to the [Simulation][simulation] section first.

### Launch SLAM Simulation 

If you are running ROS1 Noetic, please replace `melodic` with `noetic` in the command below.  

Please use the proper keyword among `burger`, `waffle`, `waffle_pi` for the `TURTLEBOT3_MODEL` parameter.  

```
> c:\opt\ros\melodic\x64\setup.bat
> c:\ws\turtlebot3\devel\setup.bat
> set TURTLEBOT3_MODEL=waffle

> curl -o turtlebot3_demo.launch https://raw.githubusercontent.com/ms-iot/ROSOnWindows/master/docs/Turtlebot/turtlebot3_demo.launch
> roslaunch turtlebot3_demo.launch
```

After a few moments, you will see Gazebo running a simulated world with your simulated TurtleBot3, RViz running the mapping progress, and a simulation node to drive the TurtleBot3 random walking.

![](https://ms-iot.github.io/ROSOnWindows/Extras/Turtlebot3_Gazebo_SLAM.gif)
