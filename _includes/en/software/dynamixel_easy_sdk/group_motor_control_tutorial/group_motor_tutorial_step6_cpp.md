{::options parse_block_html="true" /}

# [Make cpp file](#make-cpp-file)
- Create a new C++ source file Open it with your editor.
```bash
$ touch tutorial_step6.cpp
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

  group_executor->addCmd(motor1->stageGetPresentPosition());
  group_executor->addCmd(motor2->stageGetPresentPosition());
  auto result = group_executor->executeRead();
  group_executor->clearStagedReadCommands();

  int motor1_position = result.value()[0].value();
  int motor2_position = result.value()[1].value();
  std::cout << "Motor1 Present Position: " << motor1_position << std::endl;
  std::cout << "Motor2 Present Position: " << motor2_position << std::endl;
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
- Clear the staged read commands after execution using the `clearStagedReadCommands` method of the `GroupExecutor` class.
```cpp
    group_executor->clearStagedReadCommands();
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
$ g++ tutorial_step6.cpp -o tutorial_step6 -l dxl_x64_cpp
$ ./tutorial_step6
```

# [Full Source Code With Error Handling](#full-source-code-with-error-handling)
```cpp
#include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"

int main(){

  dynamixel::Connector connector("/dev/ttyACM0", 57600);
  std::unique_ptr<dynamixel::GroupExecutor> group_executor = connector.createGroupExecutor();
  std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);
  std::unique_ptr<dynamixel::Motor> motor2 = connector.createMotor(2);

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
  group_executor->clearStagedReadCommands();

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
```
