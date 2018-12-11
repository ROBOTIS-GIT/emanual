---
layout: popup
---

**Task space** is the cartesian coordinate space where the operation of the manipulator is required.  
It has position (X,Y and Z) and orientation (Roll, Pitch and Yaw) about each axes.  
In space that we definiened for control the OpenManipulator, the coordinates is called as world coordunates, and it's origin is defined as following:  
![](/assets/images/platform/openmanipulator/open_manipulator_world.png)


---


**Joint space** is a space composed of the angles of each joint (revolute, prismatic, spherical, cylindrical etc.,).  
**Joint space** is defined by individual and independent actuation of the joints.  
That means, it is those joints which do not depend on any other joint.  
**Joint space** in OpenManipulator consists of the angles of the joints where coordinate systems are displayed in as following:  
![](/assets/images/platform/openmanipulator/open_manipulator_joint_space.png)
