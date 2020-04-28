---
layout: archive
lang: en
ref: turtlebot3_deeplearning
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/deeplearning/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 13"></div>

# [Tensorflow](#Tensorflow)

Install tensorflow https://www.tensorflow.org/install. I recommand installing with Virtualenv for python3.

Activate the Virtualenv environment by issuing one of the following commands:

``` bash
$ source ~/tensorflow/bin/activate # bash, sh, ksh, or zsh
$ source ~/tensorflow/bin/activate.csh  # csh or tcsh
```

install pip3 packages.
``` bash
pip3 install Keras numpy pandas matplotlib Pillow gym h5py scikit-image
```

install rospkg with pycham.

[File] -> [settings] -> [Project:FILE.py] -> [Project Interpreter]. Change Project Interpreter to python3.5.

Install setuptools and rospkg.

## [TurtleBot3 Fake Node Implementation](#turtlebot3-fake-node-implementation)

**Tip :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
{: .notice--info}

Install dependent packages for TurtleBot3 Simulation.

**Note :** turtlebot3_simulation package requires [**TurtleBot3**](http://turtlebot3.robotis.com/en/latest/pc_software.html#install-dependent-packages) package as a prerequisite.
{: .notice--info}

``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
$ cd ~/catkin_ws && catkin_make
```
