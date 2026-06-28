# Fringe Cases

## Warnings & Notes

> [!NOTE]
  > Third party window content (e.g., {{htmlelement("iframe")}} content) can access the IndexedDB store for the origin it is embedded into, unless the browser is set to [never accept third party cookies](https://support.mozilla.org/en-US/kb/third-party-cookies-firefox-tracking-protection) (see [Firefox bug 1147821](https://bugzil.la/1147821).)

> [!NOTE]
> In Firefox, if you wish to ensure durability for some reason (e.g., you're storing critical data that cannot be recomputed later) you can force a transaction to flush to disk before delivering the `complete` event by creating a transaction using the experimental (non-standard) `readwriteflush` mode (see {{domxref("IDBDatabase.transaction")}}.) This is currently experimental, and can only be used if the `dom.indexedDB.experimental` pref is set to `true` in `about:config`.

