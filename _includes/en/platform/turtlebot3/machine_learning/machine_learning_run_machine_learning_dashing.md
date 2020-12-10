
<iframe width="1280" height="720" src="https://www.youtube.com/embed/5uIZU8PCHT8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning} 

### [Stage 1 (No Obstacle)](#stage-1-no-obstacle)
Stage 1 is a 4x4 map with no obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_1.jpg)

1. Open a terminal.
2. Bring the stage 1 in Gazebo map.
``` bash
$ ros2 launch turtlebot3_gazebo turtlebot3_dqn_stage1.launch.py
$ ros2 run turtlebot3_dqn dqn_gazebo 1
$ ros2 run turtlebot3_dqn dqn_environment
$ ros2 run turtlebot3_dqn dqn_agent 1
```

- If you want to test your trained model, use the following command.
``` bash
$ ros2 run turtlebot3_dqn dqn_test 1
```

### [Stage 2 (Static Obstacle)](#stage-2-static-obstacle)

Stage 2 is a 4x4 map with four cylinders of static obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_2.jpg)

1. Open a terminal.
2. Bring the stage 2 in Gazebo map.
``` bash
$ ros2 launch turtlebot3_gazebo turtlebot3_dqn_stage2.launch.py
$ ros2 run turtlebot3_dqn dqn_gazebo 2
$ ros2 run turtlebot3_dqn dqn_environment
$ ros2 run turtlebot3_dqn dqn_agent 2
```

- If you want to test your trained model, use the following command.
``` bash
$ ros2 run turtlebot3_dqn dqn_test 2
```

### [Stage 3 (Moving Obstacle)](#stage-3-moving-obstacle)
Stage 3 is a 4x4 map with four cylinders of moving obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_3.jpg)

1. Open a terminal.
2. Bring the stage 3 in Gazebo map.
``` bash
$ ros2 launch turtlebot3_gazebo turtlebot3_dqn_stage3.launch.py
$ ros2 run turtlebot3_dqn dqn_gazebo 3
$ ros2 run turtlebot3_dqn dqn_environment
$ ros2 run turtlebot3_dqn dqn_agent 3
```

- If you want to test your trained model, use the following command.
``` bash
$ ros2 run turtlebot3_dqn dqn_test 3
```

### [Stage 4 (Combination Obstacle)](#stage-4-combination-obstacle)
Stage 4 is a 5x5 map with walls and two cylinders of moving obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_4.jpg)

1. Open a terminal.
2. Bring the stage 4 in Gazebo map.
``` bash
$ ros2 launch turtlebot3_gazebo turtlebot3_dqn_stage4.launch.py
$ ros2 run turtlebot3_dqn dqn_gazebo 4
$ ros2 run turtlebot3_dqn dqn_environment
$ ros2 run turtlebot3_dqn dqn_agent 4
```

- If you want to test your trained model, use the following command.
``` bash
$ ros2 run turtlebot3_dqn dqn_test 4
```
