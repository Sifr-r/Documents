# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The behavior opted-into by `interpolate-size` cannot be enabled by default across the web because many sites in the wild use stylesheets that assume intrinsic size values cannot be animated. Enabling it by default would cause several backwards-compatibility issues (see relevant [CSS WG discussion](https://github.com/w3c/csswg-drafts/issues/626#issuecomment-2071016522)).

> [!NOTE]
> The {{cssxref("calc-size()")}} function's return values can also be interpolated. In effect, including `calc-size()` in a property value automatically applies `interpolate-size: allow-keywords` to the selection. However, because `interpolate-size` is inherited as explained above, it is the preferred solution for enabling intrinsic size animations in most cases. You should only use `calc-size()` to enable intrinsic size animations if they also require calculations.

