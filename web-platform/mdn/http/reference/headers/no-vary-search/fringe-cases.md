# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Additional care must be taken when using prerender with `No-Vary-Search` since the page may initially be prerendered with different URL parameters. `No-Vary-Search` is used for URL parameters that deliver the same resource from the server, but are used by the client for various reasons (client-side rendering, UTM parameters for analytics measurement, etc.). As the initial prerender may be for different URL parameters, any code depending on them should only run after prerender activation.

> [!NOTE]
> If a parameter is excluded from the cache key using `params`, if it is included in the URL it will be ignored for the purposes of cache matching, regardless of where it appears in the parameter list.

> [!NOTE]
> As a [structured field](https://www.rfc-editor.org/info/rfc8941/), the parameters should be space-separated, quoted strings — as shown above — and not comma-separated, which developers may be more used to.

