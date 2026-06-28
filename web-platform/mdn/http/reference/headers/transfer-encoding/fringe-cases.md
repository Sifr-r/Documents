# Fringe Cases

## Warnings & Notes

> [!WARNING]
> HTTP/2 disallows all uses of the `Transfer-Encoding` header.
> HTTP/2 and later provide more efficient mechanisms for data streaming than chunked transfer.
> Usage of the header in HTTP/2 may likely result in a specific `protocol error`.

