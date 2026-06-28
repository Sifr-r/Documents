# Fringe Cases

## Warnings & Notes

> [!NOTE]
> See [The Web Workers API landing page](/en-US/docs/Web/API/Web_Workers_API) for reference documentation on workers and additional guides.

> [!NOTE]
> Bundlers, including [webpack](https://webpack.js.org/guides/web-workers/), [Vite](https://vite.dev/guide/features.html#web-workers), and [Parcel](https://parceljs.org/languages/javascript/#web-workers), recommend passing URLs that are resolved relative to [`import.meta.url`](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta#url) to the `Worker()` constructor. For example:
>
> ```js
> const myWorker = new Worker(new URL("worker.js", import.meta.url));
> ```
>
> This way, the path is relative to the current script instead of the current HTML page, which allows the bundler to safely do optimizations like renaming (because otherwise the `worker.js` URL may point to a file not controlled by the bundler, so it cannot make any assumptions).

> [!NOTE]
> Notice that `onmessage` and `postMessage()` need to be hung off the `Worker` object when used in the main script thread, but not when used in the worker. This is because, inside the worker, the worker is effectively the global scope.

> [!NOTE]
> When a message is passed between the main thread and worker, it is copied or "transferred" (moved), not shared. Read [Transferring data to and from workers: further details](#transferring_data_to_and_from_workers_further_details) for a much more thorough explanation.

> [!NOTE]
> Scripts may be downloaded in any order, but will be executed in the order in which you pass the filenames into `importScripts()`. This is done synchronously; `importScripts()` does not return until all the scripts have been loaded and executed.

> [!NOTE]
> If SharedWorker can be accessed from several browsing contexts, all those browsing contexts must share the exact same origin (same protocol, host, and port).

> [!NOTE]
> In Firefox, shared workers cannot be shared between documents loaded in private and non-private windows ([Firefox bug 1177621](https://bugzil.la/1177621)).

> [!NOTE]
> When using the `start()` method to open the port connection, it needs to be called from both the parent thread and the worker thread if two-way communication is needed.

> [!NOTE]
> You can test whether a method or interface is available to workers using the [Worker Playground](https://mdn.github.io/dom-examples/web-workers/worker-playground/).

> [!NOTE]
> For a complete list of functions available to workers, see [Functions and interfaces available to workers](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers).

