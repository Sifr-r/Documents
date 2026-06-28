# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if `data` is not a valid sequence, or does not contain a valid MIDI message.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if `data` is a system exclusive message, and the {{domxref("MIDIAccess")}} did not enable exclusive access.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the port is disconnected.

