# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if:
    - The calling document is not fully active.
    - The crash report key-value store is not yet initialized via an {{domxref("CrashReportContext.initialize", "initialize()")}} call.
- `NotAllowedError` {{domxref("DOMException")}}
  - : The size of the serialized key-value pair is greater than the [`length`](/en-US/docs/Web/API/CrashReportContext/initialize#length) value set when the store was first initialized.

