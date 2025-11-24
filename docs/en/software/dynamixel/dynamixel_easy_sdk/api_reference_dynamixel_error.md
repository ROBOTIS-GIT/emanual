---
layout: archive
lang: en
ref: api_reference_dynamixel_error
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_easy_sdk/api_reference_dynamixel_error/
tabs: "Languages"
tab_title1: Python
tab_title2: C++
sidebar:
  title: DYNAMIXEL Easy SDK
  nav: "dynamixel_easy_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="dynamixel-error-reference">Dynamixel Error Reference</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
  h2::before {
    content: none !important;
  }
</style>

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

- Dynamixel error module defines error codes, exception classes, and utility functions for handling errors in the DYNAMIXEL Easy SDK.

## Exception Class

**DxlRuntimeError**

| Method                               | Description                                     |
| -------------------------------------| ----------------------------------------------- |
| DxlRuntimeError(dxl_error: DxlError) | Initializes the DxlRuntimeError with a DxlError.|
| DxlRuntimeError(msg: str)            | Initializes the DxlRuntimeError with a message. |

## Enum Class

**DxlError**

| Enum Member                       | Value |
| ----------------------------------|-------|
| SDK_COMM_SUCCESS                  | 0     |
| SDK_COMM_PORT_BUSY                | -1000 |
| SDK_COMM_TX_FAIL                  | -1001 |
| SDK_COMM_RX_FAIL                  | -1002 |
| SDK_COMM_TX_ERROR                 | -2000 |
| SDK_COMM_RX_WAITING               | -3000 |
| SDK_COMM_RX_TIMEOUT               | -3001 |
| SDK_COMM_RX_CORRUPT               | -3002 |
| SDK_COMM_NOT_AVAILABLE            | -9000 |
| SDK_ERRNUM_RESULT_FAIL            | 1     |
| SDK_ERRNUM_INSTRUCTION            | 2     |
| SDK_ERRNUM_CRC                    | 3     |
| SDK_ERRNUM_DATA_RANGE             | 4     |
| SDK_ERRNUM_DATA_LENGTH            | 5     |
| SDK_ERRNUM_DATA_LIMIT             | 6     |
| SDK_ERRNUM_ACCESS                 | 7     |
| EASY_SDK_FUNCTION_NOT_SUPPORTED   | 11    |
| EASY_SDK_TORQUE_STATUS_MISMATCH   | 12    |
| EASY_SDK_OPERATING_MODE_MISMATCH  | 13    |
| EASY_SDK_ADD_PARAM_FAIL           | 21    |
| EASY_SDK_COMMAND_IS_EMPTY         | 22    |
| EASY_SDK_DUPLICATE_ID             | 23    |
| EASY_SDK_FAIL_TO_GET_DATA         | 24    |

## Module Function

**getErrorMessage(dxl_error)**
- Returns the error message corresponding to the given DxlError.

| Parameter                                  | Return Message                                                         |
| ------------------------------------------ | ---------------------------------------------------------------------- |
| DxlError.SDK_COMM_SUCCESS                  | [TxRxResult] Communication success!                                    |
| DxlError.SDK_COMM_PORT_BUSY                | [TxRxResult] Port is in use!                                           |
| DxlError.SDK_COMM_TX_FAIL                  | [TxRxResult] Failed to transmit instruction packet                     |
| DxlError.SDK_COMM_RX_FAIL                  | [TxRxResult] Failed to get status packet from device                   |
| DxlError.SDK_COMM_TX_ERROR                 | [TxRxResult] Incorrect instruction packet                              |
| DxlError.SDK_COMM_RX_WAITING               | [TxRxResult] Receiving status packet                                   |
| DxlError.SDK_COMM_RX_TIMEOUT               | [TxRxResult] No status packet received                                 |
| DxlError.SDK_COMM_RX_CORRUPT               | [TxRxResult] Incorrect status packet                                   |
| DxlError.SDK_COMM_NOT_AVAILABLE            | [TxRxResult] Protocol does not support this function                   |
| DxlError.SDK_ERRNUM_RESULT_FAIL            | [RxPacketError] Failed to process the instruction packet!              |
| DxlError.SDK_ERRNUM_INSTRUCTION            | [RxPacketError] Undefined instruction or incorrect instruction!        |
| DxlError.SDK_ERRNUM_CRC                    | [RxPacketError] CRC doesn't match!                                     |
| DxlError.SDK_ERRNUM_DATA_RANGE             | [RxPacketError] The data value is out of range!                        |
| DxlError.SDK_ERRNUM_DATA_LENGTH            | [RxPacketError] The data length does not match as expected!            |
| DxlError.SDK_ERRNUM_DATA_LIMIT             | [RxPacketError] The data value exceeds the limit value!                |
| DxlError.SDK_ERRNUM_ACCESS                 | [RxPacketError] Writing or Reading is not available to target address! |
| DxlError.EASY_SDK_FUNCTION_NOT_SUPPORTED   | [EasySDKUsageError] Function not supported                             |
| DxlError.EASY_SDK_TORQUE_STATUS_MISMATCH   | [EasySDKUsageError] Motor torque status mismatch                       |
| DxlError.EASY_SDK_OPERATING_MODE_MISMATCH  | [EasySDKUsageError] Operating mode mismatch                            |
| DxlError.EASY_SDK_ADD_PARAM_FAIL           | [EasySDKUsageError] Failed to add parameter                            |
| DxlError.EASY_SDK_COMMAND_IS_EMPTY         | [EasySDKUsageError] No command to execute                              |
| DxlError.EASY_SDK_DUPLICATE_ID             | [EasySDKUsageError] Duplicate ID in staged commands                    |
| DxlError.EASY_SDK_FAIL_TO_GET_DATA         | [EasySDKUsageError] Failed to get data from motor                      |

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">

