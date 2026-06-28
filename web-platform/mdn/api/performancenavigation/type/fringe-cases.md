# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This interface of this property is deprecated in the [Navigation Timing Level 2 specification](https://w3c.github.io/navigation-timing/#obsolete).
> Please use the {{domxref("PerformanceNavigationTiming")}} interface instead.

> [!NOTE]
> Historically, developers tested for a `type` of `"TYPE_BACK_FORWARD"` to get an indication of back/forward cache ({{glossary("bfcache")}}) hit rate. This however did not provide any reasons for bfcache blocking, or any other data. The {{domxref("PerformanceNavigationTiming.notRestoredReasons")}} property should be used to monitor the bfcache, going forward. See [Monitoring bfcache blocking reasons](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons) for more information.

