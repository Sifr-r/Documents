# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The {{domxref("IIRFilterNode.IIRFilterNode", "IIRFilterNode()")}}
> constructor is the recommended way to create an {{domxref("IIRFilterNode")}}; see
> [Creating an AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if all of the `feedforward` coefficients are 0, or if the first
    `feedback` coefficient is 0.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if one or both of the input arrays exceeds 20 members.

