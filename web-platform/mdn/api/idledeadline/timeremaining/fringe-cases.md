# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The value returned by `timeRemaining()` is an estimate of how much time the user agent believes is available before the next latency-critical task needs to run. This estimate is not fixed and can suddenly drop to 0 if higher-priority work arrives. For example, the browser's estimate can change in the middle of an idle callback if the user clicks. Developers should not assume the value always decreases linearly like a countdown timer.

