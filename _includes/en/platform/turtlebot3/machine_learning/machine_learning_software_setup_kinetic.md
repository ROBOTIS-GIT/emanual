
To do this tutorial, you need to install Tensorflow, Keras and Anaconda with Ubuntu 16.04 and ROS1 Kinetic.

<iframe width="854" height="480" src="https://www.youtube.com/embed/s0qgunKt654" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

### [Anaconda](#anaconda)

You can download [Anaconda 5.2.0](https://repo.anaconda.com/archive/Anaconda2-5.2.0-Linux-x86_64.sh) for Python 2.7 version.

After downloading Andaconda, go to the directory where the downloaded file is located at and enter the follow command.

Review and accept the license terms by entering `yes` in the terminal.  
Also add the Anaconda2 install location to PATH in the .basrhc file.

```bash
$ bash Anaconda2-5.2.0-Linux-x86_64.sh
```

After installing Anaconda,

```bash
$ source ~/.bashrc
$ python -V
```

If Anaconda is installed successfuly, `Python 2.7.xx :: Anaconda, Inc.` will be returned in the terminal.

### [ROS dependency packages](#ros-dependency-packages)

Install required packages first.

```bash
$ pip install msgpack argparse
```

To use ROS and Anaconda together, you must additionally install ROS dependency packages.

```bash
$ pip install -U rosinstall empy defusedxml netifaces
```

### [Tensorflow](#tensorflow)

This tutorial uses python 2.7(CPU only). If you want to use another python version and GPU, please refer to [TensorFlow](https://www.tensorflow.org/install/).

```bash
$ pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.8.0-cp27-none-linux_x86_64.whl
```

### [Keras](#keras)

[Keras](https://keras.io/) is a high-level neural networks API, written in Python and capable of running on top of TensorFlow.

```bash
$ pip install keras==2.1.5
```

Incompatible error messages regarding the tensorboard can be ignored as it is not used in this example, but it can be resolved by installing tensorboard as below.
```bash
$ pip install tensorboard
```

### [Machine Learning packages](#machine-learning-packages)

**WARNING**: Please install [turtlebot3](https://github.com/ROBOTIS-GIT/turtlebot3), [turtlebot3_msgs](https://github.com/ROBOTIS-GIT/turtlebot3_msgs) and [turtlebot3_simulations](https://github.com/ROBOTIS-GIT/turtlebot3_simulations) package before installing this package.
{: .notice--warning}

```bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_machine_learning.git
$ cd ~/catkin_ws && catkin_make
```

Machine Learning is running on a Gazebo simulation world. If you haven't installed the TurtleBot3 simulation package, please install with the command below.

```bash
$ cd ~/catkin_ws/src/
$ git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
$ cd ~/catkin_ws && catkin_make
```

Completely uninstall and reinstall numpy to rectify problems. You may need to perform uninstall a few times until numpy is completely uninstalled.

```bash
$ pip uninstall numpy
$ pip show numpy
$ pip uninstall numpy
$ pip show numpy
```

At this point, numpy should be completed uninstalled and you should not see any numpy information when entering `pip show numpy`.  

Reinstall the numpy.
```bash
$ pip install numpy pyqtgraph
```
