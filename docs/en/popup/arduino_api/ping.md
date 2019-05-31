---
layout: popup
---

# ping

## Description

This function checks the connection status of DYNAMIXEL.

## Syntax

- ping(id)

## parameters

- **id** : ID of a specific DYNAMIXEL or Broadcast ID 254(0xFE). (default : 254) Data type : unsigned int8

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.ping(1);
```
