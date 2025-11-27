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

    motor1_position = present_positions[0]
    motor2_position = present_positions[1]
    print("Motor1 Present Position:", motor1_position)
    print("Motor2 Present Position:", motor2_position)

if __name__ == "__main__":
    main()
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
```python
      motor1_position = present_positions[0]
      motor2_position = present_positions[1]
      print("Motor1 Present Position:", motor1_position)
      print("Motor2 Present Position:", motor2_position)
```
- This method decides the communication packet type automatically between Sync and Bulk based on the staged commands.

# [Error Handling](#error-handling)
- When an error occurs, `DxlRuntimeError` is raised.
- You can catch this error using a try-except block.
```python
  try:
      group_executor.ReadWrite()
  except DxlRuntimeError as e:
      print(e)
```
- `DxlRuntimeError` contains `DxlError` Enum that provides detailed information about the error.
```python
  try:
      group_executor.ReadWrite()
  except DxlRuntimeError as e:
      if e.dxl_error == DxlError.EASY_SDK_ADD_PARAM_FAIL:
          print("Failed to add param.")
      elif e.dxl_error == DxlError.EASY_SDK_COMMAND_IS_EMPTY:
          print("Command is empty.")
```
- If only certain values among those read by group control have errors, those values are displayed as None.
