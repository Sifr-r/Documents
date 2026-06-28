# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Read/write protection is done on a [per-job](/en-US/docs/Web/JavaScript/Reference/Execution_model#job_queue_and_event_loop) basis, which means only the _synchronous code_ within the `dragstart` handler can modify the data store. If you try to access the data store after an asynchronous operation, you will no longer have write permissions. For example, this does not work:
>
> ```js example-bad
> function dragstartHandler(ev) {
>   canvas.toBlob((blob) => {
>     ev.dataTransfer.items.add(new File([blob], "image.png"));
>   });
> }
> ```

> [!WARNING]
> The `text/plain` fallback for multiple links should include all URLs, but no comments.

