# Fringe Cases

## Warnings & Notes

> [!NOTE]
> To avoid discarding frames queued via {{domxref("VideoEncoder.encode()", "encode()")}}, {{domxref("VideoEncoder.flush()", "flush()")}} should be called and completed before calling `reset()`.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("VideoEncoder.state","state")}} is `"closed"`.

