# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `Pragma` header is not specified for HTTP responses and is therefore not a reliable replacement for the HTTP/1.1 `Cache-Control` header, although its behavior is the same as `Cache-Control: no-cache` if the `Cache-Control` header field is omitted in a request.
> Use `Pragma` only for backwards compatibility with HTTP/1.0 clients.

