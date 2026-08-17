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
#include <iostream>
#include <vector>
#include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"

int main() {
  dynamixel::Connector connector("/dev/ttyACM0", 57600);
  
  std::vector<uint8_t> ids = {1, 2};

  // Create SmartGroupReader for Present Position
  auto reader = connector.createReader(ids, "Present_Position", "position");
  
  auto [result, status] = reader->read();

  if (status.success) {
    int motor1_position = result[1]["position"];
    int motor2_position = result[2]["position"];
    std::cout << "Motor1 Present Position: " << motor1_position << std::endl;
    std::cout << "Motor2 Present Position: " << motor2_position << std::endl;
  }
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

## [Read Data from Multiple Motors Simultaneously](#read-data-from-multiple-motors-simultaneously)
- Create a `SmartGroupReader` using `createReader` method.
- Pass the list of IDs and the item name to read.
- We set the key to "position" to access the data easily later.
- This creates a **SmartGroupReader** internally and optimizes for Sync/Bulk read.
```cpp
    std::vector<uint8_t> ids = {1, 2};
    auto reader = connector.createReader(ids, "Present_Position", "position");
```
- Execute the read operation using `read()` method.
```cpp
    auto [result, status] = reader->read();
```
- Check the `status.success` and retrieve values using `result[id][key]` or `result[index]`.
```cpp
    if (status.success) {
      int motor1_position = result[1]["position"];
      int motor2_position = result[2]["position"];
      std::cout << "Motor1 Present Position: " << motor1_position << std::endl;
      std::cout << "Motor2 Present Position: " << motor2_position << std::endl;
    }
```

# [Error Handling](#error-handling)
- `read_or_throw()` throws a `dynamixel::DxlError` exception if the communication fails.
- You can use a `try-catch` block to handle these exceptions gracefully and simplify the control flow.

  **Example**
  ``` cpp
    try {
      auto result = reader->read_or_throw();
      // success
    } catch (const dynamixel::DxlError& e) {
      std::cerr << "Error: " << e.what() << std::endl;
      return 1;
    }
  ```

# [Compile and Run](#compile-and-run)
- You can compile and run the code using the following commands
```bash
$ g++ tutorial_step6.cpp -o tutorial_step6 -ldxl_cpp
$ ./tutorial_step6
```

# [Full Source Code With Error Handling](#full-source-code-with-error-handling)
```cpp
#include <iostream>
#include <vector>
#include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"

int main() {
  dynamixel::Connector connector("/dev/ttyACM0", 57600);
  
  std::vector<uint8_t> ids = {1, 2};
  auto reader = connector.createReader(ids, "Present_Position", "position");
  
  try {
    auto result = reader->read_or_throw();

    int motor1_position = result[1]["position"];
    int motor2_position = result[2]["position"];
    std::cout << "Motor1 Present Position: " << motor1_position << std::endl;
    std::cout << "Motor2 Present Position: " << motor2_position << std::endl;

  } catch (const dynamixel::DxlError& e) {
    std::cerr << "Error: " << e.what() << std::endl;
    return 1;
  }
}
```
