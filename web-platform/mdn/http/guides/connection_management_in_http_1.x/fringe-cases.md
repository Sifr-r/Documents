# Fringe Cases

## Warnings & Notes

> [!NOTE]
> HTTP/2 adds additional models for connection management.

> [!NOTE]
> Unless dealing with a very old system, which doesn't support a persistent connection, there is no compelling reason to use this model.

> [!NOTE]
> HTTP pipelining is not activated by default in modern browsers:
>
> - Buggy [proxies](https://en.wikipedia.org/wiki/Proxy_server) are still common and these lead to strange and erratic behaviors that Web developers cannot foresee and diagnose easily.
> - Pipelining is complex to implement correctly: the size of the resource being transferred, the effective [RTT](https://en.wikipedia.org/wiki/Round-trip_delay_time) that will be used, as well as the effective bandwidth, have a direct incidence on the improvement provided by the pipeline. Without knowing these, important messages may be delayed behind unimportant ones. The notion of important even evolves during page layout! HTTP pipelining therefore brings a marginal improvement in most cases only.
> - Pipelining is subject to the {{glossary("head of line blocking", "head-of-line blocking")}}.
>
> For these reasons, pipelining has been superseded by a better algorithm, _multiplexing_, that is used by HTTP/2.

> [!NOTE]
> Unless you have a very specific immediate need, don't use this deprecated technique; switch to HTTP/2 instead. In HTTP/2, domain sharding is no longer useful: the HTTP/2 connection is able to handle parallel unprioritized requests very well. Domain sharding is even detrimental to performance. Most HTTP/2 implementations use a technique called [connection coalescing](https://daniel.haxx.se/blog/2016/08/18/http2-connection-coalescing/) to revert eventual domain sharding.

