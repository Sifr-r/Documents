# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > The result of [the structured clone algorithm](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm)
    > applied to the object is also internally passed into the associated {{domxref("AudioWorkletProcessor.AudioWorkletProcessor", "AudioWorkletProcessor()")}} constructor
    > — this allows custom initialization of an underlying user-defined {{domxref("AudioWorkletProcessor")}}.

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : The specified `options.outputChannelCount` is `0` or larger
    than the current implementation supports.

    Both `options.numberOfInputs` and `options.numberOfOutputs` are 0.

- `IndexSizeError` {{domxref("DOMException")}}
  - : The length of `options.outputChannelCount` array does not match
    `options.numberOfOutputs`.

