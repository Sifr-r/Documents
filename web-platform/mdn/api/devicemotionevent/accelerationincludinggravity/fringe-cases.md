# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `accelerationIncludingGravity`'s name can be misleading. This property represents acceleration including _the effects of_ gravity. For example, if a device is lying flat on a horizontal surface with the screen pointing up, gravity would be -9.8 along the Z axis, while `acceleration.z` would be 0 and `accelerationIncludingGravity.z` would be 9.8. Similarly, if a device is in free fall with its screen horizontal and pointing up, gravity would be -9.8 along the Z axis, while `acceleration.z` would be -9.8 and `accelerationIncludingGravity.z` would be 0.

