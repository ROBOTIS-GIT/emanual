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

## [[Follower] Workspace](#follower-workspace)

## [[Follower] Layout](#follower-layout)

## [[Follower] Base Unit](#follower-base-unit)

## [[Follower] End Unit](#follower-end-unit)

## [[Leader] Hardware](#leader-hardware)

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