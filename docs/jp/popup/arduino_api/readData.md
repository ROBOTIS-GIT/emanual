---
layout: popup
---

# readData

## Description

Collect received data at the serial port.

## Syntax

- readData()

## Parameters

- None

## Returns

- Return received data. Data type : unsigned int16

## Example

```c++
RobotisRemoteController rc100(Serial1);
Serial.begin(115200);
rc100.begin();

if(rc100.availableData()) {
  Serial.println(rc100.readData());
}
```
