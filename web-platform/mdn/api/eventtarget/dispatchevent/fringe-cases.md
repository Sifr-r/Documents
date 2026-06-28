# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When calling this method, the {{domxref("Event.target")}} property is initialized to the current `EventTarget`.

> [!WARNING]
> Exceptions thrown by event handlers are reported as uncaught exceptions. The event
> handlers run on a nested callstack; they block the caller until they complete, but
> exceptions do not propagate to the caller.

## Exceptions

- `InvalidStateError` {{domxref("DomException")}}
  - : Thrown if the event's type was not specified during event initialization.

> [!WARNING]

