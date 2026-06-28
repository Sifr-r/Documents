# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Currently, audio data blocks are always 128 frames
> long—that is, they contain 128 32-bit floating-point samples for each of the inputs'
> channels. However, plans are already in place to revise the specification to allow the
> size of the audio blocks to be changed depending on circumstances (for example, if the
> audio hardware or CPU utilization is more efficient with larger block sizes).
> Therefore, you _must always check the size of the sample array_ rather than
> assuming a particular size.
>
> This size may even be allowed to change over time, so you mustn't look at just the
> first block and assume the sample buffers will always be the same size.

> [!NOTE]
> An absence of the `return` statement means that the method returns `undefined`, and as this is a falsy value, it is like returning `false`.
> Omitting an explicit `return` statement may cause hard-to-detect problems for your nodes.

## Exceptions

As the `process()` method is implemented by the user, it can throw anything.
If an uncaught error is thrown, the node will emit a
{{domxref("AudioWorkletNode.processorerror_event", "processorerror")}} event and will
output silence for the rest of its lifetime.

