---
layout: archive
lang: en
ref: python_porthandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/python/python_porthandler/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 6"></div>
<div style="counter-reset: h2 4"></div>
<div style="counter-reset: h3 0"></div>

<!--[dummy Header 1]>
  <h1 id="api-reference"><a href="#api-reference">API Reference</a></h1>
  <h2 id="python"><a href="#python">Python</a></h2>
<![end dummy Header 1]-->

### [Python PortHandler](#python-porthandler)

- Description

Base class for serial communication.

- Members

| Members             | Description                      |
|:--------------------|:---------------------------------|
| DEFAULT\_BAUDRATE\_ | :=1000000	Default Baudrate        |
| is\_using\_         | Shows whether the port is in-use |


- Methods

| Methods                                     | Description                                                |
|:--------------------------------------------|:-----------------------------------------------------------|
| **[PortHandler](#porthandler)**              | Initializes parameters for serial port control             |
| **[openPort](#openport)**                   | Opens a serial port                                        |
| **[closePort](#closeport)**                 | Closes a serial port                                       |
| **[clearPort](#clearport)**                 | Refreshes a serial port                                    |
| **[setPortName](#setportname)**             | Sets a device name                                         |
| **[getPortName](#getportname)**             | Gets a device name                                         |
| **[setBaudrate](#setbaudrate)**             | Sets a baudrate                                            |
| **[getBaudrate](#getbaudrate)**             | Gets a baudrate                                            |
| **[getBytesAvailable](#getbytesavailable)** | Checks how many bytes can be read in port buffer           |
| **[readPort](#readport)**                   | Reads bytes from port buffer                               |
| **[writePort](#writeport)**                 | Writes bytes to port buffer                                |
| **[setPacketTimeout](#setpackettimeout)**   | Sets timeout                                               |
| **[isPacketTimeout](#ispackettimeout)**     | Checks whether communication has been succeeded in timeout |


- Enumerator

   None



#### Method References

##### PortHandler
- Syntax
``` python
PortHandler(port_name)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_name  | Port name   |

- Detailed Description

   The function initializes the parameters for port control.

##### openPort
- Syntax
``` python
openPort()
```
- Parameters

None

- Detailed Description

   This function opens the port by `setBaudRate` function using default baudrate(1M). If the baudrate is needed to be changed to another baudrate value, `setBaudRate` function should be called again after calling `openPort` function. When the port succeeds to be opened, this function will return true, and if not, then false.


##### closePort
- Syntax
``` python
closePort()
```
- Parameters

None

- Detailed Description

  This function closes the port.


##### clearPort
- Syntax
``` python
clearPort()
```
- Parameters

None

- Detailed Description

  This function clears the port.


##### setPortName
- Syntax
``` python
setPortName(port_name)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_name  | Port name   |

- Detailed Description

  This function sets the device name as port_name.


##### getPortName
- Syntax
``` python
getPortName()
```
- Parameters

None

- Detailed Description

  This function returns the device name which the port is using.


##### setBaudrate
- Syntax

``` python
setBaudrate(baudrate)
```

- Parameters

| Parameters | Description     |
|:-----------|:----------------|
| baudrate   | Target baudrate |


- Description

  This function checks whether the baudrate is available in selected operating system at first. If the baudrate is not available, it returns -1.


##### getBaudrate
- Syntax

``` python
getBaudrate()
```

- Parameters

None

- Description

  This function returns the baudrate value previously set.  


##### getBytesAvailable
- Syntax

``` python
getBytesAvailable()
```

- Parameters

None

- Description

  This function checks how much the data can be read, and returns its length.


##### readPort
- Syntax

``` python
readPort(length)
```

- Parameters

| Parameters | Description                              |
|:-----------|:-----------------------------------------|
| length     | Byte length for read                     |


- Description

  This function gets the byte data from port buffer and returns the byte data.


##### writePort
- Syntax

``` python
 writePort(packet)
```

- Parameters

| Parameters | Description                       |
|:-----------|:----------------------------------|
| packet     | The number of data bytes to write |
| length     | Byte length for write             |



- Description

  This function transmits byte data, and returns how much the data was written.


##### setPacketTimeout
- Syntax

``` python
setPacketTimeout(packet_length)
```

- Parameters
| Parameters    | Description                  |
|:--------------|:-----------------------------|
| Packet_length | Target byte length for write |


- Description

  This function sets the start time when it transmits the packet, and set the timeout of packet transmission to be ready for deciding communication result.


##### setPacketTimeoutMillis
- Syntax

``` python
setPacketTimeoutMillis(msec)
```

- Parameters

| Parameters | Description |
|:-----------|:------------|
| msec       | Miliseconds |


- Description

  This function sets the start time with `msec` milisecond value when it transmits the packet, and set the timeout of packet transmission to be ready for deciding communication result.

##### isPacketTimeout
- Syntax

``` python
isPacketTimeout()
```

- Parameters

None

- Description

  This function decides the timeover of packet communication. If the time limit is over, it returns false.
