---
layout: archive
lang: en
ref: python_windows
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/python_windows/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 4"></div>
<div style="counter-reset: h2 7"></div>

<!--[dummy Header 1]>
  <h1 id="library-setup"><a href="#library-setup">Library Setup</a></h1>
<![end dummy Header 1]-->

## [Python Windows](#python-windows)

### [Recommended Editor](#recommended-editor)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/atom-logo.jpg)

* [Download Atom Editor for Windows](https://atom.io/)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/library_file/a1.png)

### [Compiler and Builder](#compiler-and-builder)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/python.png)

* [Download Python for Windows (`ver. 3` or `ver. 2`)](https://www.python.org/downloads/)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/library_file/b1.png)

### [Building the Library](#building-the-library)
* Go to the [`DynamixelSDK folder`] following command on the command prompt. (`cd [DynamixelSDK folder]\python`).
 Run setup.py by entering following command on the command prompt (`python setup.py install`).

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/library_file/py3.png)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/library_file/py4.png)


### [Building and Running the Sample Code](#building-and-running-the-sample-code)

The Dynamixel SDK example code for Python uses the library files built in previous step.

#### Run Example

* Open `python` folder with `Atom`. Modify the settings that is needed for the Dynamixel control.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/sample_code/py2.png)


* Run `read_write.py` by double click

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/sample_code/py4.png)

* Or run it manually through command prompt, using `cd`.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/sample_code/py6.png)
