# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The key matching algorithm depends on the [VARY header](https://www.fastly.com/blog/best-practices-using-vary-header) in the value. So matching a new key requires looking at both key and value for entries in the `Cache` object.

> [!NOTE]
> The caching API doesn't honor HTTP caching headers.

> [!NOTE]
> In Chrome, visit `chrome://inspect/#service-workers` and click on the "inspect" link below the registered service worker to view logging statements for the various actions the [`service-worker.js`](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/selective-caching/service-worker.js) script is performing.

