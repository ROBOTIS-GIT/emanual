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

## [Step. 1 (No Obstacle)](#step-1-no-obstacle)
- (Coming soon!)

## [Step. 2 (Static Obstacle)](#step-2-static-obstacle)
- (Coming soon!)

## [Step. 3 (Moving Obstacle)](#step-3-moving-obstacle)
- (Coming soon!)

## [Step. 4 (Combination Obstacle)](#step-4-combination-obstacle)
- (Coming soon!)
