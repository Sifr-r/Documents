# Fringe Cases

## Warnings & Notes

> [!NOTE]
> While memory management and resource management are two separate topics, sometimes you can hook into the memory management system to do resource management, as a last resort. For example, if you have a JavaScript object representing a handle of an external resource, you can create a {{jsxref("FinalizationRegistry")}} to clean up the resource when the handle is garbage collected, because there is definitely no way to access the resource afterwards. However, there is no guarantee that the finalizer will run, so it's not a good idea to rely on it for critical resources.

> [!NOTE]
> At the time of writing, {{domxref("ReadableStreamDefaultReader")}} does not implement the disposable protocol. This is a hypothetical example.

