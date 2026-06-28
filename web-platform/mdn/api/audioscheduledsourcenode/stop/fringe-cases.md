# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If a scheduled stop time occurs before the node's scheduled
> start time, the node never starts to play.

## Exceptions

- `InvalidStateNode` {{domxref("DOMException")}}
  - : Thrown if the node has not been started by calling {{domxref("AudioScheduledSourceNode.start", "start()")}}.
- {{jsxref("RangeError")}}
  - : Thrown if the value specified for `when` is negative.

