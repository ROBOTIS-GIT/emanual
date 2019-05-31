---
layout: popup
---

# ledOn

## Description

This function turns on the led of DYNAMIXEL.

## Syntax

- ledOn(id)

## parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.ledOn(1);
```
