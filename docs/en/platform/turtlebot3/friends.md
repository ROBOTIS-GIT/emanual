---
layout: archive
lang: en
ref: turtlebot3_friends
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/friends/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 15">
</div>

# [Friends](#friends)

In the video, watch how TurtleBot3 can be assembled and reassembled with a few additional parts. The waffle plate which is the biggest part among TurtleBot3 components can be assembled in various sizes and shapes, thanks to its diverse holes for bolts and nuts.

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/o9d7NVC0A1Y" frameborder="0" allowfullscreen></iframe>
</figure>

With this openended component, handful of TurtleBot3 friends with various characteristics could be built. You can create a totally new robot that is never seen before.

TurtleBot3 Friends List:

- [TurtleBot3 Friends: Car](#turtlebot3-friends-car)
- [TurtleBot3 Friends: OpenManipulator Chain](#turtlebot3-friends-openmanipulator-chain)
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

![](/assets/images/platform/turtlebot3/friends/All_friends.jpg)

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/gI0T4-aqTpI" frameborder="0" allowfullscreen></iframe>
</figure>

Get source codes and make friends! Go to <kbd>Examples</kbd> → <kbd>turtlebot3</kbd> → <kbd>turtlebot3_friends</kbd>.

![](/assets/images/platform/turtlebot3/friends/ide.png)

**Note :** Any suggestions and ideas for TurtleBot3 Friends Project are always welcomed. Tell us about your creative TurtleBot3 Friends. We can introduce your friend to the world through this wiki page! :)
{: .notice--info}

E-Mail : ost@robotis.com


## [TurtleBot3 Friends: Car](#turtlebot3-friends-car)


* Type: RC Car
* Features: About 1:2 gear ratio, differential gears want to make Car be in the Formula E!
* Components: Two Dynamixel X 430 Series (One for steering, one for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, OLLO plastic frames.
* Hardware: Due to the complex hardware configuration, it will be released as a later improved version. :)
* Software: <kbd>Examples</kbd> → <kbd>turtlebot3</kbd> → <kbd>turtlebot3_friends</kbd> → <kbd>turtlebot3_car</kbd>
* Video:


<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/IkPexspUgKk" frameborder="0" allowfullscreen></iframe>
</figure>


<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/1V33iEu4ylw" frameborder="0" allowfullscreen></iframe>
</figure>


## [TurtleBot3 Friends: OpenManipulator Chain](#turtlebot3-friends-openmanipulator-chain)

![](assets/images/platform/turtlebot3/friends/friends_open_manipulator_waffle.png)

* Type: Manipulator 4 DOF + 1 Gripper
* Features: Compatible with TurtleBot3 Waffle and it has linear gripper for pick and place.
* Components: Four Dynamixel X 430 Series (Four for joints, one for gripper), an OpenCR1.0 Board, 3D printed chassis.
* BOM: Please refer to the [OpenManipulator Wiki][openmanipulator-wiki]
* Hardware: https://goo.gl/xgxh2G (TB3 Waffle + OpenManipulator Chain)
* Hardware: https://goo.gl/Wv3KON (OpenManipulator Chain)
* Software: https://github.com/ROBOTIS-GIT/open_manipulator (We are preparing for OpenCR Example)
* Video:

[openmanipulator-wiki]: https://github.com/ROBOTIS-GIT/open_manipulator/wiki/OpenManipulator-Chain

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" allowfullscreen></iframe>
</figure>


<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/qbht0ssv8M0" frameborder="0" allowfullscreen></iframe>
</figure>


## [TurtleBot3 Friends: Segway](#turtlebot3-friends-segway)

![](assets/images/platform/turtlebot3/friends/friends_segway.png)

* Type: Segway robot
* Features: Balancing with only two DYNAMIXEL by applying PID controller.
* Components: Two Dynamixel X 430 Series (All for balancing), an OpenCR1.0 Board, TurtleBot3 Chassis and Battery, 3D printed chassis.
* BOM: https://goo.gl/XPgJkZ
* Hardware: https://goo.gl/rbmqLB
* Software: <kbd>Examples</kbd> → <kbd>turtlebot3</kbd> → <kbd>turtlebot3_friends</kbd> → <kbd>turtlebot3_segway</kbd>
* Video:

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/VAY-0xBOE2g" frameborder="0" allowfullscreen></iframe>
</figure>


## [TurtleBot3 Friends: Conveyor](#turtlebot3-friends-conveyor)

![](assets/images/platform/turtlebot3/friends/friends_conveyor.png)

* Type: 4 Wheel parallel translation vehicle
* Features: 4 Joints and 4 wheels will become a futuristic technology on transportation society by overcoming fuel-consuming mechanics.
* Components: Eight Dynamixel X 430 Series (Four for steering, four for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
* BOM: https://goo.gl/XPgJkZ
* Hardware: https://goo.gl/HSSqp7
* Software: <kbd>Examples</kbd> → <kbd>turtlebot3</kbd> → <kbd>turtlebot3_friends</kbd> → <kbd>turtlebot3_conveyor</kbd>
* Video:

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/uv2faO7GhXc" frameborder="0" allowfullscreen></iframe>
</figure>

## [TurtleBot3 Friends: Monster](#turtlebot3-friends-monster)

![](assets/images/platform/turtlebot3/friends/friends_monster.png)

* Type: 4WD Car
* Features: 4 Big wheels let it be strong in the rough terrain or even a big difference of elevation.
* Components: Four Dynamixel X 430 Series (All for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
* BOM: https://goo.gl/XPgJkZ
* Hardware: https://goo.gl/oW8UXY
* Software: <kbd>Examples</kbd> → <kbd>turtlebot3</kbd> → <kbd>turtlebot3_friends</kbd> → <kbd>turtlebot3_monster</kbd>
* Video:

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/UqdwGLH1-cA" frameborder="0" allowfullscreen></iframe>
</figure>


## [TurtleBot3 Friends: Tank](#turtlebot3-friends-tank)


![](assets/images/platform/turtlebot3/friends/friends_tank.png)

* Type: Caterpillar
* Features: Caterpillar units which are connected and assembled on sprocket wheels make it be strong in the rough terrain.
* Components: Two Dynamixel X 430 Series (All for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, Caterpillar Unit, 3D printed chassis.
* BOM: https://goo.gl/XPgJkZ
* Hardware: https://goo.gl/M722Ff
* Software: <kbd>Examples</kbd> → <kbd>turtlebot3</kbd> → <kbd>turtlebot3_friends</kbd> → <kbd>turtlebot3_tank</kbd>
* Video:

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/vndnwpVEpVE" frameborder="0" allowfullscreen></iframe>
</figure>

## [TurtleBot3 Friends: Omni](#turtlebot3-friends-omni)


![](assets/images/platform/turtlebot3/friends/friends_omni.png)

* Type: Omni wheel
* Features: Omni wheels have additional discs around the circumference make it laterally driveable.
* Components: Three Dynamixel X 430 Series (All for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
* BOM: https://goo.gl/XPgJkZ
* Hardware: https://goo.gl/2LBJik
* Software: <kbd>Examples</kbd> → <kbd>turtlebot3</kbd> → <kbd>turtlebot3_friends</kbd> → <kbd>turtlebot3_omni</kbd>
* Video:

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/r8wRACM_ZbE" frameborder="0" allowfullscreen></iframe>
</figure>

## [TurtleBot3 Friends: Mecanum](#turtlebot3-friends-mecanum)


![](assets/images/platform/turtlebot3/friends/friends_mecanum.png)

* Type: Mecanum wheel
* Features: Mecanum wheels have additional discs around the circumference make it laterally driveable.
* Components: Four Dynamixel X 430 Series (All for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
* BOM: https://goo.gl/XPgJkZ
* Hardware: https://goo.gl/3aTdg9
* Software: <kbd>Examples</kbd> → <kbd>turtlebot3</kbd> → <kbd>turtlebot3_friends</kbd> → <kbd>turtlebot3_mechanum</kbd>
* Video: See in the video [TurtleBot3 Friends: Omni](#turtlebot3-friends-omni) above.

## [TurtleBot3 Friends: Bike](#turtlebot3-friends-bike)


![](assets/images/platform/turtlebot3/friends/friends_bike.png)

* Type: 3-DOF Motorcycle
* Features: Cute 3-wheeled bikey reveals its existence on the "Car" film as a brother of the "Car".
* Components: Three Dynamixel X 430 Series (One for steering, two for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
* BOM: https://goo.gl/XPgJkZ
* Hardware: https://goo.gl/JMntH1
* Software: <kbd>Examples</kbd> → <kbd>turtlebot3</kbd> → <kbd>turtlebot3_friends</kbd> → <kbd>turtlebot3_bike</kbd>
* Video: See in the videos [TurtleBot3 Friends: Car](#turtlebot3-friends-car) and [TurtleBot3 Friends: monster](#turtlebot3-friends-monster) above.

## [TurtleBot3 Friends: Road Train](#turtlebot3-friends-road-train)


![](assets/images/platform/turtlebot3/friends/friends_road_train.png)

* Type: Road train
* Features: Road train can connect vehicles and it can serve various things! 
* Components: Two Dynamixel XM-430 Series (two for driving), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
* BOM: https://goo.gl/XPgJkZ
* Hardware: https://goo.gl/fsH5L2
* Software: <kbd>Examples</kbd> → <kbd>turtlebot3</kbd> → <kbd>turtlebot3_friends</kbd> → <kbd>turtlebot3_road_train</kbd>
* Video:

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/uhkq1w4YoEE" frameborder="0" allowfullscreen></iframe>
</figure>

## [TurtleBot3 Friends: Real TurtleBot](#turtlebot3-friends-real-turtlebot)


![](assets/images/platform/turtlebot3/friends/friends_real.png)

* Type: 8-DOF legged robot (a.k.a. Real TurtleBot)
* Features: A real TurtleBot will make most of the fanpics in the turtlebot society!.
* Components: Ten Dynamixel X 430 Series (Four for leg joint, another four for shoulder joint, two for head), an OpenCR1.0 Board, a RC100 Remote Controller with BT410 master-slave Bluetooth modules, TurtleBot3 Chassis and Battery, 3D printed chassis.
* BOM: https://goo.gl/XPgJkZ
* Hardware: https://goo.gl/wtcHxE
* Software: <kbd>Examples</kbd> → <kbd>turtlebot3</kbd> → <kbd>turtlebot3_friends</kbd> → <kbd>turtlebot3_realturtlebot</kbd>
* Video:

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/KNWkAe0ob9g" frameborder="0" allowfullscreen></iframe>
</figure>


<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/vort-z9HDlU" frameborder="0" allowfullscreen></iframe>
</figure>

## [TurtleBot3 Friends: Carrier](#turtlebot3-friends-carrier)

![](assets/images/platform/turtlebot3/friends/friends_carrier.png)

* Type: 2 Wheel mobile based platform as service robot
* Features: 2 wheeled mobile platform will serve whatever you wants.
* Components: A TurtleBot3 Waffle, 6 supports for 4th layer, another 6 supports for 5th layer construction, extra Waffle Plates in each layers, customized 3D printed wheel and ball caster.
* BOM: https://goo.gl/XPgJkZ
* Hardware: https://goo.gl/bXzBTJ
* Software: <kbd>Examples<kbd> → <kbd>turtlebot3<kbd> → <kbd>turtlebot3_waffle<kbd> → <kbd>turtlebot3_waffle<kbd>
* Video:

<figure class="video_container">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/5NYdgnzxykc" frameborder="0" allowfullscreen></iframe>
</figure>

<figure class="video_container">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/u7qb8xiSiNg" frameborder="0" allowfullscreen></iframe>
</figure>
