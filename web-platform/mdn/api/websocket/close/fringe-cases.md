# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The process of closing the connection begins with a [closing handshake](https://www.rfc-editor.org/info/rfc6455/#section-1.4), and the `close()` method does not discard previously-sent messages before starting that closing handshake; even if the user agent is still busy sending those messages, the handshake will only start after the messages are sent.

    > [!NOTE]
    > Because [UTF-8 uses two to four bytes](/en-US/docs/Glossary/UTF-8) to encode any non-[ASCII](/en-US/docs/Glossary/ASCII) characters, a 123-character `reason` value containing non-ASCII characters would exceed the 123-byte limit.

## Exceptions

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if [`code`](#code) is neither an integer equal to `1000` nor an integer in the range `3000` – `4999`.
- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if the UTF-8-encoded [`reason`](#reason) value is longer than 123 bytes.

