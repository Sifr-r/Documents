# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the server doesn't provide a
> [`Content-Type`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Type)
> header, {{domxref("XMLHttpRequest")}} assumes that the MIME type is
> `"text/xml"`. If the content isn't valid XML, an "XML Parsing Error: not
> well-formed" error occurs. You can avoid this by calling
> `overrideMimeType()` to specify a different type.

