# Fringe Cases

## Exceptions

- `indexSizeError`
  - : One of the input parameters has a value that is outside the accepted range:
    - The value of `channelNumber` specifies a channel number
      which doesn't exist (that is, it's greater than or equal to the value of
      {{domxref("AudioBuffer.numberOfChannels", "numberOfChannels")}} on the channel).
    - The value of `startInChannel` is outside the current range
      of samples that already exist in the source buffer; that is, it's greater than its
      current {{domxref("AudioBuffer.length", "length")}}.

