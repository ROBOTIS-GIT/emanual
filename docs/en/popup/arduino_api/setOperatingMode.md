---
layout: popup
---

# setOperatingMode

## Description

This function changes operating mode of DYNAMIXEL.

## Syntax

- setOperatingMode(id, mode)

## parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **mode** : Operating mode to use. Data type : unsigned int8

| Decimal | Defined                   | Mode                                |
|:-------:|:--------------------------|:------------------------------------|
|    0    | OP_POSITION               | Position Control Mode               |
|    1    | OP_EXTENDED_POSITION      | Extended Position Control Mode      |
|    2    | OP_CURRENT_BASED_POSITION | Current-based Position Control Mode |
|    3    | OP_VELOCITY               | Velocity Control mode               |
|    4    | OP_PWM                    | PWM Control Mode                    |
|    5    | OP_CURRENT                | Curernt Control Mode                |

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.setOperatingMode(1, OP_POSITION);
```
