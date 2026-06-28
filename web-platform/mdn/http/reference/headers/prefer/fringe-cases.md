# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Browsers have no handling for the `Prefer` and {{HTTPHeader("Preference-Applied")}} headers: they are used in custom, implementation-specific clients.
> Ensure both client and server support this header before relying on it in production.
>
> Servers should silently ignore preferences that they do not support, as though the header were not present.

