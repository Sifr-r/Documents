# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The {{HTTPHeader("Vary")}} header is used in responses to indicate that a different resource is sent for every different value of the header (see [HTTP Caching Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary)).
> Even if `Downlink` is used to configure what resources are sent, consider omitting it in the {{HTTPHeader("Vary")}} header — it is likely to change often, which effectively makes the resource uncacheable.

