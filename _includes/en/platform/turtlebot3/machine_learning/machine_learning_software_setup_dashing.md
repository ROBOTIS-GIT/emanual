<!-- ## [Software Setup](#software-setup) -->

Install Tensorflow and Keras on PC (Requirement: Ubuntu 18.04 and ROS2 Dashing)

### [ROS dependency packages](#ros-dependency-packages)

1. Open a terminal.
2. Install ROS dependency packages for Python 3.6 version.
``` bash
$ pip3 install -U rosinstall msgpack empy defusedxml netifaces
```

### [Tensorflow](#tensorflow)

This instruction describes how to install TensorFlow in terminal.  
1. Open a terminal.
2. Install TensorFlow.
``` bash
$ pip3 install -U tensorflow
```
In the tutorial, python 3.6(CPU only) is used. To use different python version and GPU, refer to [TensorFlow](https://www.tensorflow.org/install/) installation page.
``` bash
$ pip3 install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.8.0-cp27-none-linux_x86_64.whl
```

### [Keras](#keras)
[Keras](https://keras.io/) is a high-level neural networks API, written in Python and capable of running on top of TensorFlow.
1. Open a terminal
2. Install Keras.
``` bash
$ pip3 install keras==2.1.5
```

### [Machine Learning packages](#machine-learning-packages)
**WARNING**: Be sure to install [turtlebot3](https://github.com/ROBOTIS-GIT/turtlebot3), [turtlebot3_msgs](https://github.com/ROBOTIS-GIT/turtlebot3_msgs) and [turtlebot3_simulations](https://github.com/ROBOTIS-GIT/turtlebot3_simulations) package before installation of machine learning packages.
{: .notice--warning}

1. Open a terminal.
2. Install turtlebot3_machine_learning packages. 
``` bash
$ cd ~/robotis_ws/src/
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/turtlebot3_machine_learning.git
$ cd ~/robotis_ws && colcon build --symlink-install
```
