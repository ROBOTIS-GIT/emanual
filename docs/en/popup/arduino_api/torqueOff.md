---
layout: popup
---

# torqueOff

## Description

This function turns off the torque of DYNAMIXEL.

## Syntax

- torqueOff(id)

## parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.torqueOff(1);
```
