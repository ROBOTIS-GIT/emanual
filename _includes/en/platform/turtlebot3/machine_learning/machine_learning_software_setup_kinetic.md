
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
