{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="library-setup-python-linux">Library Setup &lt;Python Linux&gt;</h1>
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

# [Build and Install the SDK](#build-and-install-the-SDK)

- If you downloaded the SDK as source code, you should install it using pip3 (excluding those who installed via pip3 install).
```bash
$ cd DynamixelSDK/python
$ pip install .
```

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
