# Fringe Cases

## Warnings & Notes

> [!NOTE]
> _All events named `load` will not propagate to `Window`_, even with `bubbles` initialized to `true`. To catch `load` events on the `window`, that `load` event must be dispatched directly to the `window`.

> [!NOTE]
> The `load` event that is dispatched when the main document has loaded _is_ dispatched on the `window`, but has two mutated properties: `target` is `document`, and `path` is `undefined`. These two properties are mutated due to legacy conformance.

