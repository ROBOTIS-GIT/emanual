{::options parse_block_html="true" /}

# [Make Python file](#make-py-file)
- Create a new Python source file Open it with your editor.
```bash
$ touch tutorial_step6.py
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

```python
from dynamixel_easy_sdk import *

def main():
    connector = Connector("/dev/ttyACM0", 57600)
    group_executor = connector.createGroupExecutor()
    motor1 = connector.createMotor(1)
    motor2 = connector.createMotor(2)

    group_executor.addCmd(motor1.stageGetPresentPosition())
    group_executor.addCmd(motor2.stageGetPresentPosition())
    present_positions = group_executor.executeRead()
    group_executor.clearStagedReadCommands()

    motor1_position = present_positions[0].value()
    motor2_position = present_positions[1].value()
    print("Motor1 Present Position:", motor1_position)
    print("Motor2 Present Position:", motor2_position)
```

## [Import Library](#import-library)
- Import `dynamixel_easy_sdk`.
```python
  from dynamixel_easy_sdk import *
```

## [Create Connector and Motor Object](#create-connector-and-motor-object)
- Create a `Connector` object with port name and baud rate to manage the communication.
```python
  def main():
      connector = Connector("/dev/ttyACM0", 57600)
```
- Create a `GroupExecutor` object using the `createGroupExecutor` method of the `Connector` class.
- This object is used to execute multiple commands simultaneously.
```python
      group_executor = connector.createGroupExecutor()
```
- Create a `Motor` object for each Dynamixel servo you want to control, using the `createMotor` method of the `Connector` class.
```python
      motor1 = connector.createMotor(1)
      motor2 = connector.createMotor(2)
```

## [Read Data from Multiple Motors Simultaneously](#read-data-from-multiple-motors-simultaneously)
- Add commands to read the present position of each motor using the `stageGetPresentPosition` method of the `Motor` class.
```python
    group_executor.addCmd(motor1.stageGetPresentPosition())
    group_executor.addCmd(motor2.stageGetPresentPosition())
```
- Execute all the staged commands simultaneously using the `executeRead` method of the `GroupExecutor` class.
```python
    present_positions = group_executor.executeRead()
```
- Clear the staged read commands after execution using the `clearStagedReadCommands` method of the `GroupExecutor` class.
```python
    group_executor.clearStagedReadCommands()
```

- This will send the commands to both motors at the same time and read the present position of each motor.
- The return type of this method is `List[int]`.
- You can get the actual position values using the `value()` method of the `Result` object.
```python
    motor1_position = present_positions[0].value()
    motor2_position = present_positions[1].value()
    print("Motor1 Present Position:", motor1_position)
    print("Motor2 Present Position:", motor2_position)
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
