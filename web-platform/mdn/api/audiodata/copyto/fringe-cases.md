# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the `AudioData` object has been [transferred](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).
- {{jsxref("RangeError")}}
  - : Thrown if one of the following conditions is met:
    - The length of the sample is longer than the destination length.
    - The format of the `AudioData` object describes a planar format, but `options.planeIndex` is outside of the number of planes available.
    - The format of the `AudioData` object describes an interleaved format, but `options.planeIndex` is greater than `0`.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the specified [`format`](#format) to convert the data to is not supported.

