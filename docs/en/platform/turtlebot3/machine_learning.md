---
layout: archive
lang: en
ref: machine_learning
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/machine_learning/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 21
---

<div style="counter-reset: h1 8"></div>
<div style="counter-reset: h2 1"></div>

# [[ROS 1] Machine Learning](#ros-1-machine-learning)

Machine learning is a data analysis technique that teaches computers to recognize what is natural for people and animals - learning through experience. There are three types of machine learning: supervised learning, unsupervised learning, reinforcement learning.

This application is reinforcement learning with DQN (Deep Q-Learning). The reinforcement learning is concerned with how software agents ought to take actions in an environment so as to maximize some notion of cumulative reward.

<iframe width="854" height="480" src="https://www.youtube.com/embed/WADmP0wzLxs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning}

This shows reinforcement learning with TurtleBot3 in gazebo.
This reinforcement learning is applied DQN(Deep Q-Learning) algorithm with LDS.  
We are preparing a four-step reinforcement learning tutorial.

## [Installation](#installation)

To do this tutorial, you need to install Tensorflow, Keras and Anaconda with Ubuntu 16.04 and ROS kinetic.

<iframe width="854" height="480" src="https://www.youtube.com/embed/s0qgunKt654" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

### [Anaconda](#anaconda)

You can download [Anaconda 5.2](https://www.anaconda.com/download/#linux) for Python 2.7 version.

After downloading Andaconda, go to the directory in located download file and enter the follow command.

```bash
$ bash Anaconda2-x.x.x-Linux-x86_64.sh
```

After installing Anaconda,

```bash
$ source ~/.bashrc
$ python -V
```

If Anaconda is installed, you can see `Python 2.7.xx :: Anaconda, Inc.`.

### [ROS dependency packages](#ros-dependency-packages)

To use ROS and Anaconda together, you must additionally install ROS dependency packages.

```bash
$ pip install -U rosinstall msgpack empy defusedxml netifaces
```

### [Tensorflow](#tensorflow)

You can install [TensorFlow](https://www.tensorflow.org/install/).

```bash
$ conda create -n tensorflow pip python=2.7
```

This tutorial is used python 2.7(CPU only). If you want to use another python version and GPU, please refer to [TensorFlow](https://www.tensorflow.org/install/).

```bash
$ pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.8.0-cp27-none-linux_x86_64.whl
```

### [Keras](#keras)

[Keras](https://keras.io/) is a high-level neural networks API, written in Python and capable of running on top of TensorFlow.

```bash
$ pip install keras==2.1.5
```

### [Machine Learning packages](#machine-learning-packages)

**WARNING**: Please install [turtlebot3](https://github.com/ROBOTIS-GIT/turtlebot3), [turtlebot3_msgs](https://github.com/ROBOTIS-GIT/turtlebot3_msgs) and [turtlebot3_simulations](https://github.com/ROBOTIS-GIT/turtlebot3_simulations) package before installing this package.
{: .notice--warning}

```bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_machine_learning.git
$ cd ~/catkin_ws && catkin_make
```

## [Set parameters](#set-parameters)

The goal of DQN Agent is to get the TurtleBot3 to the goal avoiding obstacles. When TurtleBot3 gets closer to the goal, it gets a positive reward, and when it gets farther it gets a negative reward.
The episode ends when the TurtleBot3 crashes on an obstacle or after a certain period of time. During the episode, TurtleBot3 gets a big positive reward when it gets to the goal, and TurtleBot3 gets a big negative reward when it crashes on an obstacle.

<iframe width="1236" height="695" src="https://www.youtube.com/embed/807_cByUBSI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning}

### [Set state](#set-state)

State is an observation of environment and describes the current situation. Here, `state_size` is 26 and has 24 LDS values, distance to goal, and angle to goal.

Turtlebot3's LDS default is set to 360. You can modify sample of LDS at `turtlebot3/turtlebot3_description/urdf/turtlebot3_burger.gazebo.xacro`.

```bash
<xacro:arg name="laser_visual" default="false"/>   # Visualization of LDS. If you want to see LDS, set to `true`
```

```bash
<scan>
  <horizontal>
    <samples>360</samples>            # The number of sample. Modify it to 24
    <resolution>1</resolution>
    <min_angle>0.0</min_angle>
    <max_angle>6.28319</max_angle>
  </horizontal>
</scan>
```

| ![](/assets/images/platform/turtlebot3/machine_learning/sample_360.png) | ![](/assets/images/platform/turtlebot3/machine_learning/sample_24.png) |
| :---------------------------------------------------------------------: | :--------------------------------------------------------------------: |
|                            **sample = 360**                             |                            **sample = 24**                             |

### [Set action](#set-action)

Action is what an agent can do in each state. Here, turtlebot3 has always 0.15 m/s of linear velocity. angular velocity is determined by action.

| Action | Angular velocity(rad/s) |
| :----: | :---------------------: |
|   0    |          -1.5           |
|   1    |          -0.75          |
|   2    |            0            |
|   3    |          0.75           |
|   4    |           1.5           |

### [Set reward](#set-reward)

When turtlebot3 takes an action in a state, it receives a reward. The reward design is very important for learning. A reward can be positive or negative. When turtlebot3 gets to the goal, it gets big positive reward. When turtlebot3
collides with an obstacle, it gets big negative reward. If you want to apply your reward design, modify `setReward` function at `/turtlebot3_machine_learning/turtlebot3_dqn/src/turtlebot3_dqn/environment_stage_#.py`.

### [Set hyper parameters](#set-hyper-parameters)

This tutorial has been learned using DQN. DQN is a reinforcement learning method that selects a deep neural network by approximating the action-value function(Q-value). Agent has follow hyper parameters at `/turtlebot3_machine_learning/turtlebot3_dqn/nodes/turtlebot3_dqn_stage_#`.

| Hyper parameter | default |                                                      description                                                       |
| :-------------: | :-----: | :--------------------------------------------------------------------------------------------------------------------: |
|  episode_step   |  6000   |                                             The time step of one episode.                                              |
|  target_update  |  2000   |                                             Update rate of target network.                                             |
| discount_factor |  0.99   |                     Represents how much future events lose their value according to how far away.                      |
|  learning_rate  | 0.00025 | Learning speed. If the value is too large, learning does not work well, and if it is too small, learning time is long. |
|     epsilon     |   1.0   |                                      The probability of choosing a random action.                                      |
|  epsilon_decay  |  0.99   |                         Reduction rate of epsilon. When one episode ends, the epsilon reduce.                          |
|   epsilon_min   |  0.05   |                                                The minimum of epsilon.                                                 |
|   batch_size    |   64    |                                          Size of a group of training samples.                                          |
|   train_start   |   64    |                              Start training if the replay memory size is greater than 64.                              |
|     memory      | 1000000 |                                               The size of replay memory.                                               |

## [Run Machine Learning](#run-machine-learning)

<iframe width="1280" height="720" src="https://www.youtube.com/embed/5uIZU8PCHT8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

### [Stage 1 (No Obstacle)](#stage-1-no-obstacle)

Stage 1 is a 4x4 map with no obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_1.jpg)

```bash
$ roslaunch turtlebot3_gazebo turtlebot3_stage_1.launch
$ roslaunch turtlebot3_dqn turtlebot3_dqn_stage_1.launch
```

### [Stage 2 (Static Obstacle)](#stage-2-static-obstacle)

Stage 2 is a 4x4 map with four cylinders of static obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_2.jpg)

```bash
$ roslaunch turtlebot3_gazebo turtlebot3_stage_2.launch
$ roslaunch turtlebot3_dqn turtlebot3_dqn_stage_2.launch
```

### [Stage 3 (Moving Obstacle)](#stage-3-moving-obstacle)

Stage 2 is a 4x4 map with four cylinders of moving obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_3.jpg)

```bash
$ roslaunch turtlebot3_gazebo turtlebot3_stage_3.launch
$ roslaunch turtlebot3_dqn turtlebot3_dqn_stage_3.launch
```

### [Stage 4 (Combination Obstacle)](#stage-4-combination-obstacle)

Stage 4 is a 5x5 map with walls and two cylinders of moving obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_4.jpg)

```bash
$ roslaunch turtlebot3_gazebo turtlebot3_stage_4.launch
$ roslaunch turtlebot3_dqn turtlebot3_dqn_stage_4.launch
```

If you want to see graph, launch the graph launch file.

```bash
$ roslaunch turtlebot3_dqn result_graph.launch
```
