# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When sending data in a series of chunks, the `Content-Length` header is omitted, and at the beginning of each chunk, the length of the current chunk needs to be included in hexadecimal format.
> See {{HTTPHeader("Transfer-Encoding")}} for more details.

