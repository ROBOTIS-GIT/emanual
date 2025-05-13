---
layout: archive
lang: en
ref: dynamixel_sdk_download
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/download/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<style>body {counter-reset: h1 1 !important;}</style>

# [Download](#download)

## [Repository](#repository)

- The complete Cross-compilable, all-in-one SDK is available for download from the [ROBOTIS Open Source Repository](https://github.com/ROBOTIS-GIT/DynamixelSDK).
- If you are a ROS user, you can [install the ROS library](https://index.ros.org/p/dynamixel_sdk/#rolling) and Python module for DYNAMIXEL SDK directly through ROS.

1) **Option 1**: Git command
  
  ```
  $ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
  ```
  
2) **Option 2**: Direct Download
- [DYNAMIXEL SDK Releases](https://github.com/ROBOTIS-GIT/DynamixelSDK/releases)

3) **Option 3**: Install ROS library (C++ library and Python module)

  ```
  $ sudo apt-get install ros-[ROS Distribution]-dynamixel-sdk
  ```

## [File Structure](#file-structure)

The code examples use either the C or C++ version of the DLL. After extracting the ZIP file, you will see the folder structure shown below.

![](/assets/images/sw/sdk/dynamixel_sdk/overview/dynamixel_sdk_language_map.png)

For example, if you open the C++ folder, you will find four subfolders containing C++ source files, header files, build scripts, and example code.

![](/assets/images/sw/sdk/dynamixel_sdk/overview/dynamixel_sdk_library_struct.png)

While the PortHandler—which manages the system communication environment—is implemented separately for Linux, macOS, and Windows, the remaining source files are designed to be cross-platform. You can compile them using either a Makefile (for Linux/macOS) or Microsoft Visual Studio (for Windows), depending on your 32-bit or 64-bit platform.
The example code demonstrates how to use the SDK functions to control one or more DYNAMIXEL actuators, utilizing pre-built library files (.dll, .so, or .dylib).

![](/assets/images/sw/sdk/dynamixel_sdk/overview/dynamixel_sdk_sample_struct.png)

Each example folder also includes the corresponding build files for Linux, macOS, or Windows, targeting both 32-bit and 64-bit platforms. Make sure to build the library files before running the example codes. The ReadWrite example, for instance, shows how to control and read the position of a DYNAMIXEL actuator.

Examples written in C#, Java, MATLAB, and LabVIEW do not use SDK functions implemented directly in those languages. Instead, they interface with the precompiled shared libraries (.dll, .so, or .dylib) built from C source code.

![](/assets/images/sw/sdk/dynamixel_sdk/overview/dynamixel_sdk_language_struct.png)

You can find detailed instructions for running the examples in the DYNAMIXEL SDK source repository [here](/docs/en/software/dynamixel/dynamixel_sdk/sample_code/c_read_write_protocol_1_0/#sample-code)
