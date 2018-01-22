### 1. Overview   
This chapter explains how to configure walking parameters and test them with ROBOTIS-OP3.  
Basic demo uses saved walking parameters.  


### 2. Description
#### 2.1 Setting Module
Activate `walking_module` on the lower body part of ROBOTIS-OP3 for walking test.   
Confirm that the joints used for walking are set as `walking_module`, then move to `Walking` tab.
(When the walking module is activated, ROBOTIS-OP3 will take the initial posture for walking.)    

<img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_gui_walking_tuner_01.png?raw=true" align="bottom" width="70%"/>  

<img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_gui_walking_tuner_02.png?raw=true" align="bottom" width="70%"/>  


#### 2.2 Start / Stop Walking  
 1. `start` button : Initiate walking  
 2. `stop` button : Stop walking. When stopped, walking related parameters will be reset.  

<img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_gui_walking_tuner_03.png?raw=true" align="bottom" width="70%"/>  





#### 2.3 Apply Parameters
 1. `Refresh` button : Acquire all parameter currently applied on `walking_module`.  
 2. `Save` button : Save all parameter currently applied on `walking_module` as default parameter and use it for other program such as `op3_demo`.  
 3. `Apply` button : Apply modified parameters from the GUI to `walking_module`.  

<img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_gui_walking_tuner_04.png?raw=true" align="bottom" width="70%"/>  




#### 2.4 Parameter Descriptions
**Initial Pose**  
* `X` : offset in the x-direction (forward and backward) [m]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image142.jpg" align="bottom" height="200px" />

* `Y` : offset in the y-direction (left and right) [m]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image143.jpg" align="bottom" height="200px" />

* `Z` : offset in the z-direction (up and down) [m]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image144.jpg" align="bottom" height="250px" />

* `Roll` : roll offset (x-coordinate) [Deg]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image145.jpg" align="bottom" height="220px" />

* `Pitch` : pitch offset (y-coordinate) [Deg]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image146.jpg" align="bottom" height="220px" />

* `Yaw` : yaw offset (z-coordinate) [Deg]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image2.gif" align="bottom" height="100px" />

* `Hip Pitch Offset` : pitch offset (y-coordinate) of the hip. Offest values are applied to Dynamixel position values for hip pitch joints. [Deg]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image147.jpg" align="bottom" height="200px" />


**Walking Parameters**  
* `Period Time` : Time takes for ROBOTIS-OP3 to complete two full steps (once for each foot) [ms]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image148.jpg" align="bottom" height="200px" />  

* `DSP Ratio(Double Stance Period)` : Time ratio of the period when both feet are touching the ground to the period of walking cycle.  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image149.jpg" align="bottom" height="250px" />  

* `Step FB Ratio` : ratio of body sway on X-axis to X Move Amplitude.  
 `Amount of Body Sway(X-axis)` = `X Move Amplitude` * `Step FB Ratio`  

* `X Move Amplitude` : Maximum distance between left and right feet on X-axis while walking [meter]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image150.jpg" align="bottom" height="200px" />  

* `Y Move Amplitude` : Differential distance of each foot on Y-axis while walking [meter]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image151.jpg" align="bottom" height="200px" />  

* `Z Move Amplitude` : Elevation of each foot on Z-axis while walking [meter]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image152.jpg" align="bottom" height="200px" />  

* `Yaw Move Amplitude` : Direction of ROBOTIS-OP3's stepping (towards left or right). The head also aims to the rotating direction [Deg]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image3.gif" align="bottom" height="100px" />  


**Balance Parameters**  
* `Balance` : Turn on balance algorithm  

* `Hip Roll Gain` : Gain with respect to the gyroscope roll  
> Recomended : `Hip Roll Gain` : `Ankle Roll Gain` = 1 : 2  

* `Knee Gain(Pitch)` : Gain with respect to the gyroscope pitch  
> Recomended : `KneeGain` : `Ankle Pitch Gain` = 1 : 3  

* `Ankle Roll Gain` : Gain with respect to the gyroscope roll  

* `Ankle Pitch Gain` : Gain with respect to the gyroscope pitch  

* `Y Swap Amplitude` : Amount of swing to the left and right while walking [m]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image153.jpg" align="bottom" height="220px" />  

* `Z Swap Amplitude` : Amplitude of the height of the body while walking [m]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image154.jpg" align="bottom" height="200px" />  

* `Arm Swing Gain` : Arm swing gain with respect to the foot step. If the left foot moves forward then the right arm swings forward as well.  

* `Pelvis Offset` : roll offset (x-coordinate) of the pelvis. Offset values are applied to Dynamixel position values for hip roll joints [Deg]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image155.jpg" align="bottom" height="200px" />  



[&lt;&lt; Back](OP3-User's-Guide.md)
