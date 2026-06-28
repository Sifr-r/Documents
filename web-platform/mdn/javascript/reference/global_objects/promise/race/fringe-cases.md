# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `promiseState` function still runs asynchronously, because there is no way to synchronously get a promise's value (i.e., without `then()` or `await`), even when it is already settled. However, `promiseState()` always fulfills within one tick and never actually waits for any promise's settlement.

