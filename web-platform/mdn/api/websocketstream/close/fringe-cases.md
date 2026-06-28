# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Depending on the server setup and status code you use, the server may choose to ignore a custom code in favor of a valid code that is correct for the closing reason. Valid codes are 1000, and any code within the range 3000 to 4999, inclusive.

## Exceptions

- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if the provided `reason` is longer than the maximum allowed length of 123 bytes.

