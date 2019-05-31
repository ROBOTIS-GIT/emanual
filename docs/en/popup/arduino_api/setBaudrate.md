---
layout: popup
---

# setBaudrate

## Description

This function changes baudrate of DYNAMIXEL.

## Syntax

- setBaudrate(id, baudrate)

## parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **baudrate** : Communication speed(baudrate) to use. Data type : unsigned int32

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.setBaudrate(1, 57600);
```
