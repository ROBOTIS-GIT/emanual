---
layout: archive
lang: en
ref: api_reference_group_executor
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_easy_sdk/api_reference_group_executor/
tabs: "Languages"
tab_title1: Python
tab_title2: C++
sidebar:
  title: DYNAMIXEL Easy SDK
  nav: "dynamixel_easy_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="group-executor-reference">GroupExecutor Class Reference</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

- GroupExecutor class manages Sync/Bulk operations for multiple DYNAMIXEL motors, allowing efficient communication by staging commands and executing them in groups.

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

**GroupExecutor Class**

| Method                                                 | Return Type          | Description                                                           |
| -------------------------------------------------------| ---------------------| ----------------------------------------------------------------------|
| GroupExecutor(connector: Connector)                    | -                    | Initializes the GroupExecutor.                                        |
| addCmd(self, command: StagedCommand)                   | -                    | Adds a command to the execution queue.                                |
| clearStagedWriteCommands()                             | -                    | Clears all staged write commands.                                     |
| clearStagedReadCommands()                              | -                    | Clears all staged read commands.                                      |
| executeWrite()                                         | -                    | Executes the write commands in the queue.                            |
| executeRead()                                          | -                    | Executes the read commands in the queue.                             |

**Variables**

| Variable               | Type                | Attribute | Description                                   |
| ---------------------- | --------------------|-----------|-----------------------------------------------|
| connector              | Connector           | instance  | Connector instance.                           |
| port_handler           | PortHandler         | instance  | PortHandler instance.                         |
| packet_handler         | PacketHandler       | instance  | PacketHandler instance.                       |
| group_bulk_write       | GroupBulkWrite      | instance  | GroupBulkWrite instance.                      |
| group_bulk_read        | GroupBulkRead       | instance  | GroupBulkRead instance.                       |
| _staged_write_commands | List[StagedCommand] | instance  | List of staged write commands.                |
| _staged_read_commands  | List[StagedCommand] | instance  | List of staged read commands.                 |

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">

**GroupExecutor Class**

| Method                                                 | Return Type          | Description                                   |
| -------------------------------------------------------| ---------------------| --------------------------------------------- |
| GroupExecutor(Connector * connector)                   | -                    | Initializes the GroupExecutor.                |
| addCmd(StagedCommand command)                          | -                    | Adds a command to the execution queue.        |
| getStagedWriteCommands()                               | vector<StagedCommand> | Returns the list of staged write commands.   |
| getStagedReadCommands()                                | vector<StagedCommand> | Returns the list of staged read commands.    |
| clearStagedWriteCommands()                             | -                    | Clears all staged write commands.             |
| clearStagedReadCommands()                              | -                    | Clears all staged read commands.              |
| executeWrite()                                         | -                    | Executes the write commands in the queue.     |
| executeRead()                                          | -                    | Executes the read commands in the queue.      |

**Variables**

| Variable               | Type                  | Attribute                                   | Description                                   |
| ---------------------- | --------------------- |-----------------------------------------------|-----------------------------------------------|
| connector_             | Connector             | Private                                       | Connector instance.                           |
| port_handler_          | PortHandler           | Private                                       | PortHandler instance.                         |
| packet_handler_        | PacketHandler         | Private                                       | PacketHandler instance.                       |
| group_bulk_write_      | GroupBulkWrite        | Private                                       | GroupBulkWrite instance.                      |
| group_bulk_read_       | GroupBulkRead         | Private                                       | GroupBulkRead instance.                       |
| staged_write_commands_ | vector<StagedCommand> | Private                                       | List of staged write commands.                |
| staged_read_commands_  | vector<StagedCommand> | Private                                       | List of staged read commands.                 |

</section>
