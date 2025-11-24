{::options parse_block_html="true" /}

# [Make Python file](#make-py-file)
- Create a new Python source file Open it with your editor.
```bash
$ touch tutorial_step5.py
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

    motor1.disableTorque()
    motor2.disableTorque()
    motor1.setOperatingMode(OperatingMode.POSITION)
    motor2.setOperatingMode(OperatingMode.POSITION)
    motor1.enableTorque()
    motor2.enableTorque()

    target_position = 500
    group_executor.addCmd(motor1.stageSetGoalPosition(target_position))
    group_executor.addCmd(motor2.stageSetGoalPosition(target_position))
    group_executor.executeWrite()
    group_executor.clearStagedWriteCommands()
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

## [Set Operating Mode to Position Control Mode](#set-operating-mode-to-position-control-mode)
- Use the methods provided by the `Motor` class to control the Dynamixel servo.
- Set the operating mode to position control mode.
```python
    motor1.disableTorque()
    motor2.disableTorque()
    motor1.setOperatingMode(OperatingMode.POSITION)
    motor2.setOperatingMode(OperatingMode.POSITION)
    motor1.enableTorque()
    motor2.enableTorque()
```

## [Move Motor to Goal Position](#move-motor-to-goal-position)
- Add commands to set the goal position of each motor using the `stageSetGoalPosition` method of the `Motor` class.
```python
    target_position = 500
    group_executor.addCmd(motor1.stageSetGoalPosition(target_position))
    group_executor.addCmd(motor2.stageSetGoalPosition(target_position))
```
- Execute all the staged commands simultaneously using the `execute` method of the `GroupExecutor` class.
```python
    group_executor.executeWrite()
```
- This will send the commands to both motors at the same time, causing them to move to the specified goal position simultaneously.
- This method decides the communication packet type automatically between Sync and Bulk based on the staged commands.
- Clear the staged commands after execution using the `clearStagedWriteCommands` method of the `GroupExecutor` class.
```python
    group_executor.clearStagedWriteCommands()
```

# [Error Handling](#error-handling)
- To ensure your code is robust, every method that sends a command to the motor returns a **Result** object that encapsulates errors.
- This object lets you safely check for any communication or device errors before proceeding.
- You can check for communication errors and device(dynamixel) errors using the **Result** object.

  **Example**
  ``` python
    result_void = group_executor.executeWrite()  # type of 'result_void' variable is Result<void, DxlError>
    if not result_void.isSuccess():
      print(dynamixel.getErrorMessage(result_void.error()))
      return 1
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

