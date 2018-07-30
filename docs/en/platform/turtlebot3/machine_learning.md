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
---

<div style="counter-reset: h1 13"></div>

# [Machine Learning](#machine-learning)
Machine learning is a data analysis technique that teaches computers to recognize what is natural for people and animals - learning through experience. There are three types of machine learning: supervised learning, unsupervised learning, reinforcement learning.

This application is reinforcement learning with DQN (Deep Q-Learning). The reinforcement learning is concerned with how software agents ought to take actions in an environment so as to maximize some notion of cumulative reward.

<iframe width="854" height="480" src="https://www.youtube.com/embed/WADmP0wzLxs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

This shows reinforcement learning with TurtleBot3 in gazebo.
This reinforcement learning is applied DQN(Deep Q-Learning) algorithm with LDS.  
We are preparing a four-step reinforcement learning tutorial.

## [Installation](#installation)
To do this tutorial, you need to install Tensorflow, Keras and Anaconda with Ubuntu 16.04 and ROS kinetic.

<iframe width="854" height="480" src="https://www.youtube.com/embed/s0qgunKt654" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

### [Anaconda](#anaconda)
You can download [Anaconda 5.2](https://www.anaconda.com/download/#linux) for Python 2.7 version.

After downloading Andaconda, go to the directory in located download file and enter the follow command.

``` bash
$ bash Anaconda2-x.x.x-Linux-x86_64.sh
```

After installing Anaconda,
``` bash
$ source ~/.bashrc
$ python -V
```
If Anaconda is installed, you can see `Python 2.7.xx :: Anaconda, Inc.`.

### [ROS dependency packages](#ros-dependency-packages)
To use ROS and Anaconda together, you must additionally install ROS dependency packages.
``` bash
$ pip install -U rosinstall msgpack empy defusedxml netifaces
$ conda install --channel https://conda.anaconda.org/conda-forge pyqt
$ conda install -c anaconda pyqt=4.11.4
$ pip install pyqtgraph
$ sudo apt-get install python-qt4
```

### [Tensorflow](#tensorflow)
You can install [TensorFlow](https://www.tensorflow.org/install/).  
``` bash
$ conda create -n tensorflow pip python=2.7
```
This tutorial is used python 2.7(CPU only). If you want to use another python version and GPU, please refer to [TensorFlow](https://www.tensorflow.org/install/).
``` bash
$ pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.8.0-cp27-none-linux_x86_64.whl
```

### [Keras](#keras)
[Keras](https://keras.io/) is a high-level neural networks API, written in Python and capable of running on top of TensorFlow.

``` bash
$ pip install keras
```

### [Machine Learning packages](#machine-learning-packages)
**WARNING**: Please install [turtlebot3](https://github.com/ROBOTIS-GIT/turtlebot3), [turtlebot3_msgs](https://github.com/ROBOTIS-GIT/turtlebot3_msgs) and [turtlebot3_simulations](https://github.com/ROBOTIS-GIT/turtlebot3_simulations) package before installing this package.
{: .notice--warning}

``` bash
$ cd ~/catkin_ws/src/
$ git clone -b develop https://github.com/ROBOTIS-GIT/turtlebot3_machine_learning.git
$ cd ~/catkin_ws && catkin_make
```

## [Run Machine Learning](#run-machine-learning)
The goal of DQN Agent is to get the TurtleBot3 to the gaol avoiding obstacles. When TurtleBot3 gets closer to the goal, it gets a positive reward, and when it gets farther it gets a negative reward.
The episode ends when the TurtleBot3 crashes on an obstacle or after a certain period of time. During the episode, TurtleBot3 gets a big  positive reward when it gets to the goal, and TurtleBot3 gets a big negative reward when it crashes on an obstacle.

<iframe width="1236" height="695" src="https://www.youtube.com/embed/807_cByUBSI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

### [Stage 1 (No Obstacle)](#stage-1-no-obstacle)
Stage 1 is a 4x4 map with no obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_1.jpg)
``` bash
$ roslaunch turtlebot3_gazebo turtlebot3_stage_1.launch
$ roslaunch turtlebot3_dqn turtlebot3_dqn_stage_1.launch
```
### [Stage 2 (Static Obstacle)](#stage-2-static-obstacle)
Stage 2 is a 4x4 map with four cylinders of static obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_2.jpg)
``` bash
$ roslaunch turtlebot3_gazebo turtlebot3_stage_2.launch
$ roslaunch turtlebot3_dqn turtlebot3_dqn_stage_2.launch
```
### [Stage 3 (Moving Obstacle)](#stage-3-moving-obstacle)
Stage 2 is a 4x4 map with four cylinders of moving obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_3.jpg)
``` bash
$ roslaunch turtlebot3_gazebo turtlebot3_stage_3.launch
$ roslaunch turtlebot3_dqn turtlebot3_dqn_stage_3.launch
```
### [Stage 4 (Combination Obstacle)](#stage-4-combination-obstacle)
Stage 4 is a 5x5 map with walls and two cylinders of moving obstacles.

![](/assets/images/platform/turtlebot3/machine_learning/stage_4.jpg)
``` bash
$ roslaunch turtlebot3_gazebo turtlebot3_stage_4.launch
$ roslaunch turtlebot3_dqn turtlebot3_dqn_stage_4.launch
```

If you want to see graph, launch the graph launch file.

``` bash
$ roslaunch turtlebot3_dqn result_graph.launch
```

## [Set parameters](#set-parameters)
- coming soon
