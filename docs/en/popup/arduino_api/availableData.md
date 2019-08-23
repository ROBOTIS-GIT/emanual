---
layout: popup
---

# availableData

## Description

Check if data is received at the serial port.

## Syntax

- availableData()

## Parameters

- None

## Returns

- True(1) if data is received.
- False(0) if empty.

## Example

```c++
RobotisRemoteController rc100(Serial1);
Serial.begin(115200);
rc100.begin();

if(rc100.availableData()) {
  Serial.println("Data received.");
}
```
