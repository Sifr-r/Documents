# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Connection-specific header fields such as `Connection` and {{HTTPHeader("Keep-Alive")}} are prohibited in [HTTP/2](https://httpwg.org/specs/rfc9113.html#ConnectionSpecific) and [HTTP/3](https://httpwg.org/specs/rfc9114.html#header-formatting).
> Chrome and Firefox ignore them in HTTP/2 responses, but Safari conforms to the HTTP/2 spec requirements and does not load any response that contains them.

