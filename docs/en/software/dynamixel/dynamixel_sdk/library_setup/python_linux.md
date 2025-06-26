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

<style>body {counter-reset: h1 4 !important;}</style>
<div style="counter-reset: h2 8"></div>

<!--[dummy Header 1]>
  <h1 id="library-setup"><a href="#library-setup">Library Setup</a></h1>
<![end dummy Header 1]-->

## [Python Linux](#python-linux)

### [Recommended Editor](#recommended-editor)

* [Zed Editor for Linux (`.deb` or `.rpm`)](https://zed.dev/)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/library_file/a1.png)

### [Compiler and Builder](#compiler-and-builder)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/python.png)

* [Download Python3 for Linux](https://www.python.org/downloads/)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/library_file/b1.png)
* Or install it using your distribution's package manager
  ``` bash
  $ sudo apt update; sudo apt upgrade; sudo apt install python3
  ```
### [Building the Library](#building-the-library)

* Navigate to the [`DynamixelSDK python folder`] in your terminal (`cd [DynamixelSDK folder]\python`) and run the command `pip install .` to start the installation.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/library_file/py1.png)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/library_file/py3.png)

### [Building and Running the Sample Code](#building-and-running-the-sample-code)

The DYNAMIXEL SDK example code for Python uses the library files installed in the previous step.

#### Run Example

* Open the `python` folder with your preferred editor. Modify any required settings that is needed for control of your specific DYNAMIXEL servos. 

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/sample_code/py5.png)


* Run `read_write.py` by double clicking the file,

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/sample_code/py2.png)

* Or run it manually through the command prompt.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/linux/sample_code/py4.png)
