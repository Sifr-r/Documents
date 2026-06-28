# Fringe Cases

## Warnings & Notes

> [!NOTE]
> For a more complete example showing `start()` in use, check out our {{domxref("BaseAudioContext/decodeAudioData", "AudioContext.decodeAudioData()")}} example. You can also [try the example live](https://mdn.github.io/webaudio-examples/decode-audio-data/promise/), and have a look at [the example source](https://github.com/mdn/webaudio-examples/tree/main/decode-audio-data).

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if a negative value was specified for one or more of the three time parameters. Please
    don't attempt to tamper with the laws of temporal physics.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if `start()` has already been called. You can only call this function once
    during the lifetime of an `AudioBufferSourceNode`.

