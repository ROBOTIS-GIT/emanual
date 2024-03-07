<style>

     .heatMap th {
        background: #f2f3f3;
        word-wrap: break-word;

    }   
    .heatMap tr:nth-child(1) { background: #fef1e9; }
    .heatMap tr:nth-child(2) { background: #deebf6; }
    .heatMap tr:nth-child(3) { background: #e2efd9; }
</style>

<div class="heatMap">

| 주소 | 크기(Byte) | 명칭                                                                    | 접근 | 기본값 | 범위                    | 단위               |
| :--: |:--------: | :---------------------------------------------------------------------- | :--: |:----: | :---------------------: | :---------------: |
| 0    | 2         | [Model Number](#model-number)                                           | R    | 4,000 | -                       | -                 |
| 2    | 4         | [Model Information](#model-information)                                 | R    | -     | -                       | -                 |
| 6    | 1         | [Firmware Version](#firmware-version)                                   | R    | -     | -                       | -                 |
| 7    | 1         | [ID](#id)                                                               | RW   | 1     | -                       | -                 |
| 8    | 1         | [Bus Watchdog](#bus-watchdog)                                           | RW   | 0     | -                       | -                 |
| 10   | 1         | [Secondary(Shadow) ID](#secondaryshadow-id)                             | RW   | 255   | -                       | -                 |
| 11   | 1         | [Protocol Type](#protocol-type)                                         | RW   | 2     | -                       | -                 |
| 12   | 1         | [Baud Rate (Bus)](#baud-rate-bus)                                       | RW   | 1     | -                       | -                 |
| 13   | 1         | [Return Delay Time](#return-delay-time)                                 | RW   | 250   | -                       | -                 |
| 15   | 1         | [Status Return Level](#status-return-level)                             | RW   | 2     | -                       | -                 |
| 16   | 1         | [Registered Instruction](#registered-instruction)                       | R    | 0     | -                       | -                 |
| 32   | 1         | [Drive Mode](#drive-mode)                                               | RW   | 0     | -                       | -                 |
| 33   | 1         | [Operating Mode](#operating-mode)                                       | RW   | 3     | -                       | -                 |
| 34   | 1         | [Startup Configuration](#startup-configuration)                         | RW   | 0     | -                       | -                 |
| 38   | 1         | [Position Limit Threshold](#position-limit-threshold)                   | RW   | 0     | -                       | -                 |
| 40   | 1         | [In-Position Threshold](#in-position-threshold)                         | RW   | 0     | -                       | -                 |
| 44   | 1         | [Following Error Threshold](#following-error-threshold)                 | RW   | 0     | -                       | -                 |
| 48   | 4         | [Moving Threshold](#moving-threshold)                                   | RW   | -     | -                       | -                 |
| 52   | 4         | [Homing Offset](#homing-offset)                                         | RW   | -     | -                       | -                 |
| 56   | 4         | [Inverter Temperature Limit](#inverter-temperature-limit)               | RW   | -     | -                       | -                 |
| 57   | 2         | [Motor Temperature Limit](#motor-temperature-limit)                     | RW   | -     | -                       | -                 |
| 60   | 2         | [Max Voltage Limit](#max-voltage-limit)                                 | RW   | -     | -                       | -                 |
| 62   | 4         | [Min Voltage Limit](#min-voltage-limit)                                 | RW   | -     | -                       | -                 |
| 64   | 2         | [PWM Limit](#pwm-limit)                                                 | RW   | -     | -                       | -                 |
| 66   | 2         | [Current Limit](#current-limit)                                         | RW   | -     | -                       | -                 |
| 68   | 4         | [Acceleration Limit](#acceleration-limit)                               | RW   | -     | -                       | -                 |
| 72   | 4         | [Velocity Limit](#velocity-limit)                                       | RW   | -     | -                       | -                 |
| 76   | 4         | [Max Position Limit](#max-position-limit)                               | RW   | -     | -                       | -                 |
| 84   | 4         | [Min Position Limit](#min-position-limit)                               | RW   | -     | -                       | -                 |
| 96   | 4         | [Electronic GearRatio Numerator](#electronic-gearratio-numerator)       | RW   | -     | -                       | -                 |
| 100  | 4         | [Electronic GearRatio Denominator](#electronic-gearratio-denominator)   | RW   | -     | -                       | -                 |
| 104  | 2         | [Safe Stop Time](#safe-stop-time)                                       | RW   | -     | -                       | -                 |
| 106  | 2         | [Brake Delay](#brake-delay)                                             | RW   | -     | -                       | -                 |
| 108  | 2         | [Goal Update Delay](#goal-update-delay)                                 | RW   | -     | -                       | -                 |
| 110  | 1         | [Overexcitation Voltage](#overexcitation-voltage)                       | RW   | -     | -                       | -                 |
| 111  | 1         | [Normal Excitation Voltage](#normal-excitation-voltage)                 | RW   | -     | -                       | -                 |
| 102  | 2         | [Overexcitation Time](#overexcitation-time)                             | RW   | -     | -                       | -                 |
| 126  | 24        | [Notch Filter Frequency](#notch-filter-frequency)                       | RW   | -     | -                       | -                 |
| 128  | 2         | [Notch Filter Bandwidth](#notch-filter-bandwidth)                       | RW   | -     | -                       | -                 |
| 130  | 2         | [Notch Filter Depth](#notch-filter-depth)                               | RW   | -     | -                       | -                 |
| 132  | 2         | [Present Velocity LPF Frequency](#present-velocity-lpf-frequency)       | RW   | -     | -                       | -                 |
| 134  | 2         | [Goal Current LPF Frequency](#goal-current-lpf-frequency)               | RW   | -     | -                       | -                 |
| 136  | 2         | [Position FF LPF Time](#position-ff-lpf-time)                           | RW   | -     | -                       | -                 |
| 138  | 2         | [Velocity FF LPF Time](#velocity-ff-lpf-time)                           | RW   | -     | -                       | -                 |
| 152  | 1         | [Control State](#control-state)                                         | R    | -     | -                       | -                 |
| 153  | 1         | [Error Code](#error-code)                                               | R    | -     | -                       | -                 |
| 154  | 1         | [Error Code History 1](#error-code-history1)                            | R    | -     | -                       | -                 |
| 155  | 1         | [Error Code History 2](#error-code-history2)                            | R    | -     | -                       | -                 |
| ...  | ...       | ...                                                                     | ...  | ...   | ...                     | ...               |
| 168  | 1         | [Error Code History 15](#error-code-history15)                          | R    | -     | -                       | -                 |
| 169  | 1         | [Error Code History 16](#error-code-history16)                          | R    | -     | -                       | -                 |
| 170  | 1         | [Gain Save](#gain-save)                                                 | RW   | -     | -                       | -                 |
| 212  | 4         | [Velocity I Gain](#velocity-i-gain)                                     | RW   | -     | -                       | -                 |
| 216  | 4         | [Velocity P Gain](#velocity-p-gain)                                     | RW   | -     | -                       | -                 |
| 220  | 4         | [Velocity FF Gain](#velocity-ff-gain)                                   | RW   | -     | -                       | -                 |
| 224  | 4         | [Position D Gain](#position-d-gain)                                     | RW   | -     | -                       | -                 |
| 228  | 4         | [Position I Gain](#position-i-gain)                                     | RW   | -     | -                       | -                 |
| 232  | 4         | [Position P Gain](#position-p-gain)                                     | RW   | -     | -                       | -                 |
| 236  | 4         | [Position FF Gain](#position-ff-gain)                                   | RW   | -     | -                       | -                 |
| 240  | 4         | [Profile Acceleration](#profile-acceleration)                           | RW   | -     | -                       | -                 |
| 244  | 4         | [Profile Velocity](#profile-velocity)                                   | RW   | -     | -                       | -                 |
| 248  | 4         | [Profile Acceleration Time](#profile-acceleration-time)                 | RW   | -     | -                       | -                 |
| 252  | 4         | [Profile Time](#profile-time)                                           | RW   | -     | -                       | -                 |
| 256  | 2         | [Indirect Address 1](#indirect-address1)                                | RW   | -     | -                       | -                 |
| 258  | 2         | [Indirect Address 2](#indirect-address2)                                | RW   | -     | -                       | -                 |
| ...  | ...       | ...                                                                     | ...  | ...   | ...                     | ...               |
| 509  | 2         | [Indirect Address 127](#indirect-address127)                            | RW   | -     | -                       | -                 |
| 510  | 2         | [Indirect Address 128](#indirect-address128)                            | RW   | -     | -                       | -                 |
| 512  | 1         | [Torque Enable](#torque-enable)                                         | RW   | -     | -                       | -                 |
| 513  | 1         | [LED](#led)                                                             | RW   | -     | -                       | -                 |
| 516  | 2         | [PWM Offset](#pwm-offset)                                               | RW   | -     | -                       | -                 |
| 518  | 2         | [Current Offset](#current-offset)                                       | RW   | -     | -                       | -                 |
| 520  | 2         | [Velocity Offset](#velocity-offset)                                     | RW   | -     | -                       | -                 |
| 524  | 4         | [Goal PWM](#goal-pwm)                                                   | RW   | -     | -                       | -                 |
| 526  | 4         | [Goal Current](#goal-current)                                           | RW   | -     | -                       | -                 |
| 528  | 4         | [Goal Velocity](#goal-velocity)                                         | RW   | -     | -                       | -                 |
| 532  | 4         | [Goal Position](#goal-position)                                         | RW   | -     | -                       | -                 |
| 541  | 1         | [Moving Status](#moving-status)                                         | R    | -     | -                       | -                 |
| 542  | 2         | [Realtime Tick](#realtime-tick)                                         | R    | -     | -                       | -                 |
| 544  | 2         | [Present PWM](#present-pwm)                                             | R    | -     | -                       | -                 |
| 546  | 2         | [Present Current](#present-current)                                     | R    | -     | -                       | -                 |
| 548  | 4         | [Present Velocity](#present-velocity)                                   | R    | -     | -                       | -                 |
| 552  | 4         | [Present Position](#present-position)                                   | R    | -     | -                       | -                 |
| 560  | 4         | [Position Trajectory](#position-trajectory)                             | R    | -     | -                       | -                 |
| 564  | 4         | [Velocity Trajectory](#velocity-trajectory)                             | R    | -     | -                       | -                 |
| 568  | 2         | [Present Input Voltage](#present-input-voltage)                         | R    | -     | -                       | -                 |
| 570  | 1         | [Present Inverter Temperature](#present-inverter-temperature)           | R    | -     | -                       | -                 |
| 571  | 1         | [Present Motor Temperature](#present-motor-temperature)                 | R    | -     | -                       | -                 |
| 634  | 1         | [Indirect Data 1](#indirect-data1)                                      | RW   | -     | -                       | -                 |
| 635  | 1         | [Indirect Data 2](#indirect-data2)                                      | RW   | -     | -                       | -                 |
| ...  | ...       | ...                                                                     | ...  | ...   | ...                     | ...               |
| 760  | 1         | [Indirect Data 127](#indirect-data127)                                  | RW   | -     | -                       | -                 |
| 761  | 1         | [Indirect Data 128](#indirect-data128)                                  | RW   | -     | -                       | -                 |
| 919  | 1         | [Backup Ready](#backup-ready)                                           | R    | -     | -                       | -                 |


</div>