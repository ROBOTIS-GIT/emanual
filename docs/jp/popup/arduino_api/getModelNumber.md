---
layout: popup
---

# getModelNumber

## Description

This function requests the model number of DYNAMIXEL.

## Syntax

- getModelNumber(id)

## Parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8

## Returns

- The model number read from the DYNAMIXEL control table.
- If fails, 0xFFFF will be returned.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  Serial.print(dxl.getModelNumber(1));
```
