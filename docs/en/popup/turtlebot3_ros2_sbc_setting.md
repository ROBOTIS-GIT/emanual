---
layout: popup
---

## Dependencies
#### microRTPSAgent (include FastRTPS)
Please refer to [this link](https://micro-rtps.readthedocs.io/en/latest/installation.html) for detail install information.

- Install microRTPS(Agent & Client) on your SBC.
```bash
$ sudo apt update && sudo apt install build-essential cmake git
```
```bash
$ cd && git clone https://github.com/eProsima/Fast-RTPS
$ mkdir Fast-RTPS/build && cd Fast-RTPS/build
$ cmake -DTHIRDPARTY=ON ..
$ sudo make install
```
```bash
$ cd && git clone https://github.com/eProsima/micro-RTPS-agent.git
$ mkdir micro-RTPS-agent/build && cd micro-RTPS-agent/build
$ cmake -DTHIRDPARTY=ON -DCONFIG_UDP_TRANSPORT_MTU=4096 -DCONFIG_SERIAL_TRANSPORT_MTU=4096 ..
$ sudo make install
$ mkdir ~/turtlebot3
$ cp ./DEFAULT_FASTRTPS_PROFILES.xml ~/turtlebot3
$ sudo ldconfig /usr/local/lib/
```
```bash
$ cd && git clone https://github.com/eProsima/micro-RTPS-client.git
$ cd micro-RTPS-client
$ nano client.config       #change value parameter below
        CONFIG_UDP_TRANSPORT_MTU=4096
$ mkdir build && cd build
$ cmake -DTHIRDPARTY=ON ..
$ sudo make install
```

#### Install dependencies for OpenCR
- Install udev rules for OpenCR
```bash
$ sudo apt update && sudo apt install wget
$ cd /etc/udev/rules.d/
$ sudo wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/99-opencr-cdc.rules
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

#### Install dependencies for LDS
- Install udev rules for LDS
```bash
$ sudo apt update && sudo apt install wget
$ cd /etc/udev/rules.d/
$ sudo wget https://raw.githubusercontent.com/ROBOTIS-GIT/turtlebot3/master/turtlebot3_bringup/99-turtlebot3-cdc.rules
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```
- Install boost library
```bash
$ sudo apt install libboost-all-dev
```

- Install ntpdate
```bash
$ sudo apt install ntpdate
```

#### Build LIDAR Client
```bash
$ cd ~/micro-RTPS-client/build/examples
$ wget https://github.com/ROBOTIS-GIT/turtlebot3/tree/ros2/turtlebot3_lidar/turtlebot3_lidar.tar.xz
$ tar -xf turtlebot3_lidar.tar.xz
$ cd ..
$ cmake -DTHIRDPARTY=ON -DEPROSIMA_BUILD_EXAMPLES=ON ..
$ sudo make install
$ cp ./examples/turtlebot3_lidar/turtlebot3_lidar ~/turtlebot3
```