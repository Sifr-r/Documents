# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the [task priority](#task_priorities) never needs to be changed, you can use an {{domxref("AbortController")}} and its associated {{domxref("AbortSignal")}} instead of {{domxref("TaskController")}} and {{domxref("TaskSignal")}}.

> [!NOTE]
> Setting and changing task priorities using a signal only works when the `options.priority` argument to `postTask()` is not set, and when the `options.signal` is a {{domxref("TaskSignal")}} (and not an {{domxref("AbortSignal")}}).

