# Fringe Cases

## Exceptions

The returned `Promise` rejects with one of the following exceptions:

- `InvalidStateError` {{domxref("DOMException")}}
  - : If `getSignals()` is called when the port is not open. Call {{domxref("SerialPort.open()")}} to open the port first.
- `NetworkError` {{domxref("DOMException")}}
  - : If the signals on the device could not be read.

