---
layout: popup
---

# [Windows Driver Installation](#windows-driver-installation)

This step-by-step instruction describes how to install a driver on your system (Windows 8/10).  

## [Download a driver](#download-a-driver)
Download the driver from the given link, and extract the zipped folder.
- [robotis_CDC_drv.zip](http://support.robotis.com/ko/baggage_files/opencm/robotis_cdc_drv.zip)

## [Connect your controller to a PC](#connect-your-controller-to-a-pc)
Connect your controller to a PC via the USB cable.

  ![](/assets/images/parts/controller/opencm904/connect_pc.png)

**WARNING**: Using multiple devices via a USB hub may cause a download failure caused by insufficient current. Be sure to supply enough power to the hub, or to directly connect the controller with your PC .  
{: .notice--warning}

## [Install the Windows Driver](#install-the-windows-driver)

Use either of ways to install it.

- [Using .inf and cat file installation](#using-inf-file-installation)
- [Manual Installation](#manual-installation)

### [Using .inf file installation](#using-inf-file-installation)

1. [Download a Driver](#download-a-driver)
2. [Connect your controller to a PC](#connect-your-controller-to-a-pc)
3. Right-Click the downloaded folder to extract.  
  ![](/assets/images/faq/driver_installation_en/extracting_driver.png)

4. Click on **Install**  
  ![](/assets/images/faq/driver_installation_en/install_inf.png)

5. Click on **Open**  
  ![](/assets/images/faq/driver_installation_en/installing_driver.png)

6. [Check an assigned COM port](#check-an-assigned-com-port)

{% capture signature_enforcement %}
**WARNING**: If your system block the driver installation, you need to disable a driver signature enforcement.  
    1. Open **Setting**.  
    2. Select **Update & recovery** > **Recovery** > **Advanced startup** > **Troubleshoot** > **Advanced options** > **Startup Setting** > **Restart** > **7) Disable driver signature enforcement**.  
    3. Restart your PC.
{% endcapture %}
<div class="notice--warning"> {{ signature_enforcement | markdownify }}</div>

### [Manual Installation](#manual-installation)

If you use Windows Server(2003 or 2008) or your system does not detect COM port, try the following instruction. 

1. [Download a Driver](#download-a-driver)

2. [Connect your controller to a PC](#connect-your-controller-to-a-pc)

3. Open **Device Manager**, and find **ROBOTIS Virtual COM Port**.  
  ![](/assets/images/faq/driver_installation_en/device_manager.png)

4. Right-click on **ROBOTIS Virtual COM Port** and click on **Update Driver Software**.  
  ![](/assets/images/faq/driver_installation_en/manual_installation_01.png)

5. Select **Browse my computer for driver software**.  
  ![](/assets/images/faq/driver_installation_en/manual_installation_02.png)

6. Click on **Browse**.  
  ![](/assets/images/faq/driver_installation_en/manual_installation_02_1.png)  

7. Locate the folder that contains driver files.  
  ![](/assets/images/faq/driver_installation_en/manual_installation_03.png)  

8. Click **Next**. Successful installation will say “Windows has successfully updated your driver software”  
  ![](/assets/images/faq/driver_installation_en/manual_installation_04.png)

9. [Check an assigned COM port](#check-an-assigned-com-port)

### [Check an assigned COM port](#check-an-assigned-com-port)

Open the **Device Manager** and see which COM port is assigned on your system (e.g., COM3)

![](/assets/images/faq/driver_installation_en/check_resisterd_port.png)

**NOTE**: ROBOTIS Virtual COM Port may differ depending on a USB port in use.
{: .notice}
