# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Version numbers are integers, so the values passed are subject to rounding—for example, values of 2.1 and 2.4 are both rounded to 2.
> Attempting to upgrade between numbers that round to the same integer will not fire an `onupgradeneeded` event.
> When working with large version numbers please also note the [range of integers](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_encoding) representable in JavaScript.

> [!NOTE]
> As of Firefox 40, IndexedDB transactions have relaxed durability guarantees to increase performance (see [Firefox bug 1112702](https://bugzil.la/1112702).) Previously in a `readwrite` transaction, a {{domxref("IDBTransaction.complete_event", "complete")}} event was fired only when all data was guaranteed to have been flushed to disk. In Firefox 40+ the `complete` event is fired after the OS has been told to write the data but potentially before that data has actually been flushed to disk. The `complete` event may thus be delivered quicker than before, however, there exists a small chance that the entire transaction will be lost if the OS crashes or there is a loss of system power before the data is flushed to disk. Since such catastrophic events are rare most consumers should not need to concern themselves further. If you must ensure durability for some reason (e.g., you're storing critical data that cannot be recomputed later) you can force a transaction to flush to disk before delivering the `complete` event by creating a transaction using the experimental (non-standard) `readwriteflush` mode (see {{domxref("IDBDatabase.transaction")}}).

> [!NOTE]
> In this case we've had to specify a `readwrite` transaction because we want to write to the database, not just read from it.

> [!NOTE]
> Alternatively, you can use `getAll()` to handle this case (and `getAllKeys()`). The following code does precisely the same thing as above:
>
> ```js
> objectStore.getAll().onsuccess = (event) => {
>   console.log(`Got all customers: ${event.target.result}`);
> };
> ```
>
> There is a performance cost associated with looking at the `value` property of a cursor, because the object is created lazily. When you use `getAll()` for example, the browser must create all the objects at once. If you're just interested in looking at each of the keys, for instance, it is much more efficient to use a cursor than to use `getAll()`. If you're trying to get an array of all the objects in an object store, though, use `getAll()`.

## Security Notes

IndexedDB uses the same-origin principle, which means that it ties the store to the origin of the site that creates it (typically, this is the site domain or subdomain), so it cannot be accessed by any other origin.

Third party window content (e.g., {{htmlelement("iframe")}} content) cannot access IndexedDB if the browser is set to [never accept third party cookies](https://support.mozilla.org/en-US/kb/third-party-cookies-firefox-tracking-protection) (see [Firefox bug 1147821](https://bugzil.la/1147821)).

