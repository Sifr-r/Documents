# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Once the fetch request is sent, its response — including the body and headers — is not made available and will be ignored.

> [!NOTE]
> The actual sending time is unknown, as the browser may wait for a longer or shorter period of time, for example to optimize batching of deferred fetches.

## Exceptions

The [same exceptions for `fetch()`](/en-US/docs/Web/API/Window/fetch#exceptions) can be raised for `fetchLater()`, along with the following additional exceptions:

- {{domxref("QuotaExceededError")}}
  - : Use of this feature was blocked due to exceeding the available quota. See [`fetchLater()` quotas](/en-US/docs/Web/API/Fetch_API/Using_Deferred_Fetch#quotas) for more details. Callers of `fetchLater()` should be defensive and catch `QuotaExceededError` errors in almost all cases, especially if they are embedding third-party JavaScript.

- `RangeError` {{domxref("DOMException")}}
  - : Thrown when a negative `activateAfter` value is specified.

- `TypeError` {{domxref("DOMException")}}
  - : In addition to the reasons for `fetch()`, this exception will also be thrown for a {{domxref("ReadableStream")}} request (which cannot be deferred) or for use of untrustworthy URLs (such as `http://`).

