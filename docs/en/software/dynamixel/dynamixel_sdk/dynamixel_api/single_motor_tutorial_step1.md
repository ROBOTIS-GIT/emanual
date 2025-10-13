---
layout: archive
lang: en
ref: single_motor_tutorial_step1
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/dynamixel_api/single_motor_tutorial_step1/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-api-tutorials-step1">Step 1: Moving Dynamixel</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

- This tutorial shows you how to move a single Dynamixel using the Dynamixel API.  

**NOTE**: It assumes that you have already installed and built the SDK.
{:.notice--warning}

# [Make cpp file](#make-cpp-file)
- Open a code editor and create a new C++ source file. In this example, we use visual studio code.
```bash
$ code dxl_tutorial_1.cpp
```

# [Source Code Description](#source-code-description)

```cpp
#include "dynamixel_sdk/dynamixel_api.hpp"

int main(){

  // Create Connector and Motor Object
  dynamixel::Connector connector("/dev/ttyUSB0", 2.0, 57600);
  std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);

  // Set Operating Mode to Position Control Mode
  motor1->disableTorque();
  motor1->setOperatingMode(dynamixel::Motor::OperatingMode::POSITION);
  motor1->enableTorque();

  // Move Motor to Goal Position
  int target_position = 500;
  motor1->setGoalPosition(target_position);
}
```

## [Add Header Files](#add-header-files)
- Add `dynamixel_sdk/dynamixel_api.hpp` to the top of your CPP file. This class is included in the Dynamixel SDK package.
```cpp
  #include "dynamixel_sdk/dynamixel_api.hpp"
```

## [Create Connector and Motor Object](#create-connector-and-motor-object)
- Create a `Connector` object with port name, baud rate, and protocol version to manage the communication.(Only protocol 2.0 is supported)
```cpp
  int main(){
    dynamixel::Connector connector("/dev/ttyUSB0", 2.0, 57600);
```
- Create a `Motor` object for each Dynamixel servo you want to control, using the `createMotor` method of the `Connector` class.
- This method takes the motor ID as an argument and returns a unique pointer to a `Motor` instance. (shared_ptr is also available)
```cpp
    std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);
```
- This process throws a `DxlRuntimeError` if the object creation fails.

## [Set Operating Mode to Position Control Mode](#set-operating-mode-to-position-control-mode)
- Use the methods provided by the `Motor` class to control the Dynamixel servo.
- Set the operating mode to position control mode.
```cpp
    motor1->disableTorque();
    motor1->setOperatingMode(dynamixel::Motor::OperatingMode::POSITION);
    motor1->enableTorque();
```

## [Move Motor to Goal Position](#move-motor-to-goal-position)
- Move the motor to the goal position that you want.
```cpp
    int target_position = 500;
    motor1->setGoalPosition(target_position);
```

# [Error Handling](#error-handling)
- To ensure your code is robust, every method that sends a command to the motor returns a **Result** object that encapsulates errors.
- This object lets you safely check for any communication or device errors before proceeding.
- You can check for communication errors and device(dynamixel) errors using the **Result** object.

  **Example**
  ``` cpp
    auto result_void = motor1->disableTorque(); // type of 'result_void' variable is Result<void, DxlError>
    if (!result_void.isSuccess()) {
      std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
      return 1;
    }
  ```

# [Compile and Run](#compile-and-run)
- You can compile and run the code using the following commands
```bash
$ g++ dxl_tutorial_1.cpp -o dxl_tutorial_1 -l dxl_x64_cpp
$ ./dxl_tutorial_1
```

# [Full Source Code With Error Handling](#full-source-code-with-error-handling)
```cpp
#include "dynamixel_sdk/dynamixel_api.hpp"

int main(){
  dynamixel::Connector connector("/dev/ttyUSB0", 2.0, 57600);
  std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);

  //Disble torque to change operating mode
  auto result_void = motor1->disableTorque(); // type of 'result_void' variable is Result<void, DxlError>
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }

  //Set operating mode to position control mode
  result_void = motor1->setOperatingMode(dynamixel::Motor::OperatingMode::POSITION);
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }

  //Enable torque to operate motor
  result_void = motor1->enableTorque();
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }

  //Set goal position
  int target_position = 500;
  result_void = motor1->setGoalPosition(target_position);
  if (!result_void.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
    return 1;
  }
}
```
