# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Your callback function must call `requestAnimationFrame()` again if
> you want to animate another frame. `requestAnimationFrame()` is one-shot.

> [!WARNING]
> Be sure always to use the first argument (or some other method for
> getting the current time) to calculate how much the animation will progress in
> a frame — **otherwise, the animation will run faster on high refresh-rate screens**.
> For ways to do that, see the examples below.

> [!WARNING]
> The request ID is typically implemented as a per-window incrementing counter. Therefore, even when it starts counting at 1, it may overflow and end up reaching 0.
> While unlikely to cause issues for short-lived applications, you should avoid `0` as a sentinel value for invalid request identifier IDs and instead prefer unattainable values such as `null`.
> The spec doesn't specify the overflowing behavior, so browsers have divergent behaviors. When overflowing, the value would either wrap around to 0, to a negative value, or fail with an error.
> Unless overflow throws, request IDs are also not truly unique because there are only finitely many 32-bit integers for possibly infinitely many callbacks.
> Note, however, that it would take approximately 800 days to reach the issue when rendering at 60Hz with a single call to `requestAnimationFrame()` per frame.

> [!NOTE]
> This example does not allow you to synchronize animation callbacks reliably.

