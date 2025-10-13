---
layout: archive
lang: en
ref: single_motor_tutorial_step4
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/dynamixel_api/single_motor_tutorial_step4/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-api-tutorials-step4">Step 4: OMX Teleoperation Example</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

![](/assets/images/sw/sdk/dynamixel_sdk/api/omx_teleoperation1.gif)
- This tutorial shows you example that OMX teleoperates Dynamixel using the Dynamixel API.
- With an OMX leader and follower, you can create your own teleoperation system in just a few lines of code.

**NOTE**: It assumes that you have already installed and built the SDK.
{:.notice--warning}

# [Make cpp file](#make-cpp-file)
- Open a code editor and create a new C++ source file. In this example, we use visual studio code.
```bash
$ code dxl_tutorial_4.cpp
```

# [Source Code Description](#source-code-description)

```cpp
#include "dynamixel_sdk/dynamixel_api.hpp"

int main(){
  dynamixel::Connector connector_leader("/dev/ttyACM1", 2.0, 1000000);
  dynamixel::Connector connector_follower("/dev/ttyACM0", 2.0, 1000000);

  std::unique_ptr<dynamixel::Motor> leader_motor1 = connector_leader.createMotor(1);
  std::unique_ptr<dynamixel::Motor> leader_motor2 = connector_leader.createMotor(2);
  std::unique_ptr<dynamixel::Motor> leader_motor3 = connector_leader.createMotor(3);
  std::unique_ptr<dynamixel::Motor> leader_motor4 = connector_leader.createMotor(4);
  std::unique_ptr<dynamixel::Motor> leader_motor5 = connector_leader.createMotor(5);
  std::unique_ptr<dynamixel::Motor> leader_motor_gripper = connector_leader.createMotor(6);

  std::unique_ptr<dynamixel::Motor> follower_motor1 = connector_follower.createMotor(11);
  std::unique_ptr<dynamixel::Motor> follower_motor2 = connector_follower.createMotor(12);
  std::unique_ptr<dynamixel::Motor> follower_motor3 = connector_follower.createMotor(13);
  std::unique_ptr<dynamixel::Motor> follower_motor4 = connector_follower.createMotor(14);
  std::unique_ptr<dynamixel::Motor> follower_motor5 = connector_follower.createMotor(15);
  std::unique_ptr<dynamixel::Motor> follower_motor_gripper = connector_follower.createMotor(16);

  follower_motor1->enableTorque();
  follower_motor2->enableTorque();
  follower_motor3->enableTorque();
  follower_motor4->enableTorque();
  follower_motor5->enableTorque();
  follower_motor_gripper->enableTorque();

  while (true) {
    int present_position1 = leader_motor1->getPresentPosition().value();
    int present_position2 = leader_motor2->getPresentPosition().value();
    int present_position3 = leader_motor3->getPresentPosition().value();
    int present_position4 = leader_motor4->getPresentPosition().value();
    int present_position5 = leader_motor5->getPresentPosition().value();
    int present_position_gripper = leader_motor_gripper->getPresentPosition().value();

    follower_motor1->setGoalPosition(present_position1);
    follower_motor2->setGoalPosition(present_position2);
    follower_motor3->setGoalPosition(present_position3);
    follower_motor4->setGoalPosition(present_position4);
    follower_motor5->setGoalPosition(present_position5);
    follower_motor_gripper->setGoalPosition(present_position_gripper);
  }
}
```

## [Add Header Files](#add-header-files)
- Add `dynamixel_sdk/dynamixel_api.hpp` to the top of your CPP file. This class is included in the Dynamixel SDK package.
```cpp
  #include "dynamixel_sdk/dynamixel_api.hpp"
```

