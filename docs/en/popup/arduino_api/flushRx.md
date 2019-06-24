---
layout: popup
---

# flushRx

## Description

This function clears Serial RX buffer

## Syntax

- flushRx()

## Parameters

- None

## Returns

- None

## Example

```c++
RobotisRemoteController rc100(Serial1);
rc100.begin();
rc100.flushRx();
```
