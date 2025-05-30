---
layout: archive
lang: en
ref: omy_specification
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/omy/specification/
sidebar:
  title: "OMY"
  nav: "omy"
product_group: omy
page_number: 2
---

<style>body {counter-reset: h1 1 !important;}</style>

# [Specification](#specification)

## [[Follower] Hardware](#follower-hardware)

![](/assets/images/platform/omy/omy_f3m.png)

| Item | OMY-F3M |
|:---:|:---:|
| DOF | 6 |
| Payload | 3 [kg] |
| Reach | 580 [mm] |
| Weight | 13.5 [kg] |
| Operating Voltage | 24 [VDC] |
| Joint Resolution | -π(rad) ~ π(rad), -262,144 ~ 262,144[pulse/rev] |
| Joint Range | Joint 1, 2 : ±360°<br>Joint 3 : ±150°<br>Joint 4, 5, 6 : ±360° |
| DYNAMIXEL-Y Specification | Joint 1,2 : YM080-230-A099-RH<br>Joint 3,4,5,6 : YM070-210-A099-RH |
| Repeatability | ±0.05 [mm] |
| Brake Force | 200% of the continuous torque for each joint |
| TCP Speed | < 900 [mm/s] |
| Host Interface | Ethernet |
| Internal Communications | RS485 |
| Communication Baudrate | 4 [Mbps] |
| Robot Hand | RH-P12-RN |
| Camera | Intel RealSense D405 |

## [[Follower] Dimension](#follower-dimension)

< Picture : OMY-F3M dimension >

## [[Follower] Workspace](#follower-workspace)

![](/assets/images/platform/omy/omy_workspace.png)

## [[Follower] D-H Configuration](#follower-d-h-configuration)

< Picture : OMY-F3M d-h configuration>

< Table : OMY-F3M d-h parameter >

## [[Follower] Inertia](#follower-inertia)

### Link 1

< Picture : OMY-F3M Link 1 >

- Mass [gram] : 1.9536110e+03
- Center of Gravity [mm]
  - X : 0.0000000e+00
  - Y : -5.6914372e-01
  - Z : 2.6565513e+01
- Inertia Tensor with respect to C1 coordinate frame: [GRAM * MM^2]
  - Ixx Ixy Ixz :  3.3673385e+06  3.8517468e+03 -1.0672291e+03
  - Iyx Iyy Iyz :  3.8517468e+03  3.0875305e+06 -1.1544309e+03
  - Izx Izy Izz : -1.0672291e+03 -1.1544309e+03  2.0888250e+06
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [GRAM * MM^2]
  - Ixx Ixy Ixz : 2.6573794e+06  5.1094132e+03  3.1007520e+03
  - Iyx Iyy Iyz : 5.1094132e+03  2.4367919e+06  1.9519447e+05
  - Izx Izy Izz : 3.1007520e+03  1.9519447e+05  2.0295510e+06
- Principal Moments of Inertia: [GRAM * MM^2]
  - I1 : 1.7606162e+04
  - I2 : 2.9573501e+04
  - I3 : 3.3802078e+04

### Link 2

< Picture : OMY-F3M Link 2 >

### Link 3

< Picture : OMY-F3M Link 3 >

### Link 4

< Picture : OMY-F3M Link 4 >

### Link 5

< Picture : OMY-F3M Link 5 >

### Link 6

< Picture : OMY-F3M Link 6 >

## [[Follower] Base Unit](#follower-base-unit)

### Back Panel

![](/assets/images/platform/omy/omy_base_unit.png)

### Pin Assignment

![](/assets/images/platform/omy/omy_base_panel.png)

## [[Follower] End Unit](#follower-end-unit)

< Picture : OMY-F3M End Unit >

## [[Leader] Hardware](#leader-hardware)

![](/assets/images/platform/omy/omy_l100.png)

| Item | OMY-L100 |
|:---:|:---:|
| DOF | 7 |
| Reach | 560 [mm] |
| Weight | 1.46 [kg] |
| Operating Voltage | 12 [VDC] |
| Joint Resolution | -π(rad) ~ π(rad), -2,048 ~ 2,048 [pulse/rev] |
| Joint Range | Joint 1 : ±180°<br>Joint 2 : -70° ~ +100°<br>Joint 3, 4, 5, 6 : ±180°<br>Joint 7 : -90° ~ +60° |
| DYNAMIXEL-Y Specification | Joint 1,23 : XH540-W150<br>Joint 4,5,6 : XC330-T288<br>Joint 7 : XC330-T181 |
| Host Interface | U2D2 (USB 2.0) |
| Internal Communications | TTL Multidrop Bus |
| Communication Baudrate | 4 [Mbps] |

## [[Leader] Dimension](#leader-dimension)

< Picture : OMY-L100 dimension >

## [[Leader] Inertia](#leader-inertia)

< Picture : OMY-L100 inertia >

### Link 1

< Picture : OMY-L100 Link 1 >

### Link 2

< Picture : OMY-L100 Link 2 >

### Link 3

< Picture : OMY-L100 Link 3 >

### Link 4

< Picture : OMY-L100 Link 4 >

### Link 5

< Picture : OMY-L100 Link 5 >

### Link 6

< Picture : OMY-L100 Link 6 >
