---
layout: archive
lang: en
ref: locomotion
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/locomotion/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 14"></div>

# [Locomotion](#locomotion)

In the video, watch how TurtleBot3 can be assembled and reassembled with a few additional parts. The waffle plate which is the biggest part among TurtleBot3 components can be assembled in various sizes and shapes, thanks to its diverse holes for bolts and nuts.

<iframe width="640" height="360" src="https://www.youtube.com/embed/o9d7NVC0A1Y" frameborder="0" allowfullscreen></iframe>

With this openended component, handful of TurtleBot3 friends with various characteristics could be built. You can create a totally new robot that is never seen before. Create a variety of robots based on open hardware and try out the new Locomotion.

- `TurtleBot3 Friends List`
- [TurtleBot3 Friends: Car](#turtlebot3-friends-car)
- [TurtleBot3 Friends: OpenManipulator](#turtlebot3-friends-openmanipulator)
- [TurtleBot3 Friends: Segway](#turtlebot3-friends-segway)
- [TurtleBot3 Friends: Conveyor](#turtlebot3-friends-conveyor)
- [TurtleBot3 Friends: Monster](#turtlebot3-friends-monster)
- [TurtleBot3 Friends: Tank](#turtlebot3-friends-tank)
- [TurtleBot3 Friends: Omni](#turtlebot3-friends-omni)
- [TurtleBot3 Friends: Mecanum](#turtlebot3-friends-mecanum)
- [TurtleBot3 Friends: Bike](#turtlebot3-friends-bike)
- [TurtleBot3 Friends: Road Train](#turtlebot3-friends-road-train)
- [TurtleBot3 Friends: Real TurtleBot](#turtlebot3-friends-real-turtlebot)
- [TurtleBot3 Friends: Carrier](#turtlebot3-friends-carrier)


- `Components List File`
- [BOM](https://goo.gl/XPgJkZ)

![](/assets/images/platform/turtlebot3/friends/All_friends.jpg)

<iframe width="640" height="360" src="https://www.youtube.com/embed/gI0T4-aqTpI" frameborder="0" allowfullscreen></iframe>

- Get source codes and make friends! Go to `Examples` → `turtlebot3` → `turtlebot3_friends` on Arduino IDE for OpenCR.

  ![](/assets/images/platform/turtlebot3/friends/ide.png)

  **NOTE**: Any suggestions and ideas for TurtleBot3 Friends Project are always welcomed. Tell us about your creative TurtleBot3 Friends. We can introduce your friend to the world through this wiki page! E-Mail: ost@robotis.com :)
  {: .notice--info}


## [TurtleBot3 Friends: Car](#turtlebot3-friends-car)

- **Type**: RC Car
- **Features**: About 1:2 gear ratio, differential gears want to make Car be in the Formula E!
- **Components**: Two Dynamixel X 430 Series (One for steering, one for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, OLLO plastic frames.
- **Hardware**: Due to the complex hardware configuration, it will be released as a later improved version. :)
- **Software**: `Examples` → `turtlebot3` → `turtlebot3_friends` → `turtlebot3_car`
- **Video**:

  <iframe width="640" height="360" src="https://www.youtube.com/embed/IkPexspUgKk" frameborder="0" allowfullscreen></iframe>

  <iframe width="640" height="360" src="https://www.youtube.com/embed/1V33iEu4ylw" frameborder="0" allowfullscreen></iframe>


## [TurtleBot3 Friends: OpenManipulator](#turtlebot3-friends-openmanipulator)

![](/assets/images/platform/turtlebot3/friends/friends_open_manipulator_waffle_pi.png)

- **Type**: Manipulator 4 DOF + 1 Gripper
- **Features**: Compatible with TurtleBot3 Waffle Pi and it has linear gripper for pick and place.
- **Components**: Four Dynamixel X 430 Series (Four for joints, one for gripper), an OpenCR1.0 Board, 3D printed chassis.
- **BOM**: Please refer to the [Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=490107710)
- **DIY Manual**: Please refer to the [link](https://docs.google.com/document/d/1c5U0v2dQhYiulqiWI0VQMameG82WCc-4rl6J6zlQejA/edit?usp=sharing)
- [Hardware](https://www.thingiverse.com/thing:3081010) (TurtleBot3 Waffle Pi + OpenManipulator)
- [Hardware](https://www.thingiverse.com/thing:3069574) (OpenManipulator)
- [Software](https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3) (We are preparing for OpenCR Example)
- [OpenManipulator Wiki](/docs/en/platform/openmanipulator/)
- **Video**:

  <iframe width="560" height="315" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" allowfullscreen></iframe>

  <iframe width="560" height="315" src="https://www.youtube.com/embed/qbht0ssv8M0" frameborder="0" allowfullscreen></iframe>

  <iframe width="560" height="315" src="https://www.youtube.com/embed/P82pZsqpBg0" frameborder="0" allowfullscreen></iframe>

  <iframe width="560" height="315" src="https://www.youtube.com/embed/DLOq8yNcCoE" frameborder="0" allowfullscreen></iframe>

## [TurtleBot3 Friends: Segway](#turtlebot3-friends-segway)

![](/assets/images/platform/turtlebot3/friends/friends_segway.png)

{% capture notice_01 %}
**NOTE**:
- Two Dynamixel X 430 Series are need to be set on PWM Mode.
- Filters library have to be downloaded and includes it arduino IDE. [Github Link](https://github.com/JonHub/Filters)
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

- **Type**: Segway robot
- **Features**: Balancing with only two DYNAMIXEL by applying PID controller.
- **Components**: Two Dynamixel X 430 Series (All for balancing), an OpenCR1.0 Board, TurtleBot3 Chassis and Battery, 3D printed chassis.
- [BOM](https://docs.google.com/spreadsheets/d/1IEmOjpqpl2eChhDlZxerMd0W6hTqfVNaQc6Pu_3WlpM/edit#gid=2116354)
- [Hardware](https://www.thingiverse.com/thing:3069806)
- **Software**: `Examples` → `turtlebot3` → `turtlebot3_friends` → `turtlebot3_segway`
- **Video**:

  <iframe width="640" height="360" src="https://www.youtube.com/embed/VAY-0xBOE2g" frameborder="0" allowfullscreen></iframe>


## [TurtleBot3 Friends: Conveyor](#turtlebot3-friends-conveyor)

![](/assets/images/platform/turtlebot3/friends/friends_conveyor.png)

- **Type**: 4 Wheel parallel translation vehicle
- **Features**: 4 Joints and 4 wheels will become a futuristic technology on transportation society by overcoming fuel-consuming mechanics.
- **Components**: Eight Dynamixel X 430 Series (Four for steering, four for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
- [BOM](https://docs.google.com/spreadsheets/d/1IEmOjpqpl2eChhDlZxerMd0W6hTqfVNaQc6Pu_3WlpM/edit#gid=598826169)
- [Hardware](https://www.thingiverse.com/thing:3069758)
- **Software**: `Examples` → `turtlebot3` → `turtlebot3_friends` → `turtlebot3_conveyor`
- **Video**:

  <iframe width="640" height="360" src="https://www.youtube.com/embed/uv2faO7GhXc" frameborder="0" allowfullscreen></iframe>


## [TurtleBot3 Friends: Monster](#turtlebot3-friends-monster)

![](/assets/images/platform/turtlebot3/friends/friends_monster.png)

- **Type**: 4WD Car
- **Features**: 4 Big wheels let it be strong in the rough terrain or even a big difference of elevation.
- **Components**: Four Dynamixel X 430 Series (All for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
- [BOM](https://docs.google.com/spreadsheets/d/1IEmOjpqpl2eChhDlZxerMd0W6hTqfVNaQc6Pu_3WlpM/edit#gid=667600885)
- [Hardware](https://www.thingiverse.com/thing:3069796)
- **Software**: `Examples` → `turtlebot3` → `turtlebot3_friends` → `turtlebot3_monster`
- **Video**:

  <iframe width="640" height="360" src="https://www.youtube.com/embed/UqdwGLH1-cA" frameborder="0" allowfullscreen></iframe>


## [TurtleBot3 Friends: Tank](#turtlebot3-friends-tank)

![](/assets/images/platform/turtlebot3/friends/friends_tank.png)

- **Type**: Caterpillar
- **Features**: Caterpillar units which are connected and assembled on sprocket wheels make it be strong in the rough terrain.
- **Components**: Two Dynamixel X 430 Series (All for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, Caterpillar Unit, 3D printed chassis.
- [BOM](https://docs.google.com/spreadsheets/d/1IEmOjpqpl2eChhDlZxerMd0W6hTqfVNaQc6Pu_3WlpM/edit#gid=2000352540)
- [Hardware](https://www.thingiverse.com/thing:3069755)
- **Software**: `Examples` → `turtlebot3` → `turtlebot3_friends` → `turtlebot3_tank`
- **Video**:

  <iframe width="640" height="360" src="https://www.youtube.com/embed/vndnwpVEpVE" frameborder="0" allowfullscreen></iframe>


## [TurtleBot3 Friends: Omni](#turtlebot3-friends-omni)

![](/assets/images/platform/turtlebot3/friends/friends_omni.png)

- **Type**: Omni wheel
- **Features**: Omni wheels have additional discs around the circumference make it laterally driveable.
- **Components**: Three Dynamixel X 430 Series (All for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
- [BOM](https://docs.google.com/spreadsheets/d/1IEmOjpqpl2eChhDlZxerMd0W6hTqfVNaQc6Pu_3WlpM/edit#gid=62380643)
- [Hardware](https://www.thingiverse.com/thing:3069809)
- **Software**: `Examples` → `turtlebot3` → `turtlebot3_friends` → `turtlebot3_omni`
- **Video**:

  <iframe width="640" height="360" src="https://www.youtube.com/embed/r8wRACM_ZbE" frameborder="0" allowfullscreen></iframe>


## [TurtleBot3 Friends: Mecanum](#turtlebot3-friends-mecanum)

![](/assets/images/platform/turtlebot3/friends/friends_mecanum.png)

- **Type**: Mecanum wheel
- **Features**: Mecanum wheels have additional discs around the circumference make it laterally driveable.
- **Components**: Four Dynamixel X 430 Series (All for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
- [BOM](https://docs.google.com/spreadsheets/d/1IEmOjpqpl2eChhDlZxerMd0W6hTqfVNaQc6Pu_3WlpM/edit#gid=1361078880)
- [Hardware](https://www.thingiverse.com/thing:3069811)
- **Software**: `Examples` → `turtlebot3` → `turtlebot3_friends` → `turtlebot3_mechanum`
- **Video**: See in the video [TurtleBot3 Friends: Omni](#turtlebot3-friends-omni) above.


## [TurtleBot3 Friends: Bike](#turtlebot3-friends-bike)

![](/assets/images/platform/turtlebot3/friends/friends_bike.png)

- **Type**: 3-DOF Motorcycle
- **Features**: Cute 3-wheeled bikey reveals its existence on the "Car" film as a brother of the "Car".
- **Components**: Three Dynamixel X 430 Series (One for steering, two for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
- [BOM](https://docs.google.com/spreadsheets/d/1IEmOjpqpl2eChhDlZxerMd0W6hTqfVNaQc6Pu_3WlpM/edit#gid=940977959)
- [Hardware](https://www.thingiverse.com/thing:3069817)
- **Software**: `Examples` → `turtlebot3` → `turtlebot3_friends` → `turtlebot3_bike`
- **Video**: See in the videos [TurtleBot3 Friends: Car](#turtlebot3-friends-car) and [TurtleBot3 Friends: monster](#turtlebot3-friends-monster) above.


## [TurtleBot3 Friends: Road Train](#turtlebot3-friends-road-train)

![](/assets/images/platform/turtlebot3/friends/friends_road_train.png)

- **Type**: Road train
- **Features**: Road train can connect vehicles and it can serve various things!
- **Components**: Two Dynamixel X 430 Series (two for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
- [BOM](https://docs.google.com/spreadsheets/d/1IEmOjpqpl2eChhDlZxerMd0W6hTqfVNaQc6Pu_3WlpM/edit#gid=1816123527)
- [Hardware](https://www.thingiverse.com/thing:3069804)
- **Software**: `Examples` → `turtlebot3` → `turtlebot3_friends` → `turtlebot3_road_train`
- **Video**:

  <iframe width="640" height="360" src="https://www.youtube.com/embed/uhkq1w4YoEE" frameborder="0" allowfullscreen></iframe>


## [TurtleBot3 Friends: Real TurtleBot](#turtlebot3-friends-real-turtlebot)

![](/assets/images/platform/turtlebot3/friends/friends_real.png)

- **Type**: 8-DOF legged robot (a.k.a. Real TurtleBot)
- **Features**: A real TurtleBot will make most of the fanpics in the turtlebot society!.
- **Components**: Ten Dynamixel X 430 Series (Four for leg joint, another four for shoulder joint, two for head), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
- [BOM](https://docs.google.com/spreadsheets/d/1IEmOjpqpl2eChhDlZxerMd0W6hTqfVNaQc6Pu_3WlpM/edit#gid=2088315005)
- [Hardware](https://www.thingiverse.com/thing:3069748)
- **Software**: `Examples` → `turtlebot3` → `turtlebot3_friends` → `turtlebot3_realturtlebot`
- **Video**:

  <iframe width="640" height="360" src="https://www.youtube.com/embed/KNWkAe0ob9g" frameborder="0" allowfullscreen></iframe>

  <iframe width="640" height="360" src="https://www.youtube.com/embed/vort-z9HDlU" frameborder="0" allowfullscreen></iframe>

## [TurtleBot3 Friends: Carrier](#turtlebot3-friends-carrier)

![](/assets/images/platform/turtlebot3/friends/friends_carrier.png)

- **Type**: 2 Wheel mobile based platform as service robot
- **Features**: 2 wheeled mobile platform will serve whatever you wants.
- **Components**: A TurtleBot3 Waffle, 6 supports for 4th layer, another 6 supports for 5th layer construction, extra Waffle Plates in each layers, customized 3D printed wheel and ball caster.
- [BOM](https://docs.google.com/spreadsheets/d/1IEmOjpqpl2eChhDlZxerMd0W6hTqfVNaQc6Pu_3WlpM/edit#gid=490107710)
- [Hardware](https://www.thingiverse.com/thing:3069815)
- **Software**: `Examples` → `turtlebot3` → `turtlebot3_waffle` → `turtlebot3_waffle`
- **Video**:

  <iframe width="560" height="315" src="https://www.youtube.com/embed/5NYdgnzxykc" frameborder="0" allowfullscreen></iframe>

  <iframe width="560" height="315" src="https://www.youtube.com/embed/u7qb8xiSiNg" frameborder="0" allowfullscreen></iframe>
