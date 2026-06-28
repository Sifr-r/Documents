# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > Some browsers save `state` objects to the user's disk so they can be restored after the user restarts the browser, and impose a size limit on the serialized representation of a `state` object, and will throw an exception if you pass a `state` object whose serialized representation is larger than that size limit. So in cases where you want to ensure you have more space than what some browsers might impose, you're encouraged to use {{domxref("Window.sessionStorage", "sessionStorage")}} and/or {{domxref("Window.localStorage", "localStorage")}}.

## Exceptions

- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the associated document is not fully active, or if the provided `url` parameter is not a valid URL, or if the method is called too frequently.
- `DataCloneError` {{domxref("DOMException")}}
  - : Thrown if the provided `state` parameter is not serializable.

