---
layout: archive
lang: en
ref: python_windows
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/python_windows/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<style>body {counter-reset: h1 4 !important;}</style>
<div style="counter-reset: h2 7"></div>

<!--[dummy Header 1]>
  <h1 id="library-setup"><a href="#library-setup">Library Setup</a></h1>
<![end dummy Header 1]-->

## [Python Windows](#python-windows)

### [Recommended Editor](#recommended-editor)

* [Download Visual Studio Community for Windows Desktop](https://www.visualstudio.com/en-us/products/visual-studio-express-vs.aspx)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/vs.png)

### [Compiler and Builder](#compiler-and-builder)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/python.png)

* [Download Python3 for Windows](https://www.python.org/downloads/), and be sure to install it to your path when prompted.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/library_file/b1.png)

### [Building the Library](#building-the-library)
* Navigate to the [`DynamixelSDK python folder`] in the Windows command prompt. (`cd [DynamixelSDK folder]\python`).
 Then, run the installation by entering the following command on the command prompt from inside the folder (`pip install .`).

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/library_file/py3.png)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/library_file/py4.png)


### [Building and Running the Sample Code](#building-and-running-the-sample-code)

The DYNAMIXEL SDK example code for Python uses the library files installed in the previous step.

#### Run Example

* Open the `python` folder using your preffered development environment and modify any settings that may be needed for accurate control of the DYNAMIXEL servos you'll be using.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/sample_code/py2.png)


* Run the `read_write.py` example to check your installation.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/sample_code/py4.png)

* Or run the script manually through the command prompt.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/python/windows/sample_code/py6.png)
