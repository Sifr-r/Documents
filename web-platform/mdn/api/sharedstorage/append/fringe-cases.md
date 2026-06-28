# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the specified `key` isn't found in the shared storage, the `append()` operation is equivalent to {{domxref("SharedStorage.set", "set()")}}, that is, a new key-value pair with the specified `key` is added to the shared storage.

> [!NOTE]
> In the case of {{domxref("WindowSharedStorage")}}, if the `append()` operation doesn't successfully write to the database for a reason other than shared storage not being available, no error is thrown — the operation still fulfills with `undefined`.

## Exceptions

- The `Promise` rejects with a {{jsxref("TypeError")}} if:
  - The appended entry was not successfully stored in the database due to shared storage not being available (for example it is disabled using a browser setting).
  - `key` and/or `value` exceed the browser-defined maximum length.
  - The calling site does not have the Shared Storage API included in a successful [privacy sandbox enrollment process](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox#enrollment).
- In the case of {{domxref("WorkletSharedStorage")}}, the `Promise` rejects with a {{jsxref("TypeError")}} if the worklet module has not been added with {{domxref("Worklet.addModule", "SharedStorageWorklet.addModule()")}}.

> [!NOTE]

