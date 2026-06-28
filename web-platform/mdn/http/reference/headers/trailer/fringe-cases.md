# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The {{HTTPHeader("TE")}} request header needs to be set to `trailers` to allow trailer fields.

> [!WARNING]
> Developers cannot access HTTP trailers via the Fetch API or XHR.
> Additionally, browsers ignore HTTP trailers, with the exception of {{HTTPHeader("Server-Timing")}}.
> See [Browser compatibility](#browser_compatibility) for more information.

