---
layout: popup
---

# begin

## Description

Initialization function to start communication via serial port for Remote Controller.

## Syntax

- begin(baud)

## Parameters

- **baud** : The communication speed to set the serial port (Communication device buadrate) (default : 57600)

## Returns

- None

## Example

```c++
RobotisRemoteController rc100(Serial1);
rc100.begin();
```
