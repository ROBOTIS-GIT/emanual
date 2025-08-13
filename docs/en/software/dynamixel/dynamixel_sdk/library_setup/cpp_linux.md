---
layout: archive
lang: en
ref: cpp_linux
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/cpp_linux/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="library-setup-cpp-linux">Library Setup <C++ Linux></h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

This section provides instructions on building the SDK.

# [Install requirements](#install-requirements)

- The DYNAMIXEL SKD requires GNU gcc ver. 5.4.0 20160609 or higher
- To check the version of your gcc compiler
``` bash
$ gcc -v
```

- Download the requirements
``` bash
$ sudo apt-get install gcc
$ sudo apt-get install build-essential
$ sudo apt-get install gcc-multilib g++-multilib # For cross-compiling
```

# [Build the SDK](#build-the-SDK)
- Check your system architecture
``` bash
$ uname -m
```

- Enter the appropriate build folder depending on your system and build the SDK
``` bash
$ cd DynamixelSDK/c++/build/linux64 # for 64-bit systems
$ sudo make install
```
- make sure to enter the correct folder according to your system architecture.
  - `linux64` for 64-bit systems
  - `linux32` for 32-bit systems
  - `linux_sbc` for ARM-based SBCs like Raspberry Pi

- If the build completes successfully, you should see the .so file generated inside the build folder.
``` bash
$ ls
libdxl_x86_cpp.so Makefile
```

<br>
- Common `make` commands for building the SDK
``` bash
$ make              # Compile the source code and generate binaries
$ make install      # Install the library files to the system
$ make clean        # Remove all build files and reset the build environment
$ make uninstall    # Remove files installed by 'make install' from the system
$ make reinstall    # Reinstall by cleaning, rebuilding, and installing again
```
{: .notice--success}

# [Test with Sample Code](#test-with-sample-code)

The DYNAMIXEL SDK sample code for CPP uses a .so (Linux Shared Object) library built in the CPP language.

- Go to the folder containing the sample code and build it.
``` bash
$ cd DynamixelSDK/c++/example/protocol2.0/read_write/linux64
$ make
```

- Grant permission to access the port and run the sample code
```bash
$ sudo chmod 666 /dev/ttyUSB0
$ ./read_write
```

- When you Press any key, Dynamixel will start moving to the goal position.
```bash
pc@pc:~/DynamixelSDK/c++/example/protocol2.0/read_write/linux64$ ./read_write
Succeeded to open the port!
Succeeded to change the baudrate!
Succeeded enabling DYNAMIXEL Torque.
Press any key to continue. (Press [ESC] to exit)
[ID:001] Goal Position:000  Present Position:005
[ID:001] Goal Position:4095  Present Position:005
[ID:001] Goal Position:4095  Present Position:005
[ID:001] Goal Position:4095  Present Position:021
[ID:001] Goal Position:4095  Present Position:044
[ID:001] Goal Position:4095  Present Position:071
[ID:001] Goal Position:4095  Present Position:100
[ID:001] Goal Position:4095  Present Position:131
[ID:001] Goal Position:4095  Present Position:162
[ID:001] Goal Position:4095  Present Position:196
[ID:001] Goal Position:4095  Present Position:226
[ID:001] Goal Position:4095  Present Position:261
...
...
...
```
``` 
