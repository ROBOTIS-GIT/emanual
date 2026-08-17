{::options parse_block_html="true" /}

# [Make cpp file](#make-cpp-file)
- Create a new C++ source file Open it with your editor.
```bash
$ touch tutorial_step5.cpp
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
#include <iostream>
#include <vector>
#include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"

int main() {
  dynamixel::Connector connector("/dev/ttyACM0", 57600);
  
  std::vector<uint8_t> ids = {1, 2};

  // Turn off torque
  connector.createWriter()->add(ids, "Torque_Enable", 0).write_or_throw();
  // Set Operating Mode (Position Control)
  connector.createWriter()->add(ids, "Operating_Mode", dynamixel::OperatingMode::POSITION).write_or_throw();
  // Turn on torque
  connector.createWriter()->add(ids, "Torque_Enable", 1).write_or_throw();

  int target_position = 500;
  connector.createWriter()->add(ids, "Goal_Position", target_position).write_or_throw();
}
```

## [Add Header Files](#add-header-files)
- Add `dynamixel_easy_sdk/dynamixel_easy_sdk.hpp` to the top of your CPP file.
- Add `<iostream>` and `<vector>` for standard I/O and container operations.
```cpp
  #include <iostream>
  #include <vector>
  #include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"
```

## [Create Connector](#create-connector)
- Create a `Connector` object with port name, baud rate, and protocol version.
```cpp
  int main(){
    dynamixel::Connector connector("/dev/ttyACM0", 57600);
```

## [Set Operating Mode to Position Control Mode](#set-operating-mode-to-position-control-mode)
- Prepare a list of motor IDs to control simultaneously.
```cpp
    std::vector<uint8_t> ids = {1, 2};
```
- Use `createWriter()` and `add()` with the ID list to configure multiple motors at once.
- This creates a **SmartGroupWriter** internally, adds the values, and sends the packet purely.
- You can chain `write_or_throw()` immediately for concise code.
```cpp
    // Turn off torque to change operating mode
    connector.createWriter()->add(ids, "Torque_Enable", 0).write_or_throw();
    // Set to Position Control Mode (3)
    connector.createWriter()->add(ids, "Operating_Mode", dynamixel::OperatingMode::POSITION).write_or_throw();
    // Turn on torque
    connector.createWriter()->add(ids, "Torque_Enable", 1).write_or_throw();
```

## [Move Motor to Goal Position](#move-motor-to-goal-position)
- Send the goal position to all motors in the list.
```cpp
    int target_position = 500;
    connector.createWriter()->add(ids, "Goal_Position", target_position).write_or_throw();
```
- This method decides the communication packet type automatically between Sync and Bulk.

# [Error Handling](#error-handling)
- `write_or_throw` throws `DxlError` if communication fails.
- You can use try-catch block.

  **Example**
  ``` cpp
    try {
      connector.createWriter()->add(ids, "Goal_Position", 500).write_or_throw();
    } catch (const dynamixel::DxlError& e) {
      std::cerr << "Error: " << e.what() << std::endl;
      return 1;
    }
  ```

# [Compile and Run](#compile-and-run)
- You can compile and run the code using the following commands
```bash
$ g++ tutorial_step5.cpp -o tutorial_step5 -ldxl_cpp
$ ./tutorial_step5
```

# [Full Source Code With Error Handling](#full-source-code-with-error-handling)
```cpp
#include <iostream>
#include <vector>
#include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"

int main() {
  // Check your port name! (e.g. /dev/ttyUSB0 for U2D2, /dev/ttyACM0 for OpenRB)
  dynamixel::Connector connector("/dev/ttyACM0", 57600); 
  std::vector<uint8_t> ids = {1, 2};

  try {
    // Turn off torque
    connector.createWriter()->add(ids, "Torque_Enable", 0).write_or_throw();
    // Set Operating Mode (Position Control)
    connector.createWriter()->add(ids, "Operating_Mode", dynamixel::OperatingMode::POSITION).write_or_throw();
    // Turn on torque
    connector.createWriter()->add(ids, "Torque_Enable", 1).write_or_throw();

    // Write Goal Position
    int target_position = 500;
    connector.createWriter()->add(ids, "Goal_Position", target_position).write_or_throw();
    
  } catch (const dynamixel::DxlError& e) {
     std::cerr << "Dynamixel Error: " << e.what() << std::endl;
     return 1;
  }
}
```
