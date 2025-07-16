
Launch the open_manipulator_controller for Gazebo simulation.  

``` bash
$ ros2 launch open_manipulator_x_moveit_config moveit_core.launch.py
```

If the OpenMANIPULATOR-X controller for Gazebo simulation Launched successfully, the below messages will be printed on the terminal.

```
[INFO] [launch]: All log files can be found below /home/open_manipulator_x/.ros/log/2024-11-29-17-28-11-688953-open_manipulator_x-32077
[INFO] [launch]: Default logging verbosity is set to INFO
[INFO] [rviz2-1]: process started with pid [32079]
[INFO] [move_group-2]: process started with pid [32081]
[move_group-2] [WARN] [1732868892.050631042] [move_group.move_group]: Falling back to using the the move_group node namespace (deprecated behavior).
[move_group-2] [INFO] [1732868892.053471484] [moveit_rdf_loader.rdf_loader]: Loaded robot model in 0 seconds
[move_group-2] [INFO] [1732868892.053512872] [moveit_robot_model.robot_model]: Loading robot model 'open_manipulator_x'...
[move_group-2] [WARN] [1732868892.116979404] [moveit_robot_model.robot_model]: Link end_effector_link has visual geometry but no collision geometry. Collision geometry will be left empty. Fix your URDF file by explicitly specifying collision geometry.
[move_group-2] [INFO] [1732868892.124119921] [moveit_kinematics_base.kinematics_base]: Using position only ik
[rviz2-1] [INFO] [1732868892.340975665] [rviz2]: Stereo is NOT SUPPORTED
[rviz2-1] [INFO] [1732868892.341211952] [rviz2]: OpenGl version: 4.6 (GLSL 4.6)
[rviz2-1] [INFO] [1732868892.360708219] [rviz2]: Stereo is NOT SUPPORTED
[move_group-2] [INFO] [1732868892.365328140] [moveit_ros.planning_scene_monitor.planning_scene_monitor]: Publishing maintained planning scene on 'monitored_planning_scene'
[move_group-2] [INFO] [1732868892.365466603] [moveit.ros_planning_interface.moveit_cpp]: Listening to 'joint_states' for joint states
[move_group-2] [INFO] [1732868892.365915390] [moveit_ros.current_state_monitor]: Listening to joint states on topic 'joint_states'
[move_group-2] [INFO] [1732868892.366113375] [moveit_ros.planning_scene_monitor.planning_scene_monitor]: Listening to '/attached_collision_object' for attached collision objects
[move_group-2] [INFO] [1732868892.366124664] [moveit_ros.planning_scene_monitor.planning_scene_monitor]: Starting planning scene monitor
[move_group-2] [INFO] [1732868892.366240628] [moveit_ros.planning_scene_monitor.planning_scene_monitor]: Listening to '/planning_scene'
[move_group-2] [INFO] [1732868892.366248218] [moveit_ros.planning_scene_monitor.planning_scene_monitor]: Starting world geometry update monitor for collision objects, attached objects, octomap updates.
[move_group-2] [INFO] [1732868892.366379382] [moveit_ros.planning_scene_monitor.planning_scene_monitor]: Listening to 'collision_object'
[move_group-2] [INFO] [1732868892.366515892] [moveit_ros.planning_scene_monitor.planning_scene_monitor]: Listening to 'planning_scene_world' for planning scene world geometry
[move_group-2] [WARN] [1732868892.366901130] [moveit.ros.occupancy_map_monitor.middleware_handle]: Resolution not specified for Octomap. Assuming resolution = 0.1 instead
[move_group-2] [ERROR] [1732868892.366910881] [moveit.ros.occupancy_map_monitor.middleware_handle]: No 3D sensor plugin(s) defined for octomap updates
[move_group-2] [INFO] [1732868892.499850613] [moveit.ros_planning_interface.moveit_cpp]: Loading planning pipeline 'move_group'
[move_group-2] [INFO] [1732868892.507455943] [moveit.ros_planning.planning_pipeline]: Using planning interface 'OMPL'
[rviz2-1] Warning: class_loader.impl: SEVERE WARNING!!! A namespace collision has occurred with plugin factory for class rviz_default_plugins::displays::InteractiveMarkerDisplay. New factory will OVERWRITE existing one. This situation occurs when libraries containing plugins are directly linked against an executable (the one running right now generating this message). Please separate plugins out into their own library or just don't link against the library and use either class_loader::ClassLoader/MultiLibraryClassLoader to open.
[rviz2-1]          at line 253 in /opt/ros/humble/include/class_loader/class_loader/class_loader_core.hpp
[move_group-2] [INFO] [1732868892.509438401] [moveit_ros.add_time_optimal_parameterization]: Param 'move_group.path_tolerance' was not set. Using default value: 0.100000
[move_group-2] [INFO] [1732868892.509453409] [moveit_ros.add_time_optimal_parameterization]: Param 'move_group.resample_dt' was not set. Using default value: 0.100000
[move_group-2] [INFO] [1732868892.509456509] [moveit_ros.add_time_optimal_parameterization]: Param 'move_group.min_angle_change' was not set. Using default value: 0.001000
[move_group-2] [INFO] [1732868892.509465205] [moveit_ros.fix_workspace_bounds]: Param 'move_group.default_workspace_bounds' was not set. Using default value: 10.000000
[move_group-2] [INFO] [1732868892.509475665] [moveit_ros.fix_start_state_bounds]: Param 'move_group.start_state_max_bounds_error' was set to 0.100000
[move_group-2] [INFO] [1732868892.509478239] [moveit_ros.fix_start_state_bounds]: Param 'move_group.start_state_max_dt' was not set. Using default value: 0.500000
[move_group-2] [INFO] [1732868892.509485286] [moveit_ros.fix_start_state_collision]: Param 'move_group.start_state_max_dt' was not set. Using default value: 0.500000
[move_group-2] [INFO] [1732868892.509489253] [moveit_ros.fix_start_state_collision]: Param 'move_group.jiggle_fraction' was not set. Using default value: 0.020000
[move_group-2] [INFO] [1732868892.509492194] [moveit_ros.fix_start_state_collision]: Param 'move_group.max_sampling_attempts' was not set. Using default value: 100
[move_group-2] [INFO] [1732868892.509499197] [moveit.ros_planning.planning_pipeline]: Using planning request adapter 'Add Time Optimal Parameterization'
[move_group-2] [INFO] [1732868892.509501614] [moveit.ros_planning.planning_pipeline]: Using planning request adapter 'Fix Workspace Bounds'
[move_group-2] [INFO] [1732868892.509503570] [moveit.ros_planning.planning_pipeline]: Using planning request adapter 'Fix Start State Bounds'
[move_group-2] [INFO] [1732868892.509524030] [moveit.ros_planning.planning_pipeline]: Using planning request adapter 'Fix Start State In Collision'
[move_group-2] [INFO] [1732868892.509526078] [moveit.ros_planning.planning_pipeline]: Using planning request adapter 'Fix Start State Path Constraints'
[move_group-2] [INFO] [1732868892.537435366] [moveit.plugins.moveit_simple_controller_manager]: Added FollowJointTrajectory controller for arm_controller
[move_group-2] [INFO] [1732868892.537485376] [moveit.plugins.moveit_simple_controller_manager]: Max effort set to 0.0
[move_group-2] [INFO] [1732868892.538656730] [moveit.plugins.moveit_simple_controller_manager]: Added GripperCommand controller for gripper_controller
[move_group-2] [INFO] [1732868892.538765617] [moveit.plugins.moveit_simple_controller_manager]: Returned 2 controllers in list
[move_group-2] [INFO] [1732868892.538779236] [moveit.plugins.moveit_simple_controller_manager]: Returned 2 controllers in list
[move_group-2] [INFO] [1732868892.538962577] [moveit_ros.trajectory_execution_manager]: Trajectory execution is managing controllers
[move_group-2] [INFO] [1732868892.538972871] [move_group.move_group]: MoveGroup debug mode is ON
[move_group-2] [INFO] [1732868892.551168187] [move_group.move_group]: 
[move_group-2] 
[move_group-2] ********************************************************
[move_group-2] * MoveGroup using: 
[move_group-2] *     - ApplyPlanningSceneService
[move_group-2] *     - ClearOctomapService
[move_group-2] *     - CartesianPathService
[move_group-2] *     - ExecuteTrajectoryAction
[move_group-2] *     - GetPlanningSceneService
[move_group-2] *     - KinematicsService
[move_group-2] *     - MoveAction
[move_group-2] *     - MotionPlanService
[move_group-2] *     - QueryPlannersService
[move_group-2] *     - StateValidationService
[move_group-2] ********************************************************
[move_group-2] 
[move_group-2] [INFO] [1732868892.551227324] [moveit_move_group_capabilities_base.move_group_context]: MoveGroup context using planning plugin ompl_interface/OMPLPlanner
[move_group-2] [INFO] [1732868892.551236259] [moveit_move_group_capabilities_base.move_group_context]: MoveGroup context initialization complete
[move_group-2] Loading 'move_group/ApplyPlanningSceneService'...
[move_group-2] Loading 'move_group/ClearOctomapService'...
[move_group-2] Loading 'move_group/MoveGroupCartesianPathService'...
[move_group-2] Loading 'move_group/MoveGroupExecuteTrajectoryAction'...
[move_group-2] Loading 'move_group/MoveGroupGetPlanningSceneService'...
[move_group-2] Loading 'move_group/MoveGroupKinematicsService'...
[move_group-2] Loading 'move_group/MoveGroupMoveAction'...
[move_group-2] Loading 'move_group/MoveGroupPlanService'...
[move_group-2] Loading 'move_group/MoveGroupQueryPlannersService'...
[move_group-2] Loading 'move_group/MoveGroupStateValidationService'...
[move_group-2] 
[move_group-2] You can start planning now!
[move_group-2] 
[rviz2-1] [ERROR] [1732868895.530799244] [moveit_ros_visualization.motion_planning_frame]: Action server: /recognize_objects not available
[rviz2-1] [INFO] [1732868895.568490164] [moveit_ros_visualization.motion_planning_frame]: MoveGroup namespace changed: / -> . Reloading params.
[rviz2-1] [INFO] [1732868895.621169604] [moveit_rdf_loader.rdf_loader]: Loaded robot model in 0.00698233 seconds
[rviz2-1] [INFO] [1732868895.621219448] [moveit_robot_model.robot_model]: Loading robot model 'open_manipulator_x'...
[rviz2-1] [WARN] [1732868895.725265369] [moveit_robot_model.robot_model]: Link end_effector_link has visual geometry but no collision geometry. Collision geometry will be left empty. Fix your URDF file by explicitly specifying collision geometry.
[rviz2-1] [INFO] [1732868895.991052343] [moveit_ros.planning_scene_monitor.planning_scene_monitor]: Starting planning scene monitor
[rviz2-1] [INFO] [1732868895.991657971] [moveit_ros.planning_scene_monitor.planning_scene_monitor]: Listening to '/monitored_planning_scene'
[rviz2-1] [INFO] [1732868896.113884156] [interactive_marker_display_94048109057936]: Connected on namespace: /rviz_moveit_motion_planning_display/robot_interaction_interactive_marker_topic
[rviz2-1] [INFO] [1732868896.121726559] [moveit_ros_visualization.motion_planning_frame]: group arm
[rviz2-1] [INFO] [1732868896.121747021] [moveit_ros_visualization.motion_planning_frame]: Constructing new MoveGroup connection for group 'arm' in namespace ''
[rviz2-1] [INFO] [1732868896.136189756] [move_group_interface]: Ready to take commands for planning group arm.
[rviz2-1] [INFO] [1732868896.137926927] [interactive_marker_display_94048109057936]: Sending request for interactive markers
[rviz2-1] [INFO] [1732868896.138014560] [moveit_ros_visualization.motion_planning_frame]: group arm
[rviz2-1] [INFO] [1732868896.171382689] [interactive_marker_display_94048109057936]: Service response received for initialization


```
