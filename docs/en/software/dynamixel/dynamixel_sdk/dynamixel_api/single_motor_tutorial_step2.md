---
layout: archive
lang: en
ref: single_motor_tutorial_step2
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/dynamixel_api/single_motor_tutorial_step2/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-api-tutorials-step2">Step 2: Read Data from DYNAMIXEL</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

- This tutorial shows you how to read data from a Dynamixel using the Dynamixel API.  

**NOTE**: It assumes that you have already installed and built the SDK.
{:.notice--warning}

# [Make cpp file](#make-cpp-file)
- Open a code editor and create a new C++ source file. In this example, we use visual studio code.
```bash
$ code dxl_tutorial_2.cpp
```

# [Source Code Description](#source-code-description)

```cpp
#include "dynamixel_sdk/dynamixel_api.hpp"

int main(){

  // Create Connector and Motor Object
  dynamixel::Connector connector("/dev/ttyUSB0", 2.0, 57600);
  std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);

  // Get Present Position
  auto result_int32_t = motor1->getPresentPosition();
  int present_position = result_int32_t.value();
  std::cout << "Present Position: " << present_position << std::endl;
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

## [Get Present Position](#get-present-position)
- You can read the present position of the motor using the `getPresentPosition` method.
- Return type of this method is `Result<int32_t, Error>`. You can get the actual position value using the `value()` method of the `Result` object.
```cpp
    auto result_int32_t = motor1->getPresentPosition();
    int present_position = result_int32_t.value();
    std::cout << "Present Position: " << present_position << std::endl;
```

# [Error Handling](#error-handling)
- To ensure your code is robust, every method that sends a command to the motor returns a **Result** object that encapsulates values and errors.
- This object lets you safely check for any communication or device errors before proceeding.
- You can check for communication errors and device(dynamixel) errors using the **Result** object.
- If you use `value()` when error occurred without checking for errors, it may throw an exception.

  **Example**
  ``` cpp
    auto result_int32_t = motor1->getPresentPosition();
    if (!result_int32_t.isSuccess()) {
      std::cerr << dynamixel::getErrorMessage(result_int32_t.error()) << std::endl;
      return 1;
    }
    int present_position = result_int32_t.value();
  ```

# [Compile and Run](#compile-and-run)
- You can compile and run the code using the following commands
```bash
$ g++ dxl_tutorial_2.cpp -o dxl_tutorial_2 -l dxl_x64_cpp
$ ./dxl_tutorial_2
```

# [Full Source Code With Error Handling](#full-source-code-with-error-handling)
```cpp
#include "dynamixel_sdk/dynamixel_api.hpp"

int main(){
  dynamixel::Connector connector("/dev/ttyUSB0", 2.0, 57600);
  std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);

  auto result_int32_t = motor1->getPresentPosition();
  if (!result_int32_t.isSuccess()) {
    std::cerr << dynamixel::getErrorMessage(result_int32_t.error()) << std::endl;
    return 1;
  }
  int present_position = result_int32_t.value();
  std::cout << "Present Position: " << present_position << std::endl;
  }
}
```
