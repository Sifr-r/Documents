# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You generally wouldn't use this constructor manually; instead,
> you'd use the {{domxref("WritableStream.getWriter()")}} method.

## Exceptions

- {{jsxref("TypeError")}}
  - : The provided `stream` value is not a {{domxref("WritableStream")}}, or it
    is locked to another writer already.

