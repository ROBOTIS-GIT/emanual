---
layout: archive
lang: en
ref: api_reference_data_types
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_easy_sdk/api_reference_data_types/
tabs: "Languages"
tab_title1: Python
tab_title2: C++
sidebar:
  title: DYNAMIXEL Easy SDK
  nav: "dynamixel_easy_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="data-types-reference">Data Types Reference</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
  h2::before {
    content: none !important;
  }
</style>

- Data types module defines various data structures and enumerations used in the DYNAMIXEL Easy SDK.

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

## Data Classes

**ControlTableItem**

| Attribute | Value Type  |
| ----------| ----------- |
| address   | Int         |
| size      | Int         |

**StagedCommand**

| Attribute                 | Value Type                     |
| --------------------------| -------------------------------|
| command_type              | CommandType                    |
| id                        | Int                            |
| address                   | Int                            |
| length                    | Int                            |
| data                      | List[Int]                      |
| status_request            | List[StatusRequest] or None    |
| motor                     | Motor or None                  |
| allowable_operation_modes | List[OperationMode] or None    |


## Enum Classes

**OperatingMode**

| Member                 | Value              |
| -----------------------|--------------------|
| CURRENT                | 0                  |
| VELOCITY               | 1                  |
| POSITION               | 3                  |
| EXTENDED_POSITION      | 4                  |
| CURRENT_BASED_POSITION | 5                  |
| PWM                    | 16                 |

**Direction**

| Member    | Value  |
| --------- | ------ |
| NORMAL    | 0      |
| REVERSE   | 1      |

**ProfileConfiguration**

| Member            | Value  |
| ------------------| ------ |
| VELOCITY_BASED    | 0      |
| TIME_BASED        | 1      |

**CommandType**

| Member            | Value  |
| ------------------| ------ |
| WRITE             | 0      |
| READ              | 1      |

**StatusRequest**

| Member              | Value  |
| --------------------| ------ |
|CHECK_TORQUE_ON      | 1      |
|CHECK_OPERATING_MODE | 2      |
|UPDATE_TORQUE_STATUS | 3      |

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">

## Structures

**ControlTableItem**

| Attribute | Value Type  |
| ----------| ----------- |
| address   | uint16_t    |
| size      | uint8_t     |

**StagedCommand**

| Attribute                 | Value Type                     |
| --------------------------| -------------------------------|
| command_type              | CommandType                    |
| id                        | uint8_t                        |
| address                   | uint16_t                       |
| length                    | uint16_t                       |
| data                      | vector<uint8_t>                |
| status_request            | vector<StatusRequest>          |
| motor                     | * Motor                        |
| allowable_operation_modes | vector<OperationMode>          |

## Enum Classes

**OperatingMode**

| Member                 | Value              |
| -----------------------|--------------------|
| CURRENT                | 0                  |
| VELOCITY               | 1                  |
| POSITION               | 3                  |
| EXTENDED_POSITION      | 4                  |
| CURRENT_BASED_POSITION | 5                  |
| PWM                    | 16                 |

**Direction**

| Member    | Value  |
| --------- | ------ |
| NORMAL    | 0      |
| REVERSE   | 1      |

**ProfileConfiguration**

| Member            | Value  |
| ------------------| ------ |
| VELOCITY_BASED    | 0      |
| TIME_BASED        | 1      |

**CommandType**

| Member            | Value  |
| ------------------| ------ |
| WRITE             | 0      |
| READ              | 1      |

**StatusRequest**

| Member              | Value  |
| --------------------| ------ |
|CHECK_TORQUE_ON      | 1      |
|CHECK_OPERATING_MODE | 2      |
|UPDATE_TORQUE_STATUS | 3      |

</section>

