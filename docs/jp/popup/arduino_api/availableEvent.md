---
layout: popup
---

# availableEvent

## Description

Check if there is a valid received packet.
However, this only works after receiving the release event packet (data: 0).
That is, it checks whether the ROBOTIS Remote Controller button is released and then pressed again.

## Syntax

- availableEvent()

## Parameters

- None

## Returns

- True(1) if valid data is received.
- False(0) otherwise.

## Example

```c++
RobotisRemoteController rc100(Serial1);
Serial.begin(115200);
rc100.begin();

if(rc100.availableEvent()) {
  Serial.println(rc100.readEvent());
}
```
