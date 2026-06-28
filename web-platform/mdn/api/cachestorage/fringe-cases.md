# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `CacheStorage` always rejects with a `SecurityError` on untrusted origins (i.e., those that aren't using HTTPS, although this definition will likely become more complex in the future.) When testing on Firefox, you can get around this by checking the **Enable Service Workers over HTTP (when toolbox is open)** option in the Firefox DevTools options/gear menu. Furthermore, because `CacheStorage` requires file-system access, it may be unavailable in private mode in Firefox.

> [!NOTE]
> {{domxref("CacheStorage.match()")}} is a convenience method. Equivalent functionality to match a cache entry can be implemented by returning an array of cache names from {{domxref("CacheStorage.keys()")}}, opening each cache with {{domxref("CacheStorage.open()")}}, and matching the one you want with {{domxref("Cache.match()")}}.

