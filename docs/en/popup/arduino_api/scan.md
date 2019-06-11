---
layout: popup
---

# scan

## Description

This function checks the connection status of DYNAMIXEL with Broadcast ID.

## Syntax

- scan()

## Parameters

- None

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
  const int DXL_DIR_PIN = 2;
  Dynamixel2Arduino dxl(Serial1, DXL_DIR_PIN);
  dxl.scan();
```
