
This example uses action topic. The action client translates patrol data(radius) to action server. Then, the action server translates `cmd_vel` to TurtleBot3. 

**[Remote PC]**

1. Open a terminal on **Remote PC**.

2. Launch the patrol server file.
  ``` bash
  $ ros2 run turtlebot3_example turtlebot3_patrol_server
  ```
  
3. Launch the patrol client file.
  ``` bash
  $ ros2 run turtlebot3_example turtlebot3_patrol_client
  ```

4. Type a input value and press enter. TurtleBot3 will draw a circle of the typed radius.

    ``` bash
    TurtleBot3 Circle Patrol
    ------------------------------------------------------
    radius: circle radius (unit: m)
    ------------------------------------------------------

    Input radius: 1  (input a value and press enter)
    ```
