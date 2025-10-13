---
layout: archive
lang: en
ref: group_motor_tutorial_step6
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/dynamixel_api/group_motor_tutorial_step6/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-api-tutorials-step6">Step 6: Read Data from Multiple DYNAMIXELs Simultaneously</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

- This tutorial shows you how to read data from multiple Dynamixels simultaneously using the Dynamixel API.

**NOTE**: This tutorial explains how to write code using the Dynamixel API. It assumes that you have already installed the SDK.
{:.notice--warning}

# [Make cpp file](#make-cpp-file)
- Open a code editor and create a new C++ source file. In this example, we use visual studio code.
```bash
$ code dxl_tutorial_6.cpp
```

# [Source Code Description](#source-code-description)

```cpp
#include "dynamixel_sdk/dynamixel_api.hpp"

int main(){

  // Create Connector, GroupExecutor and Motor Objects
  dynamixel::Connector connector("/dev/ttyUSB0", 2.0, 57600);
  std::unique_ptr<dynamixel::GroupExecutor> group_executor = connector.createGroupExecutor();
  std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);
  std::unique_ptr<dynamixel::Motor> motor2 = connector.createMotor(2);

  // Read data from multiple motors simultaneously
  group_executor->addCmd(motor1->stageGetPresentPosition());
  group_executor->addCmd(motor2->stageGetPresentPosition());
  auto result = group_executor->executeRead();
  int motor1_position = result.value()[0].value();
  int motor2_position = result.value()[1].value();
  std::cout << "Motor1 Present Position: " << motor1_position << std::endl;
  std::cout << "Motor2 Present Position: " << motor2_position << std::endl;
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

## [Read Data from Multiple Motors Simultaneously](#read-data-from-multiple-motors-simultaneously)
- Add commands to read the present position of each motor using the `stageGetPresentPosition` method of the `Motor` class.
```cpp
    group_executor->addCmd(motor1->stageGetPresentPosition());
    group_executor->addCmd(motor2->stageGetPresentPosition());
```
- Execute all the staged commands simultaneously using the `executeRead` method of the `GroupExecutor` class.
```cpp
    auto result = group_executor->executeRead();
```
- This will send the commands to both motors at the same time and read the present position of each motor.
- The return type of this method is `Result<std::vector<Result<int32_t, Error>>, Error>`.
- You can get the actual position values using the `value()` method of the `Result` object.
```cpp
    int motor1_position = result.value()[0].value();
    int motor2_position = result.value()[1].value();
    std::cout << "Motor1 Present Position: " << motor1_position << std::endl;
    std::cout << "Motor2 Present Position: " << motor2_position << std::endl;
```
- This method decides the communication packet type automatically between Sync and Bulk based on the staged commands.

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
$ g++ dxl_tutorial_6.cpp -o dxl_tutorial_6 -l dxl_x64_cpp
$ ./dxl_tutorial_6
```

# [Full Source Code With Error Handling](#full-source-code-with-error-handling)
```cpp
#include "dynamixel_sdk/dynamixel_api.hpp"

int main(){

  // Create Connector, GroupExecutor and Motor Objects
  dynamixel::Connector connector("/dev/ttyUSB0", 2.0, 57600);
  std::unique_ptr<dynamixel::GroupExecutor> group_executor = connector.createGroupExecutor();
  std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);
  std::unique_ptr<dynamixel::Motor> motor2 = connector.createMotor(2);

  // Read data from multiple motors simultaneously
  auto result_cmd = motor1->stageGetPresentPosition();
  if (!result_cmd.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_cmd.error()) << std::endl;
    return 1;
  }
  group_executor->addCmd(result_cmd.value());

  result_cmd = motor2->stageGetPresentPosition();
  if (!result_cmd.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_cmd.error()) << std::endl;
    return 1;
  }
  group_executor->addCmd(result_cmd.value());

  auto result = group_executor->executeRead();
  if (!result.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result.error()) << std::endl;
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
  std::cout << "Motor1 Present Position: " << positions[0] << std::endl;
  std::cout << "Motor2 Present Position: " << positions[1] << std::endl;
}
