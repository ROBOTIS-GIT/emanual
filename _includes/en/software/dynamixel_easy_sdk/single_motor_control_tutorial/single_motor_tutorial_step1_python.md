{::options parse_block_html="true" /}

**NOTE**: It assumes that you have already installed the SDK.
{:.notice--warning}

# [Make py file](#make-py-file)
- Create a new Python source file Open it with your editor.
```bash
$ touch tutorial_step1.py
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
    motor1 = connector.createMotor(1)

    motor1.disableTorque()
    motor1.setOperatingMode(Motor.OperatingMode.POSITION)
    motor1.enableTorque()

    target_position = 500
    motor1.setGoalPosition(target_position)

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
- Create a `Motor` object for each Dynamixel servo you want to control with its ID, using the `createMotor` method of the `Connector` class.
```python
      motor1 = connector.createMotor(1)
```

## [Set Operating Mode to Position Control Mode](#set-operating-mode-to-position-control-mode)
- Use the methods provided by the `Motor` class to control the Dynamixel servo.
- Set the operating mode to position control mode.
```python
    motor1.disableTorque()
    motor1.setOperatingMode(OperatingMode.POSITION)
    motor1.enableTorque()
```

## [Move Motor to Goal Position](#move-motor-to-goal-position)
- Move the motor to the goal position that you want.
```python
    target_position = 500
    motor1.setGoalPosition(target_position)
```

# [Error Handling](#error-handling)
- When an error occurs, `DxlRuntimeError` is raised.
- You can catch this error using a try-except block.
```python
  try:
      motor1.setGoalPosition(target_position)
  except DxlRuntimeError as e:
      print(e)
```
- `DxlRuntimeError` contains `DxlError` Enum that provides detailed information about the error.
```python
  try:
      motor1.setGoalPosition(target_position)
  except DxlRuntimeError as e:
      if e.dxl_error == DxlError.EASY_SDK_TORQUE_STATUS_MISMATCH:
          print("Torque is off.")
      elif e.dxl_error == DxlError.EASY_SDK_OPERATING_MODE_MISMATCH:
          print("Operating mode is not position control.")
```
