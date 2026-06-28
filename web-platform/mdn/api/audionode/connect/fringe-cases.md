# Fringe Cases

## Exceptions

- `IndexSizeError` {{domxref("DOMException")}}
  - : Thrown if the value specified as `outputIndex` or `inputIndex` doesn't correspond to an existing input or output.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if the destination node is not part of the same audio context as the source node.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the specified connection would create a cycle (in which the audio loops back through
    the same nodes repeatedly) and there are no {{domxref("DelayNode")}} objects in the cycle to
    prevent the resulting waveform from getting stuck constructing the same audio frame
    indefinitely. Also thrown if the `inputIndex` parameter is used while the destination is an {{domxref("AudioParam")}}.

