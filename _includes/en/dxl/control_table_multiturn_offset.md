Adjusts offset position. This offset value is added to the [Present Position(36)](#present-position).  
Initial value is 0 and the range is from -24,576 to 24,576.  
DYNAMIXEL with a Present position of 2,048 with an offset of 1,024 will return an adjusted Present position of 3,072.

![](/assets/images/dxl/mx/mx-12_multiturn_offset.jpg)

**NOTE** : The [Multiturn Offset(20)](#multi-turn-offset) and [Resolution Divider(22)](#resolution-divider) can be applied in Munti-turn Mode only (The condition that both CW and CCW are 0, see [CW/CCW Angle Limit(6, 8)](#cwccw-angle-limit6-8) for more operation types.), otherwise, the set value in Multiturn Offset(20) and Resolution Divider(22) is ignored in different operation types.  
{: .notice}
