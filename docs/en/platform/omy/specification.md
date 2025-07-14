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

## [[Follower] Layout](#follower-layout)

![](/assets/images/platform/omy/omy_follower_layout.png)

- `Download` [PDF](https://www.robotis.com/service/download.php?no=2208), [DWG](https://www.robotis.com/service/download.php?no=2207), [STEP](https://www.robotis.com/service/download.php?no=2209)

## [[Follower] Workspace](#follower-workspace)

![](/assets/images/platform/omy/omy_follower_workspace.png)

- `Download` [PDF](https://www.robotis.com/service/download.php?no=2213)

## [[Follower] Inertia](#follower-inertia)

### Joint 1

![](/assets/images/platform/omy/omy_follower_joint1.png)

- Volume [mm<sup>3</sup>] : 5.4693773e+05 
- Surface Area [mm<sup>2</sup>] : 4.2183171e+05 
- Average Density [gram / mm<sup>3</sup>] : 3.7753533e-03 
- Mass [gram] : 2.0648832e+03 
- Center of Gravity [mm]
  - X : -1.1063615e-01
  - Y : -5.4711270e+00 
  - Z : -1.5897733e+01
- Inertia Tensor with respect to C1 coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  3.6169019e+06  3.9294009e+03 -2.9605259e+02
  - Iyx Iyy Iyz :  3.9294009e+03  3.2495719e+06 -2.5094206e+02
  - Izx Izy Izz : -2.9605259e+02 -2.5094206e+02  2.3444915e+06
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  3.0332190e+06  5.1792838e+03  3.3357961e+03
  - Iyx Iyy Iyz :  5.1792838e+03  2.7276724e+06  1.7934953e+05
  - Izx Izy Izz :  3.3357961e+03  1.7934953e+05  2.2826576e+06

### Joint 2

![](/assets/images/platform/omy/omy_follower_joint2.png)

- Volume [mm<sup>3</sup>] : 1.0121887e+06 
- Surface Area [mm<sup>2</sup>] : 7.9478493e+05
- Average Density [gram / mm<sup>3</sup>] : 3.6352307e-03
- Mass [gram] : 3.6795395e+03
- Center of Gravity [mm]
  - X : 1.1405379e-02
  - Y : 1.6184244e+01 
  - Z : 1.0360634e+02
- Inertia Tensor with respect to C1 coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  9.2192879e+07  1.7166852e+03  5.3545961e+04
  - Iyx Iyy Iyz :  1.7166852e+03  8.9850582e+07 -6.6080728e+06
  - Izx Izy Izz :  5.3545961e+04 -6.6080728e+06  5.4652173e+06
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  5.1731918e+07  2.3958819e+03  5.7893960e+04
  - Iyx Iyy Iyz :  2.3958819e+03  5.0353401e+07 -4.3825716e+05
  - Izx Izy Izz :  5.7893960e+04 -4.3825716e+05  4.5014360e+06

### Joint 3

![](/assets/images/platform/omy/omy_follower_joint3.png)

- Volume [mm<sup>3</sup>] : 7.4781397e+05
- Surface Area [mm<sup>2</sup>] : 4.6677064e+05
- Average Density [gram / mm<sup>3</sup>] : 3.1914242e-03 
- Mass [gram] : 2.3865916e+03 
- Center of Gravity [mm]
  - X : 7.8148689e-02
  - Y : 1.0718481e+02
  - Z : 1.4117267e+02
- Inertia Tensor with respect to C1 coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  9.7677063e+07 -2.0932356e+04 -4.4881731e+04
  - Iyx Iyy Iyz : -2.0932356e+04  6.9484210e+07 -3.5921073e+07
  - Izx Izy Izz : -4.4881731e+04 -3.5921073e+07  3.0194727e+07
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  2.2694399e+07 -9.4142428e+02 -1.8551757e+04
  - Iyx Iyy Iyz : -9.4142428e+02  2.1920087e+07  1.9179387e+05
  - Izx Izy Izz : -1.8551757e+04  1.9179387e+05  2.7761559e+06

### Joint 4

![](/assets/images/platform/omy/omy_follower_joint4.png)

- Volume [mm<sup>3</sup>] : 3.8584923e+05 
- Surface Area [mm<sup>2</sup>] : 3.3453626e+05 
- Average Density [gram / mm<sup>3</sup>] : 3.6289686e-03 
- Mass [gram] : 1.4002347e+03 
- Center of Gravity [mm]
  - X : -1.3318256e-01 
  - Y : -1.0746667e+02
  - Z : 1.9090688e+01
- Inertia Tensor with respect to C1 coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  1.8436318e+07 -2.4627457e+04  1.7842481e+03
  - Iyx Iyy Iyz : -2.4627457e+04  2.0755613e+06  3.0261384e+06
  - Izx Izy Izz :  1.7842481e+03  3.0261384e+06  1.7387437e+07
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  1.7545679e+06 -4.5863379e+03 -1.7759142e+03
  - Iyx Iyy Iyz : -4.5863379e+03  1.5652147e+06  1.5339913e+05
  - Izx Izy Izz : -1.7759142e+03  1.5339913e+05  1.2159839e+06

### Joint 5

![](/assets/images/platform/omy/omy_follower_joint5.png)

- Volume [mm<sup>3</sup>] : 3.8584923e+05 
- Surface Area [mm<sup>2</sup>] : 3.3453626e+05
- Average Density [gram / mm<sup>3</sup>] : 3.6289686e-03 
- Mass [gram] : 1.4002347e+03 
- Center of Gravity [mm]
  - X :  1.3318256e-01
  - Y : -1.9090688e+01
  - Z :  1.0996667e+02
- Inertia Tensor with respect to C1 coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  1.9197463e+07  1.7842481e+03 -2.5093675e+04
  - Iyx Iyy Iyz :  1.7842481e+03  1.8148582e+07  3.0929670e+06
  - Izx Izy Izz : -2.5093675e+04  3.0929670e+06  2.0755613e+06
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  1.7545679e+06 -1.7759143e+03 -4.5863376e+03
  - Iyx Iyy Iyz : -1.7759143e+03  1.2159839e+06  1.5339913e+05
  - Izx Izy Izz : -4.5863376e+03  1.5339913e+05  1.5652147e+06

### Joint 6

![](/assets/images/platform/omy/omy_follower_joint6.png)

- Volume [mm<sup>3</sup>] : 1.3218403e+05 
- Surface Area [mm<sup>2</sup>] : 7.4349772e+04 
- Average Density [gram / mm<sup>3</sup>] : 3.0272548e-03 
- Mass [gram] : 4.0015475e+02
- Center of Gravity [mm]
  - X :  1.1080146e-02
  - Y : -8.0594056e+01
  - Z :  9.3029337e+00
- Inertia Tensor with respect to C1 coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  3.2012099e+06  5.5806913e+02 -1.2757818e+03
  - Iyx Iyy Iyz :  5.5806913e+02  6.6429834e+05  2.4370168e+05
  - Izx Izy Izz : -1.2757818e+03  2.4370168e+05  2.7980711e+06
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  5.6741276e+05  2.0073339e+02 -1.2345347e+03
  - Iyx Iyy Iyz :  2.0073339e+02  6.2966706e+05 -5.6318805e+04
  - Izx Izy Izz : -1.2345347e+03 -5.6318805e+04  1.9890515e+05

## [[Follower] Base Unit](#follower-base-unit)

### Back Panel

![](/assets/images/platform/omy/omy_follower_base_unit.png)

### Pin Assignment

![](/assets/images/platform/omy/omy_follower_base_panel.png)

## [[Follower] End Unit](#follower-end-unit)

![](/assets/images/platform/omy/omy_follower_end_unit.png)

### Pin Assignment

![](/assets/images/platform/omy/omy_follower_end_panel.png)

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

## [[Leader] Layout](#leader-layout)

![](/assets/images/platform/omy/omy_leader_layout.png)

- `Download` [PDF](https://www.robotis.com/service/download.php?no=2211), [DWG](https://www.robotis.com/service/download.php?no=2210), [STEP](https://www.robotis.com/service/download.php?no=2212)

## [[Leader] Inertia](#leader-inertia)

### Joint 1

![](/assets/images/platform/omy/omy_leader_joint1.png)

- Volume [mm<sup>3</sup>] : 9.5973690e+04
- Surface Area [mm<sup>2</sup>] : 2.5170342e+04 
- Average Density [gram / mm<sup>3</sup>] : 2.0622965e-03
- Mass [gram] : 1.9792620e+02 
- Center of Gravity [mm]
  - X : -1.5094777e+01
  - Y : -2.9152531e+00
  - Z : -5.8029327e-01
- Inertia Tensor with respect to C1 coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  6.4113991e+04 -8.9435794e+03 -1.3920652e+03
  - Iyx Iyy Iyz : -8.9435794e+03  1.3950688e+05  0.0000000e+00
  - Izx Izy Izz : -1.3920652e+03  0.0000000e+00  1.3016962e+05
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  6.2365226e+04 -2.3381798e+02  3.4164910e+02
  - Iyx Iyy Iyz : -2.3381798e+02  9.4342296e+04  3.3483623e+02
  - Izx Izy Izz :  3.4164910e+02  3.3483623e+02  8.3389570e+04

### Joint 2

![](/assets/images/platform/omy/omy_leader_joint2.png)

- Volume [mm<sup>3</sup>] : 2.2205845e+05
- Surface Area [mm<sup>2</sup>] : 9.1886481e+04
- Average Density [gram / mm<sup>3</sup>] : 2.2312703e-03
- Mass [gram] : 4.9547242e+02
- Center of Gravity [mm]
  - X : -6.6509235e-02 
  - Y :  2.2442703e+00
  - Z :  1.3349620e+02
- Inertia Tensor with respect to C1 coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  1.5230595e+07  0.0000000e+00  4.3795721e+03
  - Iyx Iyy Iyz :  0.0000000e+00  1.5166301e+07 -1.4835620e+05
  - Izx Izy Izz :  4.3795721e+03 -1.4835620e+05  1.4950970e+05
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  6.3981681e+06 -7.3954672e+01 -1.9593893e+01
  - Iyx Iyy Iyz : -7.3954672e+01  6.3363675e+06  8.8108892e+01
  - Izx Izy Izz : -1.9593893e+01  8.8108892e+01  1.4701194e+05

### Joint 3

![](/assets/images/platform/omy/omy_leader_joint3.png)

- Volume [mm<sup>3</sup>] : 5.0288334e+04
- Surface Area [mm<sup>2</sup>] : 4.6160100e+04 
- Average Density [gram / mm<sup>3</sup>] : 1.9618890e-03 
- Mass [gram] : 9.8660130e+01
- Center of Gravity [mm]
  - X : -1.7428771e-01
  - Y :  4.9723865e+01
  - Z :  1.2400449e+02
- Inertia Tensor with respect to C1 coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  2.4071507e+06  8.7775916e+02  3.1148177e+03
  - Iyx Iyy Iyz :  8.7775916e+02  2.1598213e+06 -6.1856126e+05
  - Izx Izy Izz :  3.1148177e+03 -6.1856126e+05  2.5685165e+05
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  6.4610911e+05  2.2744961e+01  9.8252974e+02
  - Iyx Iyy Iyz :  2.2744961e+01  6.4271022e+05 -1.0224619e+04
  - Izx Izy Izz :  9.8252974e+02 -1.0224619e+04  1.2915160e+04

### Joint 4

![](/assets/images/platform/omy/omy_leader_joint4.png)

- Volume [mm<sup>3</sup>] : 1.7190589e+04
- Surface Area [mm<sup>2</sup>] : 1.2425496e+04
- Average Density [gram / mm<sup>3</sup>] : 1.5524308e-03
- Mass [gram] : 2.6687200e+01 
- Center of Gravity [mm]
  - X :  2.6921263e-02
  - Y : -3.5455461e+01
  - Z :  7.5765923e-01
- Inertia Tensor with respect to C1 coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  3.8507544e+04  2.2553057e+01  7.9952527e-01
  - Iyx Iyy Iyz :  2.2553057e+01  2.2720426e+03  8.6573139e+02
  - Izx Izy Izz :  7.9952527e-01  8.6573139e+02  3.8026579e+04
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  4.9440199e+03 -2.9200298e+00  1.3438679e+00
  - Iyx Iyy Iyz : -2.9200298e+00  2.2567035e+03  1.4882894e+02
  - Izx Izy Izz :  1.3438679e+00  1.4882894e+02  4.4783555e+03

### Joint 5

![](/assets/images/platform/omy/omy_leader_joint5.png)

- Volume [mm<sup>3</sup>] : 1.7190589e+04 
- Surface Area [mm<sup>2</sup>] : 1.2425496e+04
- Average Density [gram / mm<sup>3</sup>] : 1.5524308e-03 
- Mass [gram] : 2.6687200e+01
- Center of Gravity [mm]
  - X : -2.6921263e-02
  - Y : -7.5765923e-01
  - Z :  3.3955461e+01
- Inertia Tensor with respect to C1 coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  3.5728969e+04  7.9952527e-01  2.1475377e+01
  - Iyx Iyy Iyz :  7.9952527e-01  3.5248004e+04  8.3540169e+02
  - Izx Izy Izz :  2.1475377e+01  8.3540169e+02  2.2720426e+03
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  4.9440199e+03  1.3438679e+00 -2.9200298e+00
  - Iyx Iyy Iyz :  1.3438679e+00  4.4783555e+03  1.4882894e+02
  - Izx Izy Izz : -2.9200298e+00  1.4882894e+02  2.2567035e+03

### Joint 6

![](/assets/images/platform/omy/omy_leader_joint6.png)

- Volume [mm<sup>3</sup>] : 9.4664842e+04 
- Surface Area [mm<sup>2</sup>] : 4.7828529e+04
- Average Density [gram / mm<sup>3</sup>] : 1.1527721e-03
- Mass [gram] : 1.0912699e+02 
- Center of Gravity [mm]
  - X :  3.7567212e+00 
  - Y : -7.7299588e+01
  - Z : -3.2079617e+01
- Inertia Tensor with respect to C1 coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  1.0100129e+06  5.1256685e+04  6.7434085e+03
  - Iyx Iyy Iyz :  5.1256685e+04  2.3965441e+05 -2.7229780e+05
  - Izx Izy Izz :  6.7434085e+03 -2.7229780e+05  7.9953292e+05
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  2.4565166e+05  1.9566971e+04 -6.4079407e+03
  - Iyx Iyy Iyz :  1.9566971e+04  1.2581152e+05 -1.6911154e+03
  - Izx Izy Izz : -6.4079407e+03 -1.6911154e+03  1.4593436e+05

### Joint 7

![](/assets/images/platform/omy/omy_leader_joint7.png)

- Volume [mm<sup>3</sup>] : 2.6850137e+03 
- Surface Area [mm<sup>2</sup>] : 2.3221225e+03
- Average Density [gram / mm<sup>3</sup>] : 1.5124377e-03
- Mass [gram] : 4.0609159e+00
- Center of Gravity [mm]
  - X : -2.6354677e-01
  - Y : -2.0547867e+00
  - Z : -8.7853268e+00
- Inertia Tensor with respect to C1 coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  1.0815097e+03  0.0000000e+00  0.0000000e+00
  - Iyx Iyy Iyz :  0.0000000e+00  8.6211234e+02 -1.7273536e+02
  - Izx Izy Izz :  0.0000000e+00 -1.7273536e+02  2.5705050e+02
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame: [gram * mm<sup>2</sup>]
  - Ixx Ixy Ixz :  7.5093441e+02  2.1991129e+00  9.4024163e+00
  - Iyx Iyy Iyz :  2.1991129e+00  5.4840080e+02 -9.9427818e+01
  - Izx Izy Izz :  9.4024163e+00 -9.9427818e+01  2.3962266e+02