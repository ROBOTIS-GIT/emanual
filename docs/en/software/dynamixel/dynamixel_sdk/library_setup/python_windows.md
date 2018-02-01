---
layout: archive
lang: en
ref: dynamixel_sdk_library_setup_python_windows
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/python_windows/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 7"></div>
<div style="counter-reset: h1 2"></div>

# [Library Setup](#library-setup)

## [Python Windows](#python-windows)

### [Recommended Editor](#recommended-editor)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/atom-logo.jpg)

* [Download Atom Editor for Windows](https://atom.io/)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/library_file/a1.png)

### [Compiler and Builder](#compiler-and-builder)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/python.png)

* [Download Python for Windows (`ver. 3` or `ver. 2`)](https://www.python.org/downloads/)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/library_file/b1.png)

### [Function Reference](#function-reference)

* The function reference file is located in `[DynamixelSDK folder]/python/dynamixel_functions_py/dynamixel_functions.py`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/library_file/2.png)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/library_file/1.png)

### [Building and Running the Sample Code](#building-and-running-the-sample-code)

The Dynamixel SDK example code for Python uses the library files(.dll for Windows) built in C language.

Each released Dynamixel SDK have latest library files in `[DynamixelSDK folder]/c/build/[winXX]/output/dxl_xYY_c.dll` which were built by its own source code.

#### Build Example

* Open `python` folder with `Atom` 

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/sample_code/1.png)

* Modify library file path, considering your platform.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/sample_code/2.png)

* Adjust the values surrounded with red circle to proper value as shown in the comment.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/sample_code/3.png)

#### Run example

* Run `read_write.py` by double click

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/sample_code/4.png)

* Or run it manually through command prompt, using `cd`. 

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/sample_code/5.png)

* Console window will show the results

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/sample_code/6.png)
