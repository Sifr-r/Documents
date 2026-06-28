# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Historically, the deprecated {{domxref("PerformanceNavigation.type")}} property was used to monitor the bfcache, with developers testing for a `type` of `"TYPE_BACK_FORWARD"` to get an indication of the bfcache hit rate. This however did not provide any reasons for bfcache blocking, or any other data. The `notRestoredReasons` property should be used to monitor bfcache blocking, going forward.

> [!NOTE]
> This article is adapted from [Back/forward cache notRestoredReasons API](https://developer.chrome.com/docs/web-platform/bfcache-notrestoredreasons/) by Chris Mills and Barry Pollard, originally published on `developer.chrome.com` in 2023 under the [Creative Commons Attribution 4.0 License](https://creativecommons.org/licenses/by/4.0/).

