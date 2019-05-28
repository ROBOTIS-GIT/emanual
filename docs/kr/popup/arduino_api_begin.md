---
layout: popup
---

# begin

## Description

Initialization function to start communication with DYNAMIXEL or change baudrate of serial port.

## Syntax

- begin(baud)

## parameters

- **baud** : The communication speed to set the serial port (the speed to communicate with DYNAMIXEL) (default : 57600)

## Returns

- None

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.begin(57600);
```
