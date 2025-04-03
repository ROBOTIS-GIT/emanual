
TurtleBot3 can be position controlled using this package.

**[Remote PC]**

1. Open a terminal on **Remote PC**.

2. Launch the pointop file.
  ``` bash
  $ ros2 run turtlebot3_example turtlebot3_position_control
  ```

3. Type input values and press enter for `x`, `y` and `theta` respectively. TurtleBot3 will move to a pose (`x`, `y`, `theta`) from the current pose.

    ``` bash
    TurtleBot3 Position Control
    ------------------------------------------------------
    From the current pose,
    x: goal position x (unit: m)
    y: goal position y (unit: m)
    theta: goal orientation (range: -180 ~ 180, unit: deg)
    ------------------------------------------------------

    Input x: 1  (input a value and press enter)
    Input y: 1  (input a value and press enter)
    Input theta: 10  (input a value and press enter)
    ```