## Exception Class

**DxlRuntimeError**

| Method                                       | Description                                     |
| -------------------------------------------- | ----------------------------------------------- |
| DxlRuntimeError(const std::string & message) | Initializes the DxlRuntimeError with a message. |

## Result Class

**Result<T, E>**

| Method                                   | Description                                               |
| ---------------------------------------- | --------------------------------------------------------- |
| isSuccess() const                        | Returns true if the result has no error, false otherwise. |
| value() const                            | Returns the value if the result is success.               |
| error() const                            | Returns the error if the result is failure.               |

## Enum Class

**DxlError**

| Enum Member                       | Value |
| ----------------------------------|-------|
| SDK_COMM_SUCCESS                  | 0     |
| SDK_COMM_PORT_BUSY                | -1000 |
| SDK_COMM_TX_FAIL                  | -1001 |
| SDK_COMM_RX_FAIL                  | -1002 |
| SDK_COMM_TX_ERROR                 | -2000 |
| SDK_COMM_RX_WAITING               | -3000 |
| SDK_COMM_RX_TIMEOUT               | -3001 |
| SDK_COMM_RX_CORRUPT               | -3002 |
| SDK_COMM_NOT_AVAILABLE            | -9000 |
| SDK_ERRNUM_RESULT_FAIL            | 1     |
| SDK_ERRNUM_INSTRUCTION            | 2     |
| SDK_ERRNUM_CRC                    | 3     |
| SDK_ERRNUM_DATA_RANGE             | 4     |
| SDK_ERRNUM_DATA_LENGTH            | 5     |
| SDK_ERRNUM_DATA_LIMIT             | 6     |
| SDK_ERRNUM_ACCESS                 | 7     |
| EASY_SDK_FUNCTION_NOT_SUPPORTED   | 11    |
| EASY_SDK_TORQUE_STATUS_MISMATCH   | 12    |
| EASY_SDK_OPERATING_MODE_MISMATCH  | 13    |
| EASY_SDK_ADD_PARAM_FAIL           | 21    |
| EASY_SDK_COMMAND_IS_EMPTY         | 22    |
| EASY_SDK_DUPLICATE_ID             | 23    |
| EASY_SDK_FAIL_TO_GET_DATA         | 24    |

## Module Function

**getErrorMessage(dxl_error)**
- Returns the error message corresponding to the given DxlError.

| Parameter                                  | Return Message                                                         |
| ------------------------------------------ | ---------------------------------------------------------------------- |
| DxlError::SDK_COMM_SUCCESS                  | [TxRxResult] Communication success!                                    |
| DxlError::SDK_COMM_PORT_BUSY                | [TxRxResult] Port is in use!                                           |
| DxlError::SDK_COMM_TX_FAIL                  | [TxRxResult] Failed to transmit instruction packet                     |
| DxlError::SDK_COMM_RX_FAIL                  | [TxRxResult] Failed to get status packet from device                   |
| DxlError::SDK_COMM_TX_ERROR                 | [TxRxResult] Incorrect instruction packet                              |
| DxlError::SDK_COMM_RX_WAITING               | [TxRxResult] Receiving status packet                                   |
| DxlError::SDK_COMM_RX_TIMEOUT               | [TxRxResult] No status packet received                                 |
| DxlError::SDK_COMM_RX_CORRUPT               | [TxRxResult] Incorrect status packet                                   |
| DxlError::SDK_COMM_NOT_AVAILABLE            | [TxRxResult] Protocol does not support this function                   |
| DxlError::SDK_ERRNUM_RESULT_FAIL            | [RxPacketError] Failed to process the instruction packet!              |
| DxlError::SDK_ERRNUM_INSTRUCTION            | [RxPacketError] Undefined instruction or incorrect instruction!        |
| DxlError::SDK_ERRNUM_CRC                    | [RxPacketError] CRC doesn't match!                                     |
| DxlError::SDK_ERRNUM_DATA_RANGE             | [RxPacketError] The data value is out of range!                        |
| DxlError::SDK_ERRNUM_DATA_LENGTH            | [RxPacketError] The data length does not match as expected!            |
| DxlError::SDK_ERRNUM_DATA_LIMIT             | [RxPacketError] The data value exceeds the limit value!                |
| DxlError::SDK_ERRNUM_ACCESS                 | [RxPacketError] Writing or Reading is not available to target address! |
| DxlError::EASY_SDK_FUNCTION_NOT_SUPPORTED   | [EasySDKUsageError] Function not supported                             |
| DxlError::EASY_SDK_TORQUE_STATUS_MISMATCH   | [EasySDKUsageError] Motor torque status mismatch                       |
| DxlError::EASY_SDK_OPERATING_MODE_MISMATCH  | [EasySDKUsageError] Operating mode mismatch                            |
| DxlError::EASY_SDK_ADD_PARAM_FAIL           | [EasySDKUsageError] Failed to add parameter                            |
| DxlError::EASY_SDK_COMMAND_IS_EMPTY         | [EasySDKUsageError] No command to execute                              |
| DxlError::EASY_SDK_DUPLICATE_ID             | [EasySDKUsageError] Duplicate ID in staged commands                    |
| DxlError::EASY_SDK_FAIL_TO_GET_DATA         | [EasySDKUsageError] Failed to get data from motor                      |

</section>

