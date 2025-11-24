{::options parse_block_html="true" /}

**NOTE**: It assumes that you have already installed the SDK.
{:.notice--warning}

# [Make py file](#make-cpp-file)
- Create a new Python source file Open it with your editor.
```bash
$ touch tutorial_step2.py
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

```py
from dynamixel_easy_sdk import *

def main():
    connector = Connector("/dev/ttyACM0", 57600)
    motor1 = connector.createMotor(1)

    present_position = motor1.getPresentPosition()
    print("Present Position:", present_position)

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

## [Get Present Position](#get-present-position)
- You can read the present position of the motor using the `getPresentPosition` method.
```python
      present_position = motor1.getPresentPosition()
      print("Present Position:", present_position)
```

# [Error Handling](#error-handling)
- When an error occurs, `DxlRuntimeError` is raised.
- You can catch this error using a try-except block.
```python
  try:
      motor1.getPresentPosition()
  except DxlRuntimeError as e:
      print(e)
```
- `DxlRuntimeError` contains `DxlError` Enum that provides detailed information about the error.
```python
  try:
      motor1.getPresentPosition()
  except DxlRuntimeError as e:
      if e.dxl_error == DxlError.SDK_COMM_TX_FAIL:
          print("Transmission failed.")
      elif e.dxl_error == DxlError.SDK_COMM_RX_FAIL:
          print("Receive failed.")
```
