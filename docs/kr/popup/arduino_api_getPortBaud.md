---
layout: popup
---

# getPortBaud

## Description

This function gets baudrate of the serial port.

## Syntax

- getPortBaud()

## parameters

- None

## Returns

- Baudrate of the serial port. Data type : unsigned long

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  Serial.print(dxl.getPortBaud());
```
