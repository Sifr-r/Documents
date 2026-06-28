# Fringe Cases

## Warnings & Notes

> [!NOTE]
> It's usually preferable to make HTTP requests using the [Fetch API](/en-US/docs/Web/API/Fetch_API) instead of {{domxref("XMLHttpRequest")}}. However, in this case we want to show the user the upload progress, and this feature is still not supported by the Fetch API, so the example uses `XMLHttpRequest`.
>
> Work to track standardization of progress notifications using the Fetch API is at <https://github.com/whatwg/fetch/issues/607>.

