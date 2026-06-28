# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This header is one part of the "Extensible Prioritization Scheme for HTTP" defined in {{rfc("9218")}}.
> There are also HTTP/2 and HTTP/3 `PRIORITY_UPDATE` frames that can be used to re-prioritize a resource request after it has been sent.
> The request can be sent in any HTTP version.

> [!NOTE]
> Servers are expected to ignore directives on this header that they do not understand.
> New directives that are added in future are expected to be compatible with these existing directives so that they can be safely ignored.

> [!NOTE]
> The requests above use the human-readable format from the HTTP/2 or HTTP/3 specifications.
> The HTTP/1.1 format used in most of this documentation would be something like:
>
> ```http
> GET /style.css HTTP/1.1
> Host: example.net
> Priority: u=2
> ```

