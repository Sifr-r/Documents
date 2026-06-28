# Fringe Cases

## Warnings & Notes

> [!NOTE]
> An `AbortSignal` can only be used once. After it is aborted, any fetch call using the same signal will be immediately rejected.

> [!NOTE]
> Unlike when using {{domxref("AbortSignal/timeout_static", "AbortSignal.timeout()")}}, there is no way to tell whether the final abort was caused by a timeout.

