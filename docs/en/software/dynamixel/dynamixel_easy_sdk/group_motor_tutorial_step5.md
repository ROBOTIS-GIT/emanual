---
layout: archive
lang: en
ref: group_motor_tutorial_step5
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_easy_sdk/group_motor_tutorial_step5/
sidebar:
  title: DYNAMIXEL Easy SDK
  nav: "dynamixel_easy_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-easy-sdk-tutorial-step5">Step 5: Simultaneous Control of Multiple DYNAMIXELs</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

- This tutorial shows you how to move multiple Dynamixels simultaneously using the Dynamixel Easy SDK.

**NOTE**: This tutorial explains how to write code using the Dynamixel Easy SDK. It assumes that you have already installed the SDK.
{:.notice--warning}

# [Make cpp file](#make-cpp-file)
- Create a new C++ source file Open it with your editor.
```bash
$ touch tutorial_step5.cpp
```

# [Check the Port Names](#check-the-port-names)
- Before running the code, check the port name of the connected Dynamixel.
- For General
  - OpenRB-150: `ttyACM0: USB ACM device`
  - U2D2: `FTDI USB Serial Device converter now attached to ttyUSB0`
```bash
$ sudo dmesg | grep tty
```

# [Source Code Description](#source-code-description)

```cpp
#include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"

int main(){

  dynamixel::Connector connector("/dev/ttyACM0", 57600);
  std::unique_ptr<dynamixel::GroupExecutor> group_executor = connector.createGroupExecutor();
  std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);
  std::unique_ptr<dynamixel::Motor> motor2 = connector.createMotor(2);

  motor1->disableTorque();
  motor2->disableTorque();
  motor1->setOperatingMode(dynamixel::Motor::OperatingMode::POSITION);
  motor2->setOperatingMode(dynamixel::Motor::OperatingMode::POSITION);
  motor1->enableTorque();
  motor2->enableTorque();

  int target_position = 500;
  group_executor->addCmd(motor1->stageSetGoalPosition(target_position));
  group_executor->addCmd(motor2->stageSetGoalPosition(target_position));
  group_executor->executeWrite();
  group_executor->clearStagedWriteCommands();
}
```

## [Add Header Files](#add-header-files)
- Add `dynamixel_easy_sdk/dynamixel_easy_sdk.hpp` to the top of your CPP file. This class is included in the Dynamixel SDK package.
```cpp
  #include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"
```

## [Create Connector and Motor Object](#create-connector-and-motor-object)
- Create a `Connector` object with port name, baud rate, and protocol version to manage the communication.(Only protocol 2.0 is supported)
```cpp
  int main(){
    dynamixel::Connector connector("/dev/ttyACM0", 57600);
```
- Create a `GroupExecutor` object using the `createGroupExecutor` method of the `Connector` class.
- This object is used to execute multiple commands simultaneously.
```cpp
    std::unique_ptr<dynamixel::GroupExecutor> group_executor = connector.createGroupExecutor();
```
- Create a `Motor` object for each Dynamixel servo you want to control, using the `createMotor` method of the `Connector` class.
- This method takes the motor ID as an argument and returns a unique pointer to a `Motor` instance. (shared_ptr is also available)
```cpp
    std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);
    std::unique_ptr<dynamixel::Motor> motor2 = connector.createMotor(2);
```
- This process throws a `DxlRuntimeError` if the object creation fails.

## [Set Operating Mode to Position Control Mode](#set-operating-mode-to-position-control-mode)
- Use the methods provided by the `Motor` class to control the Dynamixel servo.
- Set the operating mode to position control mode.
```cpp
    motor1->disableTorque();
    motor2->disableTorque();
    motor1->setOperatingMode(dynamixel::Motor::OperatingMode::POSITION);
    motor2->setOperatingMode(dynamixel::Motor::OperatingMode::POSITION);
    motor1->enableTorque();
    motor2->enableTorque();
```

## [Move Motor to Goal Position](#move-motor-to-goal-position)
- Add commands to set the goal position of each motor using the `stageSetGoalPosition` method of the `Motor` class.
```cpp
    int target_position = 500;
    group_executor->addCmd(motor1->stageSetGoalPosition(target_position));
    group_executor->addCmd(motor2->stageSetGoalPosition(target_position));
```
- Execute all the staged commands simultaneously using the `execute` method of the `GroupExecutor` class.
```cpp
    group_executor->executeWrite();
```
- This will send the commands to both motors at the same time, causing them to move to the specified goal position simultaneously.
- This method decides the communication packet type automatically between Sync and Bulk based on the staged commands.
- Clear the staged commands after execution using the `clearStagedWriteCommands` method of the `GroupExecutor` class.
```cpp
    group_executor->clearStagedWriteCommands();
```

# [Error Handling](#error-handling)
- To ensure your code is robust, every method that sends a command to the motor returns a **Result** object that encapsulates errors.
- This object lets you safely check for any communication or device errors before proceeding.
- You can check for communication errors and device(dynamixel) errors using the **Result** object.

  **Example**
  ``` cpp
    auto result_void = group_executor->executeWrite(); // type of 'result_void' variable is Result<void, DxlError>
    if (!result_void.isSuccess()) {
      std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
      return 1;
    }
  ```

- stage functions return **Result<void, Error>** type.
- You can either pass this value directly to the addCmd() function, or perform error checking first and then pass the resulting command value.
  **Example**
  ``` cpp
    auto result_cmd = motor1->stageSetGoalPosition(target_position); // type of 'result_cmd' variable is Result<stagedCommand, DxlError>
    if (!result_cmd.isSuccess()) {
      std::cerr << dynamixel::getErrorMessage(result_cmd.error()) << std::endl;
      return 1;
    }
    group_executor->addCmd(result_cmd.value());
  ```

# [Compile and Run](#compile-and-run)
- You can compile and run the code using the following commands
```bash
$ g++ tutorial_step5.cpp -o tutorial_step5 -l dxl_x64_cpp
$ ./tutorial_step5
```

# [Full Source Code With Error Handling](#full-source-code-with-error-handling)
```cpp
#include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"

int main(){

  dynamixel::Connector connector("/dev/ttyACM0", 57600);
  std::unique_ptr<dynamixel::GroupExecutor> group_executor = connector.createGroupExecutor();
  std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);
  std::unique_ptr<dynamixel::Motor> motor2 = connector.createMotor(2);

  auto result_void = motor1->disableTorque();
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }

  result_void = motor2->disableTorque();
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }

  result_void = motor1->setOperatingMode(dynamixel::Motor::OperatingMode::POSITION);
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }

  result_void = motor2->setOperatingMode(dynamixel::Motor::OperatingMode::POSITION);
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }

  result_void = motor1->enableTorque();
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }
  result_void = motor2->enableTorque();
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }

  int target_position = 500;
  auto result_cmd = motor1->stageSetGoalPosition(target_position);
  if (!result_cmd.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_cmd.error()) << std::endl;
    return 1;
  }
  group_executor->addCmd(result_cmd.value());

  result_cmd = motor2->stageSetGoalPosition(target_position);
  if (!result_cmd.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_cmd.error()) << std::endl;
    return 1;
  }
  group_executor->addCmd(result_cmd.value());

  result_void = group_executor->executeWrite();
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }

  group_executor->clearStagedWriteCommands();
}
```
