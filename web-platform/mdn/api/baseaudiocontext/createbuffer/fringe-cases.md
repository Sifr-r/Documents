# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `createBuffer()` used to be able to take compressed
> data and give back decoded samples, but this ability was removed from the specification,
> because all the decoding was done on the main thread, so
> `createBuffer()` was blocking other code execution. The asynchronous method
> `decodeAudioData()` does the same thing — takes compressed audio, such as an
> MP3 file, and directly gives you back an {{ domxref("AudioBuffer") }} that you can
> then play via an {{ domxref("AudioBufferSourceNode") }}. For simple use cases
> like playing an MP3, `decodeAudioData()` is what you should be using.

> [!NOTE]
> Audio resampling is very similar to image resizing: say you've
> got a 16 x 16 image, but you want it to fill a 32x32 area: you resize (resample) it.
> the result has less quality (it can be blurry or edgy, depending on the resizing
> algorithm), but it works, and the resized image takes up less space. Resampled audio
> is exactly the same — you save space, but in practice you will be unable to properly
> reproduce high frequency content (treble sound).

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if one or more of the options are negative or otherwise has an invalid value (such as
    `numberOfChannels` being higher than supported, or a
    `sampleRate` outside the nominal range).
- {{jsxref("RangeError")}}
  - : Thrown if there isn't enough memory available to allocate the buffer.

