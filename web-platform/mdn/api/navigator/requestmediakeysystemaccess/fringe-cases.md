# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > Either `videoCapabilities` or `audioCapabilities` may be empty, but not both!

## Exceptions

In case of an error, the returned {{jsxref('Promise')}} is rejected with a {{domxref('DOMException')}} whose name indicates what kind of error occurred.

- `NotSupportedError` {{domxref("DOMException")}}
  - : Either the specified `keySystem` isn't supported by the platform or the browser, or none of the configurations specified by `supportedConfigurations` can be satisfied (if, for example, none of the `codecs` specified in `contentType` are available).
- `SecurityError` {{domxref("DOMException")}}
  - : Use of this feature was blocked by [`Permissions-Policy: encrypted-media`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/encrypted-media).
- {{jsxref("TypeError")}}
  - : Either `keySystem` is an empty string or the `supportedConfigurations` array is empty.

