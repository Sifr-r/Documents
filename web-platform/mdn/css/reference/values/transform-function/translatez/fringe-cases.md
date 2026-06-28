# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `translateZ(tz)` is equivalent to
> `translate3d(0, 0, tz)`.

> [!NOTE]
> As the composition of transforms isn't commutative, the order you write the different functions is significant. In particular, in general, you want `perspective()` to be placed before `translateZ()`.

