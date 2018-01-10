---
layout: archive
lang: en
ref: dynamixel_sdk_library_setup_python_linux
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/python_linux/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 8"></div>
<div style="counter-reset: h1 2"></div>

# [Library Setup](#library-setup)

## [Python Linux](#python-linux)

### [Recommended Editor](#recommended-editor)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/atom-logo.jpg)

------------------------------------------------------------------------------------

* [Download Atom Editor for Linux (`.deb` or `.rpm`)](https://atom.io/)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/library_file/a1.png)

### [Compiler and Builder](#compiler-and-builder)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/python.png)

------------------------------------------------------------------------------------

* [Download Python for Linux (`ver. 3` or `ver. 2`)](https://www.python.org/downloads/)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/library_file/b1.png)

### [Function Reference](#function-reference)

* The function reference file is located in `[DynamixelSDK folder]/python/dynamixel_functions_py/dynamixel_functions.py`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/library_file/2.png)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/library_file/1.png)

### [Building and Running the Sample Code](#building-and-running-the-sample-code)

The Dynamixel SDK example code for Python uses the library files(.so for Linux) built in C language.

Each released Dynamixel SDK have latest library files in `[DynamixelSDK folder]/c/build/[linuxXX]/dxl_xYY_c.so` which were built by its own source code.

#### Build Example

* Click `Open Folder...` in `Atom` 

* Open `python` folder.

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/sample_code/2.png)

* Modify library file path, considering your platform.

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/sample_code/3.png)

* Adjust the values surrounded with red circle to proper value as shown in the comment.

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/sample_code/4.png)


#### Run example

* Make the port be able to be used

[Terminal] $ `sudo chmod a+rw /dev/ttyUSB0`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/sample_code/6.png)

* Go to the folder `[DynamixelSDK folder]/python/protocol1_0/`, using `cd`, then run example code by typing `python read_write.py`. 

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/sample_code/7.png)
