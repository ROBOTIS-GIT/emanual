## [Using DYNAMIXEL-X](#using-dynamixel-x)

To use ROBOTIS [software](/docs/en/software/#roboplus-r) (R+ Task, R+ Motion 및 R+ Manager) with [DYNAMIXEL-X](/docs/en/dxl/x/#x-series) series, [Configuring DYNAMIXEL Channle](#configuring-dynamixel-channel) is required.

**NOTE**: [Arduino IDE](#arduino-ide) does not require DYNAMIXEL Channel configuration.
{: .notice}

{% if page.ref=='opencm904' %}
**NOTE**: With [OpenCM485 EXP Board](/docs/en/parts/controller/opencm485exp/), DYNAMIXEL-X with 24V and RS485 Communication Port can be used.  
![](/assets/images/sw/rplus2/manager/rplusmanager2_30_kr.jpg)  
{: .notice}

{% capture 904_convertible %}
**NOTE**: If Molex type connectors are soldered on the OpenCM 9.04 (i.e, Type-B or Type-C), use JST-Molex convertable cable in order to wire DYNAMIXEL-X.
- A-Type: Soldering Required. See [Connector Assembly(Type A)](#connector-assemblytype-a)
- B-Type: [Robot Cable-X3P (Convertible)](http://en.robotis.com/shop_en/item.php?it_id=903-0251-000) and [Robot Cable-XL320 (Convertible)](http://en.robotis.com/shop_en/item.php?it_id=903-0291-000)
- C-Type: [Robot Cable-XL320 (Convertible)](http://en.robotis.com/shop_en/item.php?it_id=903-0291-000)
{% endcapture %}

<div class="notice">{{ 904_convertible | markdownify }}</div>

{% else %}

{% capture dxl_jst_molex %}
**NOTE**: DYNAMIXEL-X and P series use a JST connector. To use DYNAMIXEL X and P series with the expansion board, use [Robot Cable-X3P (Convertible)](http://en.robotis.com/shop_en/item.php?it_id=903-0251-000) or [Robot Cable-X4P (Convertible)](http://en.robotis.com/shop_en/item.php?it_id=903-0246-000). 

{% endcapture %}
<div class="notice">{{ dxl_jst_molex | markdownify }}</div>
{% endif %}

### [Configuring DYNAMIXEL Channel](#configuring-dynamixel-channel)

Change DYNAMIXEL Channel's item to use various DYNAMIXEL-X series. 

{% capture keep_904_uptodate %}
**NOTE**: 
- [Keep a version of firmware up-to-date](/docs/en/software/rplus2/manager/#firmware-update).  
- If OpenCM485 board and OpenCM9.04 are connected, make sure to separate it before Firmware Update or Firmware Recovery.
{% endcapture %}
<div class="notice">{{ keep_904_uptodate | markdownify }}</div> 

1. Open R+ Manager, and select **OpenCM 9.04** in the **Home** tab.

    ![](/assets/images/sw/rplus2/manager/rplus_manager2_dxl_channel_setting_01.png)

2. Select **Update & Test**.  

    ![](/assets/images/sw/rplus2/manager/rplus_manager2_dxl_channel_setting_02.png)

3. When the control table appears, select an DYNAMIXEL's bus channel on the list of **Dynamixel Channel**. For example, select **EXP Board(X-Series)** to use DYNAMIXEL-X series on the expansion board.
  
    ![](/assets/images/sw/rplus2/manager/rplus_manager2_dxl_channel_setting_03.png)
            
  | Item                    | Description                                                                                                    |
  |:------------------------|:---------------------------------------------------------------------------------------------------------------|
  | **On Board(XL-320)**    | Uses XL-320 only with the OpenCM 9.04 on ROBOTIS Software (R+ Motion and R+ Task)                              |
  | **EXP Board(X-Series)** | Uses DYNAMIXEL-X series, XL-320 excluded, with the expantion board on ROBOTIS Software (R+ Motion and R+ Task) |
  | **EXP Board(XL-320)**   | Uses XL-320 only with the expantion board on ROBOTIS Software (R+ Motion and R+ Task)                          |
  | **On Board(X-Series)**  | Uses DYNAMIXEL-X series, XL-320 excluded, with the OpenCM 9.04 on ROBOTIS Software (R+ Motion and R+ Task)     |

**NOTE**: After setup is complete, restart the OpenCM9.04 or the expansion board to activate DYNAMIXEL's bus channel. Consequently, the DYNAMIXEL with the controller will properly work on the motion tool or with the motion file on the task program.
{: .notice}
