# Fringe Cases

## Warnings & Notes

> [!NOTE]
        > You can request unknown limits when requesting a GPU device without causing an error. Such limits will be `undefined`. This is useful because it makes WebGPU code less brittle — a codebase won't stop working because a limit no longer exists in the adapter.

## Exceptions

- `OperationError` {{domxref("DOMException")}}
  - : The promise rejects with an `OperationError` if either:
    - The limits included in the `requiredLimits` property are not supported by the {{domxref("GPUAdapter")}}, either because they are not valid limits, or because their values are higher than the adapter's values for those limits.
    - The `GPUAdapter` has been consumed by having `requestDevice()` called on it previously.
- `TypeError` {{domxref("DOMException")}}
  - : The promise rejects with a `TypeError` if the features included in the `requiredFeatures` property are not supported by the {{domxref("GPUAdapter")}}.