## [Create Connector and Motor Object](#create-connector-and-motor-object)
- Create a `Connector` object.
- In OMX, two separate OpenRB adapters are used for the leader and follower motors, so create two `Connector` objects with different port names.
```cpp
  int main(){
    dynamixel::Connector connector_leader("/dev/ttyACM1", 2.0, 1000000);
    dynamixel::Connector connector_follower("/dev/ttyACM0", 2.0, 1000000);
```
- Create a `Motor` objects for each Dynamixels, using the `createMotor` method of the `Connector` class.
- In OMX, the leader motors have IDs 1 to 6, and the follower motors have IDs 11 to 16.
```cpp
    std::unique_ptr<dynamixel::Motor> leader_motor1 = connector_leader.createMotor(1);
    std::unique_ptr<dynamixel::Motor> leader_motor2 = connector_leader.createMotor(2);
    std::unique_ptr<dynamixel::Motor> leader_motor3 = connector_leader.createMotor(3);
    std::unique_ptr<dynamixel::Motor> leader_motor4 = connector_leader.createMotor(4);
    std::unique_ptr<dynamixel::Motor> leader_motor5 = connector_leader.createMotor(5);
    std::unique_ptr<dynamixel::Motor> leader_motor_gripper = connector_leader.createMotor(6);

    std::unique_ptr<dynamixel::Motor> follower_motor1 = connector_follower.createMotor(11);
    std::unique_ptr<dynamixel::Motor> follower_motor2 = connector_follower.createMotor(12);
    std::unique_ptr<dynamixel::Motor> follower_motor3 = connector_follower.createMotor(13);
    std::unique_ptr<dynamixel::Motor> follower_motor4 = connector_follower.createMotor(14);
    std::unique_ptr<dynamixel::Motor> follower_motor5 = connector_follower.createMotor(15);
    std::unique_ptr<dynamixel::Motor> follower_motor_gripper = connector_follower.createMotor(16);
```

## [Enable Follower Torque](#enable-follower-torque)
- Enable the torque of the follower motors for teleoperation.
```cpp
    follower_motor1->enableTorque();
    follower_motor2->enableTorque();
    follower_motor3->enableTorque();
    follower_motor4->enableTorque();
    follower_motor5->enableTorque();
    follower_motor_gripper->enableTorque();
```

## [Leader and Follower Control Loop](#leader-and-follower-control-loop)
- In a loop, read the present position of the leader motors using the `getPresentPosition` method and set the goal position of the follower motors to the same value using the `setGoalPosition` method.
```cpp
    while (true) {
      int present_position1 = leader_motor1->getPresentPosition().value();
      int present_position2 = leader_motor2->getPresentPosition().value();
      int present_position3 = leader_motor3->getPresentPosition().value();
      int present_position4 = leader_motor4->getPresentPosition().value();
      int present_position5 = leader_motor5->getPresentPosition().value();
      int present_position_gripper = leader_motor_gripper->getPresentPosition().value();

      follower_motor1->setGoalPosition(present_position1);
      follower_motor2->setGoalPosition(present_position2);
      follower_motor3->setGoalPosition(present_position3);
      follower_motor4->setGoalPosition(present_position4);
      follower_motor5->setGoalPosition(present_position5);
      follower_motor_gripper->setGoalPosition(present_position_gripper);
    }
  }
```

# [Error Handling](#error-handling)
- To ensure your code is robust, every method that sends a command to the motor returns a **Result** object that encapsulates values and errors.
- This object lets you safely check for any communication or device errors before proceeding.
- You can check for communication errors and device(dynamixel) errors using the **Result** object.
- If you use `value()` when error occurred without checking for errors, it may throw an exception.

  **Example**
  ``` cpp
    auto result_int32 = leader_motor->getPresentPosition();
    if (!result_int32.isSuccess()) {
      std::cerr << dynamixel::getErrorMessage(result_int32.error()) << std::endl;
      return 1;
    }
    int present_position = result_int32.value();
  ```

# [Compile and Run](#compile-and-run)
- You can compile and run the code using the following commands
```bash
$ g++ dxl_tutorial_4.cpp -o dxl_tutorial_4 -l dxl_x64_cpp
$ ./dxl_tutorial_4
```
<div class="notice--warning">
  ![](/assets/images/sw/sdk/dynamixel_sdk/api/omx_init_pose.jpg)
  - Before running the program, please set the robot to the initial pose as shown in the picture above.
  - This example demonstrates a simple teleoperation system.
  - You can refer to this example to build your own system.
  - All motor settings use the default values of the OMX product.
</div>
