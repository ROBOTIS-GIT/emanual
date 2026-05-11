{::options parse_block_html="true" /}

**NOTE**: It assumes that you have already installed and built the SDK.
{:.notice--warning}

# [Make cpp file](#make-cpp-file)
- Create a new C++ source file Open it with your editor.
```bash
$ touch tutorial_step2.cpp
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
  std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);

  auto result_int32_t = motor1->getPresentPosition();
  int present_position = result_int32_t.value();
  std::cout << "Present Position: " << present_position << std::endl;
}
```

## [Add Header Files](#add-header-files)
- Add `dynamixel_easy_sdk/dynamixel_easy_sdk.hpp` to the top of your CPP file. This class is included in the Dynamixel SDK package.
```cpp
  #include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"
```

## [Create Connector and Motor Object](#create-connector-and-motor-object)
- Create a `Connector` object with port name and baud rate to manage the communication.
```cpp
  int main(){
    dynamixel::Connector connector("/dev/ttyACM0", 57600);
```
- Create a `Motor` object for each Dynamixel servo you want to control, using the `createMotor` method of the `Connector` class.
- This method takes the motor ID as an argument and returns a unique pointer to a `Motor` instance. (shared_ptr is also available)
```cpp
    std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);
```
- This process throws a `DxlRuntimeError` if the object creation fails.

## [Get Present Position](#get-present-position)
- You can read the present position of the motor using the `getPresentPosition` method.
- Return type of this method is `Result<int32_t, DxlError>`. You can get the actual position value using the `value()` method of the `Result` object.
```cpp
    auto result_int32_t = motor1->getPresentPosition();
    int present_position = result_int32_t.value();
    std::cout << "Present Position: " << present_position << std::endl;
  }
```

# [Error Handling](#error-handling)
- To ensure your code is robust, every method that sends a command to the motor returns a **Result** object that encapsulates values and errors.
- This object lets you safely check for any communication or device errors before proceeding.
- The `error()` method returns a **DxlError** object. Since `DxlError` inherits from `std::runtime_error`, you can retrieve the error description using the `.what()` method.
- If you use `value()` when error occurred without checking for errors, it may throw an exception.

  **Example**
  ``` cpp
    auto result = motor1->getPresentPosition();
    if (!result.isSuccess()) {
      // Direct access to the error message string
      std::cerr << result.error().what() << std::endl;
      return 1;
    }
    int present_position = result.value();
  ```

# [Compile and Run](#compile-and-run)
- You can compile and run the code using the following commands
```bash
$ g++ tutorial_step2.cpp -o tutorial_step2 -ldxl_cpp
$ ./tutorial_step2
```

# [Full Source Code With Error Handling](#full-source-code-with-error-handling)
```cpp
#include <iostream>
#include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"

int main() {
  try {
    dynamixel::Connector connector("/dev/ttyACM0", 57600);
    std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);

    auto result = motor1->getPresentPosition();
    if (!result.isSuccess()) {
      std::cerr << "Error reading position: " << result.error().what() << std::endl;
      return 1;
    }
    
    int present_position = result.value();
    std::cout << "Present Position: " << present_position << std::endl;

  } catch (const dynamixel::DxlRuntimeError& e) {
    std::cerr << "Initialization Error: " << e.what() << std::endl;
    return 1;
  }
  
  return 0;
}
```
