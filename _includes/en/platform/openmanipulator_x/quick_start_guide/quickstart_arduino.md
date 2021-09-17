
**WARNING** : This Arduino instruction **does not require ROS** to operate OpenMANIPULATOR-X.  
When operating with ROS, the PC becomes the main controller.  
On the other hands, when operating with Arduino, the OpenCR becomes the main controller.
{: .notice--danger}

OpenMANIPULATOR-X is compatible with **OpenCR**. We offer API to easily control manipulator.  
This API supports DYNAMIXEL, DYNAMIXEL-X including protocol 1.0 and 2.0. Furthermore, this code can be used for [OpenMANIPULATOR Friends](/docs/en/platform/openmanipulator_x/friends/).  
User can write the code in **Arduino IDE** and simulate or control using **Processing** GUI.

<iframe width="560" height="315" src="https://www.youtube.com/embed/fT1Wv6qHknI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**NOTE** : Processing source code is tested in Processing **v3.5.4**.
{: .notice} 

1. Install Arduino IDE and setup OpenCR developing environment.
  - [Setup Arduino IDE for OpenCR 1.0 (Windows)](/docs/en/parts/controller/opencr10/#install-on-windows)
  - [Setup Arduino IDE for OpenCR 1.0 (Linux)](/docs/en/parts/controller/opencr10/#install-on-linux)
  - [Setup Arduino IDE for OpenCR 1.0 (Mac)](/docs/en/parts/controller/opencr10/#install-on-mac)

2. Connect OpenCR to PC with a micro USB cable.

3. Run Arduino IDE and open the example.  
  Go to `Examples` > `OpenManipulator` > `example` > `Chain` > `open_manipulator_chain`.  
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_arduino.png)

4. Upload the example to OpenCR.  
  ![](/assets/images/platform/openmanipulator_x/upload_chain_example.png)

5. When the upload is completed, the following message will be displayed in the output window.  
  ![](/assets/images/parts/controller/opencr10/downloader_01.png)

{% capture warning_01 %}
`FAQ`

- If firmware upload fails, try uploading with the recovery mode. Below sequence activates the recovery mode of OpenCR. Under the recovery mode, the `STATUS` led of [OpenCR] will blink periodically.
1. Hold down the `PUSH SW2` button.
2. Press the `Reset` button.
3. Release the `Reset` button.
4. Release the `PUSH SW2` button.  
![](/assets/images/parts/controller/opencr10/bootloader_19.png)
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>


**WARNING**  
Please be aware that OpenCR board manager **does not support Arduino IDE on ARM based SBC such as Raspberry Pi or NVidia Jetson**.
{: .notice--danger}

Now let's setup the Processing GUI tool for easier control of OpenMANIPULATOR-X.

1. Download and install the Processing.

    - ![](/assets/images/icon_download.png) [https://processing.org/download/](https://processing.org/download/)

    **NOTE** : Processing source code is tested in Processing **v3.5.4**.
    {: .notice} 

2. Launch Processing and go to `Tools` > `Add Tool..`.

    ![](/assets/images/platform/openmanipulator_x/processing_add_tools.png)

3. In the `Libraries` tab, search for `ControlP5` and install it.

    ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_1.png)

4. Download processing source code for OpenMANIPULATOR.

    - ![](/assets/images/icon_download.png) [Direct Download(Zip)](https://github.com/ROBOTIS-GIT/open_manipulator_processing/archive/refs/heads/master.zip)
    - or use Git tool
    ```bash
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_processing.git
    ```
