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

- The DYNAMIXEL SDK requires GNU gcc ver. 5.4.0 20160609 or higher
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

- Grant permission to access the port
```bash
$ sudo chmod 666 /dev/ttyUSB0
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
