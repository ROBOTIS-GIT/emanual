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

    ids = [1, 2]
    keys = ["pos1", "pos2"]

    group_reader = connector.createReader(ids, "Present_Position", keys)
    group_reader.read()

    motor1_position = group_reader.get("pos1")
    motor2_position = group_reader.get("pos2")
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

## [Read Data from Multiple Motors Simultaneously](#read-data-from-multiple-motors-simultaneously)
- Create a `SmartGroupReader` object using the `createReader` method of the `Connector` class.
- You can initialize the `SmartGroupReader` with a list of IDs and Keys to add multiple motors at once (Short Form).
- **Note**: Unlike C++, Python requires **unique keys** for each motor to prevent data overwriting in the dictionary.
```python
      ids = [1, 2]
      keys = ["pos1", "pos2"]
      group_reader = connector.createReader(ids, "Present_Position", keys)
```
- Execute with `read()`.
```python
      group_reader.read()
```
- This will send the commands to both motors simultaneously and read the requested data.
- This method decides the communication packet type automatically between Sync and Bulk.
- Retrieve the data using the `get` method with the unique key you specified.
```python
      motor1_position = group_reader.get("pos1")
      motor2_position = group_reader.get("pos2")
      print("Motor1 Present Position:", motor1_position)
      print("Motor2 Present Position:", motor2_position)
```


# [Error Handling](#error-handling)
- When an error occurs, `DxlRuntimeError` is raised.
- You can catch this error using a try-except block.
```python
  try:
      group_reader.read()
  except DxlRuntimeError as e:
      print(e)
```
- `DxlRuntimeError` contains `DxlError` Enum that provides detailed information about the error.
```python
  try:
      group_reader.read()
  except DxlRuntimeError as e:
      if e.dxl_error == DxlError.EASY_SDK_ADD_PARAM_FAIL:
          print(f"Failed to add param: {e}")
      elif e.dxl_error == DxlError.EASY_SDK_COMMAND_IS_EMPTY:
          print(f"Command is empty: {e}")
```
- If only certain values among those read by group control have errors, those values are displayed as None.
