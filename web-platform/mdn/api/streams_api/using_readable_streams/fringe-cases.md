# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This article assumes that you understand the use cases of readable streams, and are aware of the high-level concepts. If not, we suggest that you first read the [Streams concepts and usage overview](/en-US/docs/Web/API/Streams_API#concepts_and_usage) and dedicated [Streams API concepts](/en-US/docs/Web/API/Streams_API/Concepts) article, then come back.

> [!NOTE]
> If you are looking for information on writable streams try [Using writable streams](/en-US/docs/Web/API/Streams_API/Using_writable_streams) instead.

> [!NOTE]
> `close()` is part of the new custom stream, not the original stream we are discussing here. We'll explain more about the custom stream in the next section.

> [!NOTE]
> The function looks as if `pump()` calls itself and leads to a potentially deep recursion.
> However, because `pump` is asynchronous and each `pump()` call is at the end of the promise handler, it's actually analogous to a chain of promise handlers.

> [!NOTE]
> This fetch operation is _mocked_ for the purpose of demonstration, and just returns a `ReadableStream` that generates random chunks of text.
> The "Underlying source" on the left below is the data being generated in the mocked source, while the column on the right is log from the consumer.
> (The code for the mocked source is not displayed as it is not relevant to the example.)

> [!NOTE]
> In order to consume a stream using {{domxref("FetchEvent.respondWith()")}}, the enqueued stream contents must be of type {{jsxref("Uint8Array")}}; for example, encoded using {{domxref("TextEncoder")}}.

