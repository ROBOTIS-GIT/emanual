{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="library-setup-c-linux">Library Setup &lt;C Linux&gt;</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

This tutorial is written assuming you are using the latest version of Ubuntu. Commands may not be the same for alternative distributions of Linux.

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
$ cd DynamixelSDK/c/build/linux64 # for 64-bit systems
$ sudo make install
```
- make sure to enter the correct folder according to your system architecture.
  - `linux64` for 64-bit systems
  - `linux32` for 32-bit systems
  - `linux_sbc` for ARM-based SBCs like Raspberry Pi

- If the build completes successfully, you should see the .so file generated inside the build folder.
``` bash
$ ls
libdxl_x86_c.so Makefile
```

- Grant permission to access the port
``` bash
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

# [Building and Running the Sample Code](#building-and-running-the-sample-code)

The DYNAMIXEL SDK example code for C uses a .so (Linux Shared Object) library built in C.  
The previous instructions walk you through building the latest library files in `[DynamixelSDK folder]/c/build/[linuxXX]/libdxl_xYY_c.so` built by its own source code. 

* Go to the Makefile's directory using `cd`:  

  ``` bash
  $ cd [DynamixelSDK folder]/c/example/protocol1.0/read_write/linux32
  ```

  OR

  ``` bash 
  $ cd [DynamixelSDK folder]/c/example/protocol1.0/read_write/linux64
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/sample_code/exc4.png)

* Build the executable file: 

  ``` bash
  $ make
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/sample_code/exc1.png)

* If there is an error, `$ make clean` then `$ make` again.

* To delete the executable file, `$ make clean`.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/sample_code/exc2.png)

* Access the port you will be using to communicate with DYNAMIXEL: 

  ``` bash
  $ sudo chmod a+rw /dev/ttyUSB0
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/sample_code/exc3.png)

* Run the executable file: 

  ``` bash
  $ ./read_write
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/linux/sample_code/exc5.png)
