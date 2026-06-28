# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Poor support for HTTP delta encodings means there are few implementations.
> Instead, most systems rely solely on [compression methods](/en-US/docs/Web/HTTP/Guides/Compression) to reduce bandwidth, although a combination of compression and delta encodings is possible.
>
> Even if the client and server support delta encodings, proxies or caches may not, and the complexity of adding HTTP delta encodings to a system may outweigh the benefits.

