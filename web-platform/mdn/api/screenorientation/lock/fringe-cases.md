# Fringe Cases

## Exceptions

The promise may be rejected with the following exceptions:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the document is not fully active.

- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the document's visibility state is hidden or if the document is forbidden to use the feature (for example, by omitting the keyword `allow-orientation-lock` of the `sandbox` attribute of the `iframe` element).

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the user agent does not support locking the screen orientation of the specific orientation.

- `AbortError` {{domxref("DOMException")}}
  - : Thrown if there is any other `lock()` method invoking or if {{domxref("ScreenOrientation/unlock","unlock()")}} is called while the lock promise is pending.

