# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > A high value such as `9.0` or `10.0` might make the recognition engine erroneously recognize other phrases as the specified phrase. Therefore, such values should be used rarely when constructing `SpeechRecognitionPhrase` objects.

## Exceptions

- `SyntaxError` {{domxref("DOMException")}}
  - : The specified `boost` value is less than `0.0` or greater than `10.0`.

