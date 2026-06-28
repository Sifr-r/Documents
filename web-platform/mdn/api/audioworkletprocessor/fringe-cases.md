# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `AudioWorkletProcessor` and classes that derive from it cannot be instantiated directly from a user-supplied code. Instead, they are created only internally by the creation of an associated {{domxref("AudioWorkletNode")}}s. The constructor of the deriving class is getting called with an options object, so you can perform a custom initialization procedures — see constructor page for details.

