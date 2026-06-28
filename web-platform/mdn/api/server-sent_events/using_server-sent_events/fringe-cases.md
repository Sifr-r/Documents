# Fringe Cases

## Warnings & Notes

> [!WARNING]
> When **not used over HTTP/2**, SSE suffers from a limitation to the maximum number of open connections, which can be especially painful when opening multiple tabs, as the limit is _per browser_ and is set to a very low number (6). The issue has been marked as "Won't fix" in [Chrome](https://crbug.com/275955) and [Firefox](https://bugzil.la/906896). This limit is per browser + domain, which means that you can open 6 SSE connections across all of the tabs to `www.example1.com` and another 6 SSE connections to `www.example2.com` (per [Stack Overflow](https://stackoverflow.com/questions/5195452/websockets-vs-server-sent-events-eventsource/5326159)). When using HTTP/2, the maximum number of simultaneous _HTTP streams_ is negotiated between the server and the client (defaults to 100).

> [!NOTE]
> You can find a full example that uses the code shown in this article on GitHub — see [Simple SSE demo using PHP](https://github.com/mdn/dom-examples/tree/main/server-sent-events).

> [!NOTE]
> The comment line can be used to prevent connections from timing out; a server can send a comment periodically to keep the connection alive.

> [!NOTE]
> If a line doesn't contain a colon, the entire line is treated as the field name with an empty value string.

