
In this Machine Learning example, 24 Lidar samples are used, which should be modified as written in the [Set parameters](#set-parameters) section.

<iframe width="1280" height="720" src="https://www.youtube.com/embed/5uIZU8PCHT8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

### [Stage 1 (No Obstacle)](#stage-1-no-obstacle)

Stage 1 is a 4x4 map with no obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_1.jpg)

```bash
$ roslaunch turtlebot3_gazebo turtlebot3_stage_1.launch
```

Open another terminal and enter the command below.
```bash
$ roslaunch turtlebot3_dqn turtlebot3_dqn_stage_1.launch
```

If you want to see the visualized data, launch the graph.

```bash
$ roslaunch turtlebot3_dqn result_graph.launch
```

### [Stage 2 (Static Obstacle)](#stage-2-static-obstacle)

Stage 2 is a 4x4 map with four cylinders of static obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_2.jpg)

```bash
$ roslaunch turtlebot3_gazebo turtlebot3_stage_2.launch
```

Open another terminal and enter the command below.
```bash
$ roslaunch turtlebot3_dqn turtlebot3_dqn_stage_2.launch
```

If you want to see the visualized data, launch the graph.

```bash
$ roslaunch turtlebot3_dqn result_graph.launch
```

### [Stage 3 (Moving Obstacle)](#stage-3-moving-obstacle)

Stage 2 is a 4x4 map with four cylinders of moving obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_3.jpg)

```bash
$ roslaunch turtlebot3_gazebo turtlebot3_stage_3.launch
```

Open another terminal and enter the command below.
```bash
$ roslaunch turtlebot3_dqn turtlebot3_dqn_stage_3.launch
```

If you want to see the visualized data, launch the graph.

```bash
$ roslaunch turtlebot3_dqn result_graph.launch
```

### [Stage 4 (Combination Obstacle)](#stage-4-combination-obstacle)

Stage 4 is a 5x5 map with walls and two cylinders of moving obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_4.jpg)

```bash
$ roslaunch turtlebot3_gazebo turtlebot3_stage_4.launch
```

Open another terminal and enter the command below.
```bash
$ roslaunch turtlebot3_dqn turtlebot3_dqn_stage_4.launch
```

If you want to see the visualized data, launch the graph.

```bash
$ roslaunch turtlebot3_dqn result_graph.launch
```
