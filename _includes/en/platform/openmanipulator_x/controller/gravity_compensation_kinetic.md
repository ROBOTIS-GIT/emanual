Let OpenMANIPULATOR-X compensate gravity forces by using the Gravity Compensation packages

This section describes how to install and use Gravity Compensation feature with OpenMANIPULATOR-X.

#### [Install Gravity Compensation Packages](#install-gravity-compensation-packages)
```bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_controls.git
$ cd ~/catkin_ws && catkin_make
```

#### [Set Operating Mode to Current Mode](#set-operating-mode-to-current-mode)
Set your DYNAMXEL's Operating Mode to Current Mode via [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/)

![](/assets/images/platform/openmanipulator_x/omx_gravity_current_mode_setting.png)

#### [Run Gravity Compensation Package](#run-gravity-compensation-package)
Run the gravity compensation package with OpenMANIPULATOR-X.

```bash
$ roslaunch open_manipulator_controllers gravity_compensation_controller.launch
```
