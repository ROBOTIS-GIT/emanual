---
layout: archive
lang: en
ref: python_linux
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/python_linux/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="library-setup-python-linux">Library Setup <Python Linux></h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

# [Install requirements](#install-requirements)

- Install python3 and pip3.
```bash
$ sudo apt update
$ sudo apt install python3 python3-pip python3-serial
```

- You can also install in web browser using the following link:  
  [Download Python3 for Linux](https://www.python.org/downloads/)

- If you downloaded SDK as source code, you should install it using pip3.
```bash
$ cd DynamixelSDK/python
$ pip install .
```

# [Check whether pip recognizes the SDK](#check-whether-pip-recognizes-the-sdk)

- You can check whether pip recognizes the SDK by running the following command:
```bash
$ pip show dynamixel_sdk
Name: dynamixel-sdk
Version: *.*.*
Summary: UNKNOWN
Home-page: UNKNOWN
Author:
Author-email:
License: UNKNOWN
Location: location your sdk installed in # ex. /home/robotis/.local/lib/python3.10/site-packages OR /opt/ros/humble/local/lib/python3.10/dist-packages
Requires:
Required-by:
```

<!-- # [Test with Sample Code](#test-with-sample-code)

* Open the `python` folder with your preferred editor. Modify any required settings that is needed for control of your specific DYNAMIXEL servos. 

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/sample_code/py5.png)


* Run `read_write.py` by double clicking the file,

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/sample_code/py2.png)

* Or run it manually through the command prompt.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/sample_code/py4.png) -->
