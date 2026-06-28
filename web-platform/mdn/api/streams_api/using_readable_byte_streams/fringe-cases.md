# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Readable byte streams are almost identical to "normal" readable streams and almost all of the concepts are the same.
> This article assumes that you already understand those concepts and will only be covering them superficially (if at all).
> If you're not familiar with the relevant concepts, please first read: [Using readable streams](/en-US/docs/Web/API/Streams_API/Using_readable_streams), [Streams concepts and usage overview](/en-US/docs/Web/API/Streams_API#concepts_and_usage), and [Streams API concepts](/en-US/docs/Web/API/Streams_API/Concepts).

> [!NOTE]
> An underlying byte source can also be used with a default reader.
> If automatic buffer allocation is enabled the controller will supply fixed-size buffers for zero-copy transfers when there is an outstanding request from a reader and the stream's internal queues are empty.
> If automatic buffer allocation is not enabled then all data from the byte stream will always be enqueued.
> This is similar to the behavior shown in the "pull: underlying byte source examples.

> [!NOTE]
> A similar class is used for all the "pull source" examples.
> It is shown here for information only (so that it is obvious that it is a mock).

