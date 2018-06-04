|2|4|[Model Information](#model-information)          |Model Information                        |R  |-|
|6|1|[Firmware Version](#firmware-version)            |Firmware Version                         |R  |-|
|7|1|[ID](#id)                                        |DYNAMIXEL ID                             |RW |1|
|8|1|[Baud Rate](#baud-rate)                          |Communication Speed                      |RW |1|
|9|1|[Return Delay Time](#return-delay-time)          |Response Delay Time                      |RW |250|
|11|1|[Operating Mode](#operating-mode)               |Operating Mode                           |RW |3|
|13|4|[Homing Offset](#homing-offset)                 |Home Position Offset                     |RW |0|
|17|4|[Moving Threshold](#moving-threshold)           |Velocity Threshold for Movement Detection|RW |50|
|21|1|[Temperature Limit](#temperature-limit)         |Maximum Internal Temperature Limit       |RW |80|
|22|2|[Max Voltage Limit](#max-voltage-limit)         |Maximum Input Voltage Limit              |RW |400|
|24|2|[Min Voltage Limit](#min-voltage-limit)         |Minimum Input Voltage Limit              |RW |150|
|26|4|[Acceleration Limit](#acceleration-limit)       |Maximum Accleration Limit                |RW |-|
|30|2|[Torque Limit](#torque-limit)                   |Maximum Torque Limit                     |RW |-|
|32|4|[Velocity Limit](#velocity-limit)               |Maximum Velocity Limit                   |RW |-|
|36|4|[Max Position Limit](#max-position-limit)       |Maximum Position Limit                   |RW |-|
|40|4|[Min Position Limit](#min-position-limit)       |Minimum Position Limit                   |RW |-|
|44|1|[External Port Mode 1](#external-port-mode)     |External Port Mode 1                     |RW |0|
|45|1|[External Port Mode 2](#external-port-mode)     |External Port Mode 2                     |RW |0|
|46|1|[External Port Mode 3](#external-port-mode)     |External Port Mode 3                     |RW |0|
|47|1|[External Port Mode 4](#external-port-mode)     |External Port Mode 4                     |RW |0|
|48|1|[Shutdown](#shutdown)                           |Shutdown Error Information               |RW |58|
|49|2|[Indirect Address 1](#indirect-address)         |Indirect Address 1                       |RW |634|
|51|2|[Indirect Address 2](#indirect-address)         |Indirect Address 2                       |RW |635|
|53|2|[Indirect Address 3](#indirect-address)         |Indirect Address 3                       |RW |636|
|...|2|[Indirect Address N](#indirect-address)        |Indirect Address N                       |RW |...|
|559|2|[Indirect Address 256](#indirect-address)      |Indirect Address 256                     |RW |889|


## [Control Table of RAM Area](#control-table-of-ram-area)

| Address     | Size(Byte)     | Data Name     | Description     | Access     | Initial Value     |
| :------------- | :------------- | :------------- | :------------- | :------------- | :------------- |
|562|1|[Torque Enable](#torque-enable)              |Motor Torque On/Off                        |RW |0|
|563|1|[LED Red](#led-red)                          |Red LED Intensity Value                    |RW |0|
|564|1|[LED Green](#led-green)                      |Green LED Intensity Value                  |RW |0|
|565|1|[LED Blue](#led-blue)                        |Blue LED Intensity Value                   |RW |0|
|586|2|[Velocity I Gain](#velocity-i-gain)          |I Gain of Velocity                         |RW |-|
|588|2|[Velocity P Gain](#velocity-p-gain)          |P Gain of Velocity                         |RW |-|
|594|2|[Position P Gain](#position-p-gain)          |P Gain of Position                         |RW |-|
|596|4|[Goal Position](#goal-position)              |Desired Position Value                      |RW |-|
|600|4|[Goal Velocity](#goal-velocity)              |Desired Velocity Value                      |RW |0|
|604|2|[Goal Torque](#goal-torque)                  |Desired Current Value                       |RW |0|
|606|4|[Goal Acceleration](#goal-acceleration)      |Desired Acceleration Value                  |RW |0|
|610|1|[Moving](#moving)                            |Movement Status                            |R  |-|
|611|4|[Present Position](#present-position)        |Present Position Value                     |R  |-|
|615|4|[Present Velocity](#present-velocity)        |Present Velocity Value                     |R  |-|
|621|2|[Present Current](#present-current)          |Present Current Value                      |R  |-|
|623|2|[Present Input Voltage](#present-input-voltage)|Present Input Voltage                    |R  |-|
|625|1|[Present Temperature](#present-temperature)    |Present Internal Temperature             |R  |-|
|626|2|[External Port Data 1](#external-port-data)  |External Port Data 1                       |R/RW|0|
|628|2|[External Port Data 2](#external-port-data)  |External Port Data 2                       |R/RW|0|
|630|2|[External Port Data 3](#external-port-data)  |External Port Data 3                       |R/RW|0|
|632|2|[External Port Data 4](#external-port-data)  |External Port Data 4                       |R/RW|0|
|634|1|[Indirect Data 1](#indirect-data)            |Indirect Data 1                            |RW |0|
|635|1|[Indirect Data 2](#indirect-data)            |Indirect Data 2                            |RW |0|
|636|1|[Indirect Data 3](#indirect-data)            |Indirect Data 3                            |RW |0|
|...|1|[Indirect Data N](#indirect-data)            |Indirect Data N                            |RW |0|
|889|1|[Indirect Data 256](#indirect-data)          |Indirect Data 256                          |RW |0|
|890|1|[Registered Instruction](#registered-instruction)|Check Reception of Instruction         |R  |0|
|891|1|[Status Return Level](#status-return-level)   |Select Types of Status Return             |RW |2|
|892|1|[Hardware Error Status](#hardware-error-status)  |Hardware Error Status                  |R  |0|
