# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The [Run output gate](/en-US/docs/Web/API/Shared_Storage_API#run) is intended as a generic way to process some shared storage data.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if:
    - The worklet module has not yet been added with {{domxref("Worklet.addModule", "addModule()")}}.
    - Shared storage is disabled (for example via a browser setting).
    - The calling site does not have the Shared Storage API included in a successful [privacy sandbox enrollment process](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox#enrollment).

