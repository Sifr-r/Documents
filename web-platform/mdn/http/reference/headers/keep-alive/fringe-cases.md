# Fringe Cases

## Warnings & Notes

> [!NOTE]
> For `Keep-Alive` to have any effect, the message must also include a {{HTTPHeader("Connection", "Connection: keep-alive")}} header.

> [!WARNING]
> Connection-specific header fields such as {{HTTPHeader("Connection")}} and `Keep-Alive` are prohibited in [HTTP/2](https://httpwg.org/specs/rfc9113.html#ConnectionSpecific) and [HTTP/3](https://httpwg.org/specs/rfc9114.html#header-formatting).
> Chrome and Firefox ignore them in HTTP/2 responses, but Safari conforms to the HTTP/2 specification requirements and does not load any response that contains them.

