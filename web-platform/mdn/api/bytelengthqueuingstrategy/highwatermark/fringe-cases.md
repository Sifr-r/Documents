# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Unlike [`CountQueuingStrategy()`](/en-US/docs/Web/API/CountQueuingStrategy/CountQueuingStrategy) where the `highWaterMark` property specifies a simple count of the number of chunks, with `ByteLengthQueuingStrategy()`, the `highWaterMark` parameter specifies a number of _bytes_ — specifically, given a stream of chunks, how many bytes worth of those chunks (rather than a count of how many of those chunks) can be contained in the internal queue before backpressure is applied.

