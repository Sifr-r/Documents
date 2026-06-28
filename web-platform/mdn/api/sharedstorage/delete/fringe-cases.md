# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the key-value pair doesn't exist in the shared storage, no error is thrown — the operation still fulfills with `undefined`.

> [!NOTE]
> In the case of {{domxref("WindowSharedStorage")}}, if the `delete()` operation doesn't successfully write to the database for a reason other than shared storage not being available, no error is thrown — the operation still fulfills with `undefined`.

## Exceptions

- The `Promise` rejects with a {{jsxref("TypeError")}} if:
  - The database was not cleared successfully due to shared storage not being available (for example it is disabled using a browser setting).
  - `key` exceeds the browser-defined maximum length.
  - The calling site does not have the Shared Storage API included in a successful [privacy sandbox enrollment process](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox#enrollment).
- In the case of {{domxref("WorkletSharedStorage")}}, the `Promise` rejects with a {{jsxref("TypeError")}} if:
  - The worklet module has not been added with {{domxref("Worklet.addModule", "SharedStorageWorklet.addModule()")}}.

> [!NOTE]

> [!NOTE]

