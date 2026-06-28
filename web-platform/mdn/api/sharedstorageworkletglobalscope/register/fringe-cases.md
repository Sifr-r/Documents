# Fringe Cases

## Warnings & Notes

> [!NOTE]
> It is possible to define and register multiple operations in the same shared storage worklet module script with different names; see {{domxref("SharedStorageOperation")}} for an example.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if:
    - An operation has already been registered with the specified name.
    - The `operationCtor` is not a valid constructor.
    - The class does not contain a valid `run()` method.
    - The worklet module has not been added with {{domxref("Worklet.addModule", "SharedStorageWorklet.addModule()")}}.

