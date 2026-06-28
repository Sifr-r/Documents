# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : This can be thrown in any case where the start, end or duration might be ambiguous:
    - Both `endMark` and `measureOptions` are specified.
    - `measureOptions` is specified with `duration` but without specifying either `start` or `end`.
    - `measureOptions` is specified with all of `start`, `end`, and `duration`.

- `SyntaxError` {{domxref("DOMException")}}
  - : The named mark does not exist.
    - An end mark is specified using either `endMark` or `measureOptions.end`, but there is no {{domxref('PerformanceMark')}} in the performance buffer with the matching name.
    - An end mark is specified using either `endMark` or `measureOptions.end`, but it cannot be converted to match that of a read only attribute in the {{domxref("PerformanceTiming")}} interface.
    - A start mark is specified using either `startMark` or `measureOptions.start`, but there is no {{domxref('PerformanceMark')}} in the performance buffer with the matching name.
    - A start mark is specified using either `startMark` or `measureOptions.start`, but it cannot be converted to match that of a read only attribute in the {{domxref("PerformanceTiming")}} interface.

- `DataCloneError` {{domxref("DOMException")}}
  - : The `measureOptions.detail` value is non-`null` and cannot be serialized using the HTML "StructuredSerialize" algorithm.

- {{jsxref("RangeError")}}
  - : The `measureOptions.detail` value is non-`null` and memory cannot be allocated during serialization using the HTML "StructuredSerialize" algorithm.

