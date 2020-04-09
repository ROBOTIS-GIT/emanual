---
layout: popup
---

# readEvent

## Description

Collect event message at the serial port.

## Syntax

- readEvent()

## Parameters

- None

## Returns

- Return received event message. Data type : unsigned int16

## Example

```c++
RobotisRemoteController rc100(Serial1);
Serial.begin(115200);
rc100.begin();

if(rc100.availableEvent()) {
  Serial.println(rc100.readEvent());
}
```
