# Fringe Cases

## Exceptions

The following exceptions can be raised by this method:

- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if the resource represented by the DOM {{DOMxRef("File")}} or {{DOMxRef("Blob")}} cannot be found, e.g., because it has been erased.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if one of the following problematic situation is detected:
    - the resource has been modified by a third party;
    - too many read operations are performed simultaneously;
    - the file pointed by the resource is unsafe for a use from the Web (like it is a system file).
- `NotReadableError` {{domxref("DOMException")}}
  - : Thrown if the resource cannot be read due to a permission problem, like a concurrent lock.
- `EncodingError` {{domxref("DOMException")}}
  - : Thrown if the resource is a data URL and exceed the limit length defined by each browser.

