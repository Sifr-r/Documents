# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This feature is currently opposed by one browser vendor.
> See the [Standards positions](#standards_positions) section below for details.

> [!NOTE]
> More output gates will likely be added in the future to support additional use cases.

> [!NOTE]
> The `ignoreIfPresent: true` option causes the `set()` function to abort if the shared storage already contains a data item with the specified key.

> [!NOTE]
> Each output gate has a corresponding interface that defines the required structure of its class and `run()` method. For URL Selection, see {{domxref("SharedStorageSelectURLOperation")}}.

> [!NOTE]
> It is possible to define and register multiple operations in the same shared storage worklet module script with different names; see {{domxref("SharedStorageOperation")}} for an example.

