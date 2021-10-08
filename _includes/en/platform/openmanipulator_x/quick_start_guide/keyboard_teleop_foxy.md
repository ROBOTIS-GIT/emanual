
Open another terminal and enter below command.  
```bash
$ ros2 run open_manipulator_x_teleop open_manipulator_x_teleop_keyboard
```


You will see below interface on the terminal window after a successful launch.
```
Control Your OpenManipulator!
---------------------------
Task Space Control:
         (Forward, X+)
              W                   Q (Upward, Z+)
(Left, Y+) A     D (Right, Y-)    Z (Downward, Z-)
              X 
        (Backward, X-)

Joint Space Control:
- Joint1 : Increase (Y), Decrease (H)
- Joint2 : Increase (U), Decrease (J)
- Joint3 : Increase (I), Decrease (K)
- Joint4 : Increase (O), Decrease (L)
- Gripper: Increase (F), Decrease (G) | Fully Open (V), Fully Close (B)

INIT : (1)
HOME : (2)

CTRL-C to quit

Joint Angle(Rad): [0.000, 0.000, 0.000, 0.000, 0.000]
Kinematics Pose(Pose X, Y, Z | Orientation W, X, Y, Z): 0.000, 0.000, 0.000 | 0.000, 0.000, 0.000, 0.000
```
