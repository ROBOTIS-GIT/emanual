---
layout: archive
lang: en
ref: group_motor_tutorial_step7
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/dynamixel_api/group_motor_tutorial_step7/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-api-tutorials-step7">Step 7: OMX Position Control Example</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

![](/assets/images/sw/sdk/dynamixel_sdk/api/omx_teleoperation2.gif)
- This tutorial shows you example that OMX teleoperates Dynamixel using the Dynamixel API.
- Unlike single motor control, commands are executed all at once, allowing all motors to be controlled with a single packet. This enables a faster control cycle.
- With an OMX leader and follower, you can create your own teleoperation system in just a few lines of code.

**NOTE**: This tutorial explains how to write code using the Dynamixel API. It assumes that you have already installed the SDK.
{:.notice--warning}

# [Make cpp file](#make-cpp-file)
- Open a code editor and create a new C++ source file. In this example, we use visual studio code.
```bash
$ code dxl_tutorial_7.cpp
```

# [Source Code Description](#source-code-description)

```cpp
#include "dynamixel_sdk/dynamixel_api.hpp"

int main(){

  // Create Connector, GroupExecutor and Motor Objects
  dynamixel::Connector connector_leader("/dev/ttyACM1", 2.0, 1000000);
  dynamixel::Connector connector_follower("/dev/ttyACM0", 2.0, 1000000);
  std::unique_ptr<dynamixel::GroupExecutor> group_executor_leader = connector_leader.createGroupExecutor();
  std::unique_ptr<dynamixel::GroupExecutor> group_executor_follower = connector_follower.createGroupExecutor();

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

  while(true){
    group_executor_leader->addCmd(leader_motor1->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor2->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor3->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor4->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor5->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor_gripper->stageGetPresentPosition());

    auto result = group_executor_leader->executeRead();
    int leader_motor1_position = result.value()[0].value();
    int leader_motor2_position = result.value()[1].value();
    int leader_motor3_position = result.value()[2].value();
    int leader_motor4_position = result.value()[3].value();
    int leader_motor5_position = result.value()[4].value();
    int leader_motor_gripper_position = result.value()[5].value();

    group_executor_follower->addCmd(follower_motor1->stageSetGoalPosition(leader_motor1_position));
    group_executor_follower->addCmd(follower_motor2->stageSetGoalPosition(leader_motor2_position));
    group_executor_follower->addCmd(follower_motor3->stageSetGoalPosition(leader_motor3_position));
    group_executor_follower->addCmd(follower_motor4->stageSetGoalPosition(leader_motor4_position));
    group_executor_follower->addCmd(follower_motor5->stageSetGoalPosition(leader_motor5_position));
    group_executor_follower->addCmd(follower_motor_gripper->stageSetGoalPosition(leader_motor_gripper_position));
    auto result_void = group_executor_follower->executeWrite();
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
- Create each `GroupExecutor` objects using the `createGroupExecutor` method of the `Connector` class.
- This object is used to execute multiple commands simultaneously.
```cpp
    std::unique_ptr<dynamixel::GroupExecutor> group_executor_leader = connector_leader.createGroupExecutor();
    std::unique_ptr<dynamixel::GroupExecutor> group_executor_follower = connector_follower.createGroupExecutor();
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
- In a loop, read the present position of the leader motors simultaneously using the `stageGetPresentPosition` method and set the goal position of the follower motors simultaneously to the same value using the `stageSetGoalPosition` method.
```cpp
  while(true){
    group_executor_leader->addCmd(leader_motor1->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor2->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor3->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor4->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor5->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor_gripper->stageGetPresentPosition());

    auto result = group_executor_leader->executeRead();
    int leader_motor1_position = result.value()[0].value();
    int leader_motor2_position = result.value()[1].value();
    int leader_motor3_position = result.value()[2].value();
    int leader_motor4_position = result.value()[3].value();
    int leader_motor5_position = result.value()[4].value();
    int leader_motor_gripper_position = result.value()[5].value();

    group_executor_follower->addCmd(follower_motor1->stageSetGoalPosition(leader_motor1_position));
    group_executor_follower->addCmd(follower_motor2->stageSetGoalPosition(leader_motor2_position));
    group_executor_follower->addCmd(follower_motor3->stageSetGoalPosition(leader_motor3_position));
    group_executor_follower->addCmd(follower_motor4->stageSetGoalPosition(leader_motor4_position));
    group_executor_follower->addCmd(follower_motor5->stageSetGoalPosition(leader_motor5_position));
    group_executor_follower->addCmd(follower_motor_gripper->stageSetGoalPosition(leader_motor_gripper_position));
    auto result_void = group_executor_follower->executeWrite();
  }
}
```

# [Error Handling](#error-handling)
- To ensure your code is robust, every method that sends a command to the motor returns a **Result** object that encapsulates errors.
- This object lets you safely check for any communication or device errors before proceeding.
- executeRead() method returns **Result<std::vector<Result<int32_t, Error>>, Error>** type. So you need to check for errors twice.
- You can check for communication errors and device(dynamixel) errors using the **Result** object.

  **Example**
  ``` cpp
    auto result = group_executor->executeRead(); // type of 'result_void' variable is Result<void, DxlError>
    if (!result_void.isSuccess()) {
      std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
      return 1;
    }
    std::vector<int> positions;
    for (const auto& result : result.value()) {
      if (!result.isSuccess()) {
        std::cerr << dynamixel::getErrorMessage(result.error()) << std::endl;
        return 1;
      }
      positions.push_back(result.value());
    }
  ```

- stage functions return **Result<void, Error>** type.
- You can either pass this value directly to the addCmd() function, or perform error checking first and then pass the resulting command value.
  **Example**
  ``` cpp
    auto result_cmd = motor1->stageGetPresentPosition(); // type of 'result_cmd' variable is Result<stagedCommand, DxlError>
    if (!result_cmd.isSuccess()) {
      std::cerr << dynamixel::getErrorMessage(result_cmd.error()) << std::endl;
      return 1;
    }
    group_executor->addCmd(result_cmd.value());
  ```

# [Compile and Run](#compile-and-run)
- You can compile and run the code using the following commands
```bash
$ g++ dxl_tutorial_7.cpp -o dxl_tutorial_7 -l dxl_x64_cpp
$ ./dxl_tutorial_7
```
<div class="notice--warning">
  ![](/assets/images/sw/sdk/dynamixel_sdk/api/omx_init_pose.jpg)
  - Before running the program, please set the robot to the initial pose as shown in the picture above.
  - This example demonstrates a simple teleoperation system.
  - You can refer to this example to build your own system.
  - All motor settings use the default values of the OMX product.
</div>
