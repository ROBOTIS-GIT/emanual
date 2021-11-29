<!-- 

### [Configuring DYNAMIXEL Channel](#configuring-dynamixel-channel)

To use ROBOTIS [software](/docs/en/software/#roboplus-r) with DYNAMIXEL-X series on OpenCM 9.04 or OpenCM485 EXP board with OpenCM9.04, [Configuring DYNAMIXEL Channle](#configuring-dynamixel-channel) is required.

### [Configuring DYNAMIXEL Channel](#configuring-dynamixel-channel)

-->


1. Open R+ Manager, and select **OpenCM 9.04** in the **Home** tab.

    ![](/assets/images/sw/rplus2/manager/rplus_manager2_dxl_channel_setting_01.png)

2. Select **Update & Test**.  

    ![](/assets/images/sw/rplus2/manager/rplus_manager2_dxl_channel_setting_02.png)

3. When the control table appears, select an DYNAMIXEL's bus channel on the list of **Dynamixel Channel**. For example, select **EXP Board(X-Series)** to use DYNAMIXEL-X series on the expansion board.
  
    ![](/assets/images/sw/rplus2/manager/rplus_manager2_dxl_channel_setting_03.png)
            
| Item                    | Description                                                                                            |
|:------------------------|:-------------------------------------------------------------------------------------------------------|
| **On Board(XL-320)**    | Uses XL-320 only with the OpenCM 9.04 on a motion tool and a task program                              |
| **EXP Board(X-Series)** | Uses DYNAMIXEL-X series, XL-320 excluded, with the expantion board on a motion tool and a task program |
| **EXP Board(XL-320)**   | Uses XL-320 only with the expantion board on a motion tool and a task program                          |
| **On Board(X-Series)**  | Uses DYNAMIXEL-X series, XL-320 excluded, with the OpenCM 9.04 on a motion tool and a task program     |

> Items of Dynamixel Channle on the control table.

**NOTE**: After setup is complete, restart the OpenCM9.04 or the expansion board to activate DYNAMIXEL's bus channel. Consequently, the DYNAMIXEL with the controller will properly work on the motion tool or with the motion file on the task program.
{: .notice}
