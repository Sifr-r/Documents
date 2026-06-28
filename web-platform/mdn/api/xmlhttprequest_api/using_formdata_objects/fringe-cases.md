# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The fields `"avatar"` and `"webmasterFile"` both contain a file. The number assigned to the field `"accountNum"` is immediately converted into a string by the [`FormData.append()`](/en-US/docs/Web/API/FormData/append) method (the field's value can be a {{ domxref("Blob") }}, {{ domxref("File") }}, or a string. If the value is neither a `Blob` nor a `File`, the value is converted to a string).

> [!NOTE]
> `FormData` will only use input fields that use the `name` attribute.

> [!NOTE]
> If you pass in a reference to the form, the [request HTTP method](/en-US/docs/Web/HTTP/Reference/Methods) specified in the form will be used over the method specified in the `open()` call.

> [!WARNING]
> When using `FormData` to submit POST requests using {{ domxref("XMLHttpRequest") }} or the [Fetch API](/en-US/docs/Web/API/Fetch_API) with the `multipart/form-data` content type (e.g., when uploading files and blobs to the server), _do not_ explicitly set the [`Content-Type`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Type) header on the request. Doing so will prevent the browser from being able to set the `Content-Type` header with the boundary expression it will use to delimit form fields in the request body.

